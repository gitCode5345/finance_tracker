import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/core/const/app_colors.dart';
import 'package:finance_tracker/core/const/transaction_type.dart';
import 'package:finance_tracker/data/models/extensions/transactions_extension.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:finance_tracker/presentation/widgets/transactions_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  bool tappedIncomeBlock = false;
  bool tappedExpenseBlock = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        final List<Transaction>? transactions = state.maybeWhen(
          loading: (_, transactions) => transactions,
          updated: (transactions, _) => transactions,
          orElse: () => [],
        );

        final groupedTransactions = transactions?.groupByYearAndMonth() ?? {};

        final totalBalance = transactions?.totalBalance ?? 0.0;
        final totalIncome = transactions?.totalIncome ?? 0.0;
        final totalExpenses = transactions?.totalExpense ?? 0.0;

        return Column(
          children: [
            HeaderWidget(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 5,
                left: 20,
                right: 20,
              ),
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'Transactions',
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
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            style: IconButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.notifications_none),
                          ),
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Balance',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            totalBalance.toStringAsFixed(2),
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              height: 1.5,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                tappedIncomeBlock = !tappedIncomeBlock;
                                tappedExpenseBlock = false;
                              });

                              if (tappedIncomeBlock) {
                                context.read<TransactionsBloc>()
                                .add(GetTransactionsByTypeEvent(type: TransactionType.income));
                              } else {
                                context.read<TransactionsBloc>()
                                .add(const GetAllTransactionsEvent());
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: tappedIncomeBlock ? AppColors.accentBlue : Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/Income.svg',
                                      colorFilter: ColorFilter.mode(
                                        tappedIncomeBlock ? Colors.white : AppColors.primary,
                                        BlendMode.srcIn,
                                      ),
                                      height: 24,
                                    ),
                                    Text(
                                      'Income',
                                      style: TextStyle(
                                        color: tappedIncomeBlock ? Colors.white : AppColors.textPrimary,
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        height: 1.5,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      totalIncome.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: tappedIncomeBlock ? Colors.white : AppColors.textPrimary,
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        height: 1.5,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                tappedExpenseBlock = !tappedExpenseBlock;
                                tappedIncomeBlock = false;
                              });

                              if (tappedExpenseBlock) {
                                  context.read<TransactionsBloc>()
                                  .add(GetTransactionsByTypeEvent(type: TransactionType.expense));
                                } else {
                                  context.read<TransactionsBloc>()
                                  .add(const GetAllTransactionsEvent());
                                }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: tappedExpenseBlock ? AppColors.accentBlue : Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/Expense.svg',
                                      colorFilter: ColorFilter.mode(
                                        tappedExpenseBlock ? Colors.white : AppColors.accentBlue,
                                        BlendMode.srcIn,
                                      ),
                                      height: 24,
                                    ),
                                    Text(
                                      'Expenses',
                                      style: TextStyle(
                                        color: tappedExpenseBlock ? Colors.white : AppColors.textPrimary,
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        height: 1.5,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      totalExpenses.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: tappedExpenseBlock ? Colors.white : AppColors.textPrimary,
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        height: 1.5,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: BodyContainerWidget(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: groupedTransactions.isEmpty
                      ? const Center(child: Text('No transactions found'))
                      : buildTransactions(groupedTransactions),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
