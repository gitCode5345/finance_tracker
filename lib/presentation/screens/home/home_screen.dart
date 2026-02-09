import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/data/models/extensions/transactions_extension.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/filter_button.dart';
import 'package:finance_tracker/presentation/widgets/green_container.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:finance_tracker/presentation/widgets/transaction_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/core/const/app_colors.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTransactions = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        final currentPeriod = state.maybeWhen(
          loading: (period, _) => period,
          updated: (_, period) => period,
          orElse: () => 'daily',
        );

        
        final transactions = state.maybeWhen(
          loading: (currentPeriod, transactions) => transactions ?? [],
          updated: (transactions, _) => transactions,
          orElse: () => <Transaction>[],
        );

        final balance = transactions.totalBalance.toStringAsFixed(2);
        final expense = transactions.totalExpense.toStringAsFixed(2);

        return Column(
          children: [
            HeaderWidget(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 5,
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome, ${widget.user.firstName}!',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.notifications_none),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/Income.svg',
                                    width: 12,
                                    height: 12,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Total balance',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '$balance\$',
                                style: TextStyle(
                                  color: AppColors.backgroundLight,
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: AppColors.secondary,
                            indent: 5.0,
                            endIndent: 5.0,
                            thickness: 2,
                            width: 42,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/Expense.svg',
                                    width: 12,
                                    height: 12,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Total expense',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '$expense\$',
                                style: TextStyle(
                                  color: AppColors.accentBlue,
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ],
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
                          const GreenContainer(
                            widget: Text('Future widget'),
                            radius: BorderRadius.all(Radius.circular(12)),
                          ),
                          const SizedBox(height: 20.0),
                          Expanded(
                            child: Column(
                                  children: [
                                    GreenContainer(
                                      width: maxWidth,
                                      height: 60.0,
                                      padding: const EdgeInsets.all(8.0),
                                      widget: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          buildFilterButton(
                                            context,
                                            'Daily',
                                            'daily',
                                            currentPeriod!,
                                          ),
                                          buildFilterButton(
                                            context,
                                            'Weekly',
                                            'weekly',
                                            currentPeriod,
                                          ),
                                          buildFilterButton(
                                            context,
                                            'Monthly',
                                            'monthly',
                                            currentPeriod,
                                          ),
                                        ],
                                      ),
                                      radius: const BorderRadius.all(
                                        Radius.circular(22),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Expanded(
                                      child: state.maybeWhen(
                                        loading: (_, _) => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        error: (msg) =>
                                            Center(child: Text('Error: $msg')),
                                        updated: (transactions, _) =>
                                            transactions.isEmpty
                                            ? const Center(
                                                child: Text("No transactions"),
                                              )
                                            : ListView.builder(
                                                itemCount: transactions.length,
                                                itemBuilder: (context, index) {
                                                  return buildTransactionItem(
                                                    transactions[index],
                                                  );
                                                },
                                              ),
                                        orElse: () => const SizedBox.shrink(),
                                      ),
                                    ),
                                  ],
                                )
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
