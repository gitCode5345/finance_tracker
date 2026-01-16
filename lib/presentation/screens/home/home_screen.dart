import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/presentation/widgets/green_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTransactions = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth * 0.8;
        return SizedBox(
          width: maxWidth,
          child: Column(
            children: [
              SizedBox(height: 40.0),
              GreenContainer(
                widget: Text('Future widget'),
                radius: BorderRadius.all(Radius.circular(12)),
              ),
              SizedBox(height: 20.0),
              GreenContainer(
                width: maxWidth,
                height: 60.0,
                padding: EdgeInsets.all(8.0),
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTransactions = 0;
                            context.read<TransactionsBloc>().add(
                              const TransactionsEvent.getTransactions(
                                period: 'daily',
                              ),
                            );
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: selectedTransactions == 0
                              ? Color.fromRGBO(0, 208, 158, 1.0)
                              : null,
                        ),
                        child: Text(
                          'Daily',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            height: 1.5,
                            color: Color.fromRGBO(5, 34, 36, 1.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTransactions = 1;
                            context.read<TransactionsBloc>().add(
                              const TransactionsEvent.getTransactions(
                                period: 'weekly',
                              ),
                            );
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: selectedTransactions == 1
                              ? Color.fromRGBO(0, 208, 158, 1.0)
                              : null,
                        ),
                        child: Text(
                          'Weekly',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            height: 1.5,
                            color: Color.fromRGBO(5, 34, 36, 1.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTransactions = 2;
                            context.read<TransactionsBloc>().add(
                              const TransactionsEvent.getTransactions(
                                period: 'monthly',
                              ),
                            );
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: selectedTransactions == 2
                              ? Color.fromRGBO(0, 208, 158, 1.0)
                              : null,
                        ),
                        child: Text(
                          'Monthly',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            height: 1.5,
                            color: Color.fromRGBO(5, 34, 36, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                radius: BorderRadius.all(Radius.circular(22)),
              ),
              SizedBox(height: 5),
              Expanded(
                child: BlocBuilder<TransactionsBloc, TransactionsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error) => Center(child: Text('Error: $error')),
                      updated: (transactions) => ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final tx = transactions[index];
                          final date = tx.createdAt;
                          final String fullMonthName ='${DateFormat('MMMM').format(date.toLocal())} ${date.toLocal().day}';
                          return ListTile(
                            title: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/food.svg',
                                    width: 57,
                                    height: 53,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tx.type.name,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0,
                                              height: 1.5,
                                              color: Color.fromRGBO(5, 34, 36, 1.0,),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          Text(
                                            '${DateFormat('HH:mm').format(date.toLocal())} - $fullMonthName',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: Color.fromRGBO(0, 208, 157, 1.0),
                                    thickness: 1,
                                    width: 35,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        tx.type.name,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(
                                    color: Color.fromRGBO(0, 208, 157, 1.0),
                                    thickness: 1,
                                    width: 35,
                                  ),
                                  Text(
                                    tx.amount.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
