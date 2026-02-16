import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/data/models/balance/balance.dart';
import 'package:finance_tracker/data/models/extensions/transactions_extension.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/filter_button.dart';
import 'package:finance_tracker/presentation/widgets/green_container.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:finance_tracker/presentation/widgets/transaction_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/data/models/transactions_get_count/transactions_get_count.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTransactions = 0;
  String _selectedPeriod = 'daily';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        final view = state.maybeWhen(
          loading: (v) => v,
          updated: (v) => v,
          orElse: () => null
        );

        if (view?.currentPeriod != null && view?.currentPeriod != _selectedPeriod) {
          _selectedPeriod = view!.currentPeriod!;
        }
        
        final totalBalance = view?.balance ?? Balance();
        final List<Transaction> transactions = view?.transactions ?? <Transaction>[];
        final countTransactions = view?.countTransactions ?? TransactionsGetCount(firstPage: 0, lastPage: 49);
        final hasReachedMax = view?.hasReachedMax ?? false;

        final balance = totalBalance.totalBalance.toStringAsFixed(2);
        final expense = transactions.totalExpense.toStringAsFixed(2);

        return Column(
          children: [
            HeaderWidget(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 5,
                left: 24.0,
                right: 24.0,
                bottom: 24.0
              ),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome, ${widget.user.firstName}!',
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal
                          )
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none)
                        )
                      ]
                    ),
                    const SizedBox(height: 24.0),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('assets/images/Income.svg', width: 12, height: 12),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'Total balance',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal
                                    )
                                  )
                                ]
                              ),
                              Text(
                                '$balance\$',
                                style: const TextStyle(
                                  color: AppColors.backgroundLight,
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  height: 1.5
                                )
                              )
                            ]
                          ),
                          const VerticalDivider(
                            color: AppColors.secondary,
                            indent: 5.0,
                            endIndent: 5.0,
                            thickness: 2,
                            width: 42
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('assets/images/Expense.svg', width: 12, height: 12),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'Total expense',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal
                                    )
                                  )
                                ]
                              ),
                              Text(
                                '$expense\$',
                                style: const TextStyle(
                                  color: AppColors.accentBlue,
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  height: 1.5
                                )
                              )
                            ]
                          )
                        ]
                      )
                    ),
                    const SizedBox(height: 10.0)
                  ]
                )
              ]
            ),
            Expanded(
              child: BodyContainerWidget(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxWidth = constraints.maxWidth * 0.8;
                    return SizedBox(
                      width: maxWidth,
                      child: Column(
                        children: [
                          const SizedBox(height: 40.0),
                          Expanded(
                            child: Column(
                              children: [
                                GreenContainer(
                                  width: maxWidth,
                                  height: 60.0,
                                  padding: const EdgeInsets.all(8.0),
                                  radius: const BorderRadius.all(Radius.circular(22)),
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildFilterButton(
                                        context,
                                        'Daily',
                                        'daily',
                                        _selectedPeriod,
                                        countTransactions: countTransactions,
                                        onPressed: () {
                                          setState(() => _selectedPeriod = 'daily');
                                          context.read<TransactionsBloc>().add(TransactionsEvent.getTransactions(period: 'daily', count: countTransactions));
                                        }
                                      ),
                                      buildFilterButton(
                                        context,
                                        'Weekly',
                                        'weekly',
                                        _selectedPeriod,
                                        countTransactions: countTransactions,
                                        onPressed: () {
                                          setState(() => _selectedPeriod = 'weekly');
                                          context.read<TransactionsBloc>().add(TransactionsEvent.getTransactions(period: 'weekly', count: countTransactions));
                                        }
                                      ),
                                      buildFilterButton(
                                        context,
                                        'Monthly',
                                        'monthly',
                                        _selectedPeriod,
                                        countTransactions: countTransactions,
                                        onPressed: () {
                                          setState(() => _selectedPeriod = 'monthly');
                                          context.read<TransactionsBloc>().add(TransactionsEvent.getTransactions(period: 'monthly', count: countTransactions));
                                        }
                                      )
                                    ]
                                  )
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: state.maybeWhen(
                                    loading: (view) => const Center(child: CircularProgressIndicator()),
                                    error: (msg) => Center(child: Text('Error: $msg')),
                                    updated: (view) {
                                      final transactions = view.transactions ?? <Transaction>[];
                                      if (transactions.isEmpty) {
                                        return const Center(child: Text('No transactions found'));
                                      }
                                      final pageSize = countTransactions.lastPage - countTransactions.firstPage + 1;
                                      final shouldShowSpinner = !hasReachedMax && transactions.length >= pageSize;

                                      return NotificationListener<ScrollNotification>(
                                        onNotification: (notification) {
                                          if (shouldShowSpinner && notification.metrics.pixels >= notification.metrics.maxScrollExtent - 200) {
                                            context.read<TransactionsBloc>().add(LoadMoreTransactionsEvent());
                                          }
                                          return true;
                                        },
                                        child: ListView.builder(
                                          itemCount: transactions.length + (shouldShowSpinner ? 1 : 0),
                                          physics: const AlwaysScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            if (index < transactions.length) {
                                              return buildTransactionItem(transactions[index]);
                                            } else {
                                              return const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 20),
                                                child: Center(child: CircularProgressIndicator())
                                              );
                                            }
                                          }
                                        )
                                      );
                                    },
                                    orElse: () => const SizedBox.shrink()
                                  )
                                )
                              ]
                            )
                          ),
                          const SizedBox(height: 5)
                        ]
                      )
                    );
                  }
                )
              )
            )
          ]
        );
      }
    );
  }
}
