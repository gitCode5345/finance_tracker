import 'package:finance_tracker/business/bloc/category_bloc/category_bloc.dart';
import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/data/models/category/category.dart';
import 'package:finance_tracker/data/models/extensions/transactions_extension.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/presentation/screens/add_transaction/add_transaction_screen.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:finance_tracker/presentation/widgets/transactions_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class TransactionsByCategory extends StatelessWidget {
  final Category category;
  const TransactionsByCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 5,
              left: 20,
              right: 20,
              bottom: 20
            ),
            children: [
              Text(
                category.name,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
                )
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    iconSize: 32.0
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)
                )
              )
            ]
          ),
          Expanded(
            child: BodyContainerWidget(
              child: BlocBuilder<TransactionsBloc, TransactionsState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: state.maybeWhen(
                          loading: (view) => const Center(child: CircularProgressIndicator()),
                          updated: (view) {
                            final transactions = view.transactions ?? <Transaction>[];
                            final grouped = transactions.groupByYearAndMonth();
                            if (grouped.isEmpty) {
                              return const Center(child: Text('No transactions found'));
                            }
                            final hasReachedMax = state.maybeWhen(
                              loading: (v) => v?.hasReachedMax ?? false,
                              updated: (v) => v.hasReachedMax,
                              orElse: () => false
                            );
                            return NotificationListener<ScrollNotification>(
                              onNotification: (notification) {
                                if (!hasReachedMax && notification.metrics.pixels >= notification.metrics.maxScrollExtent - 200) {
                                  context.read<TransactionsBloc>().add(LoadMoreTransactionsEvent());
                                }
                                return true;
                              },
                              child: buildTransactions(grouped)
                            );
                          },
                          orElse: () => const Center(child: Text('Something went wrong'))
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            minimumSize: const Size(200.0, 50.0)
                          ),
                          onPressed: () {
                            context.read<CategoryBloc>().add(const CategoryEvent.loadCategories());
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTransactionScreen()));
                          },
                          child: const Text(
                            'Add expense',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              color: AppColors.textButton
                            )
                          )
                        )
                      )
                    ]
                  );
                }
              )
            )
          )
        ]
      )
    );
  }
}
