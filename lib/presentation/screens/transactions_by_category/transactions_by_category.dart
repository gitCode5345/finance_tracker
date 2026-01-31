import 'package:finance_tracker/business/bloc/category_bloc/category_bloc.dart';
import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/data/models/category/category.dart';
import 'package:finance_tracker/data/models/extensions/transactions_extension.dart';
import 'package:finance_tracker/presentation/screens/add_transaction/add_transaction_screen.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:finance_tracker/presentation/widgets/transaction_item_widget.dart';
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
            padding: const EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0, bottom: 24.0),
            children: [
              Text(
                category.name,
                style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    iconSize: 32.0
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
          Expanded(
            child: BodyContainerWidget(
              child: BlocBuilder<TransactionsBloc, TransactionsState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: state.maybeWhen(
                          loading: (_) => Center(child: CircularProgressIndicator()),
                          updated: (transactions, _) {
                            final grouped = transactions.groupByYearAndMonth();

                            if (grouped.isEmpty) {
                              return const Center(child: Text('No transactions found'));
                            }

                            return ListView(
                              children: grouped.entries.map((yearEntry) {
                                final year = yearEntry.key;
                                final months = yearEntry.value;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Center(
                                        child: Text(
                                          year.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ...months.entries.map((monthEntry) {
                                      final month = monthEntry.key;
                                      final items = monthEntry.value;
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                                            child: Text(
                                              month,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          ...items.map(
                                            (transaction) => buildTransactionItem(transaction),
                                          ),
                                        ],
                                      );
                                    }),
                                  ],
                                );
                              }).toList(),
                            );
                          },
                          orElse: () => Center(child: Text('Something went wrong')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            minimumSize: const Size(200.0, 50.0),
                          ),
                          onPressed: () {
                            context.read<CategoryBloc>().add(const CategoryEvent.loadCategories());
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => AddTransactionScreen()
                              )
                            );
                          },
                          child: const Text(
                            'Add expense',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              color: AppColors.textButton,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
