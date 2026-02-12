import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/core/const/app_colors.dart';
import 'package:finance_tracker/core/const/transactions_period.dart';
import 'package:finance_tracker/data/models/extensions/transactions_extension.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/green_container.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_tracker/presentation/widgets/filter_button.dart';
import 'package:finance_tracker/data/models/transactions_get_count/transactions_get_count.dart';
import 'package:finance_tracker/presentation/widgets/small_icon_button.dart';
import 'package:finance_tracker/presentation/widgets/summary_item.dart';

class AnalyticsScreen extends StatefulWidget {
  final User user;
  const AnalyticsScreen({super.key, required this.user});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  String _activeViewMode = TransactionsPeriod.daily;
  List<Transaction> _localTransactions = [];
  String? _lastFetchedDataPeriod;

  @override
  void initState() {
    super.initState();
    _fetchDataForView(_activeViewMode);
  }

  void _fetchDataForView(String viewMode) {
    setState(() {
      _activeViewMode = viewMode;
    });

    String dataPeriodNeeded;
    switch (viewMode) {
      case TransactionsPeriod.daily:
        dataPeriodNeeded = TransactionsPeriod.weekly;
        break;
      case TransactionsPeriod.weekly:
        dataPeriodNeeded = TransactionsPeriod.monthly;
        break;
      case TransactionsPeriod.monthly:
        dataPeriodNeeded = TransactionsPeriod.yearly;
        break;
      case TransactionsPeriod.yearly:
      default:
        dataPeriodNeeded = TransactionsPeriod.yearly;
    }

    _lastFetchedDataPeriod = dataPeriodNeeded;

    if (viewMode == TransactionsPeriod.monthly) {
      context.read<TransactionsBloc>().service.getAllTransactions(TransactionsGetCount(firstPage: 0, lastPage: 999)).then((res) {
        final cutoff = DateTime.now().subtract(Duration(days: 365));
        setState(() {
          _localTransactions = res.where((t) => !t.date.toLocal().isBefore(cutoff)).toList();
        });
      }).catchError((_) {});
      return;
    }

    if (viewMode == TransactionsPeriod.yearly) {
      context.read<TransactionsBloc>().service.getAllTransactions(TransactionsGetCount(firstPage: 0, lastPage: 999)).then((res) {
        final cutoff = DateTime.now().subtract(Duration(days: 365 * 3));
        setState(() {
          _localTransactions = res.where((t) => !t.date.toLocal().isBefore(cutoff)).toList();
        });
      }).catchError((_) {});
      return;
    }

    context.read<TransactionsBloc>().add(TransactionsEvent.getTransactionsSilent(period: dataPeriodNeeded, count: TransactionsGetCount(firstPage: 0, lastPage: 49)));
  }

  String _formatYAxisValue(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}k';
    }
    return value.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        state.maybeWhen(
          silentUpdated: (view) {
            if (view.currentPeriod == _lastFetchedDataPeriod) {
              setState(() {
                _localTransactions = view.transactions ?? <Transaction>[];
              });
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<TransactionsBloc, TransactionsState>(
        builder: (context, state) {
        
        final List<Transaction> transactions = state.maybeWhen(
          updated: (view) => view.transactions ?? <Transaction>[],
          loading: (view) => view?.transactions ?? <Transaction>[],
          orElse: () => <Transaction>[],
        );

        final usingLocal = _lastFetchedDataPeriod != null && _lastFetchedDataPeriod!.isNotEmpty && _localTransactions.isNotEmpty;
        final sourceTransactions = usingLocal ? _localTransactions : transactions;

        final dataToUse = usingLocal
          ? sourceTransactions
          : (_activeViewMode == TransactionsPeriod.daily ? sourceTransactions : sourceTransactions.filterByPeriod(_activeViewMode));

        final chartData = dataToUse.calculateChartData(_activeViewMode);

        final totalIncome = dataToUse.totalIncome;
        final totalExpense = dataToUse.totalExpense;

        double maxY = 0;
        for (var point in chartData) {
          if (point.income > maxY) maxY = point.income;
          if (point.expense > maxY) maxY = point.expense;
        }
        if (maxY == 0) maxY = 100;

        maxY = maxY * 1.2; 
        final double interval = maxY / 4;

        return Column(
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
                  'Analytics',
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
                  alignment: Alignment.topRight,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BodyContainerWidget(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxWidth = constraints.maxWidth * 0.9;
                    return SizedBox(
                      width: maxWidth,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 40.0),
                            GreenContainer(
                              width: maxWidth,
                              height: 60.0,
                              radius: BorderRadius.circular(22.0),
                              widget: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    buildFilterButton(
                                      context,
                                      'Daily',
                                      TransactionsPeriod.daily,
                                      _activeViewMode,
                                      TransactionsGetCount(firstPage: 0, lastPage: 49),
                                      onPressed: () => _fetchDataForView(TransactionsPeriod.daily),
                                    ),
                                    buildFilterButton(
                                      context,
                                      'Weekly',
                                      TransactionsPeriod.weekly,
                                      _activeViewMode,
                                      TransactionsGetCount(firstPage: 0, lastPage: 49),
                                      onPressed: () => _fetchDataForView(TransactionsPeriod.weekly),
                                    ),
                                    buildFilterButton(
                                      context,
                                      'Monthly',
                                      TransactionsPeriod.monthly,
                                      _activeViewMode,
                                      TransactionsGetCount(firstPage: 0, lastPage: 49),
                                      onPressed: () => _fetchDataForView(TransactionsPeriod.monthly),
                                    ),
                                    buildFilterButton(
                                      context,
                                      'Yearly',
                                      TransactionsPeriod.yearly,
                                      _activeViewMode,
                                      TransactionsGetCount(firstPage: 0, lastPage: 49),
                                      onPressed: () => _fetchDataForView(TransactionsPeriod.yearly),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            
                            GreenContainer(
                              radius: BorderRadius.circular(30.0),
                              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              width: maxWidth,
                              height: 320.0,
                              widget: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Income & Expense',
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                          Row(
                                        children: [
                                          SmallIconButton(asset: 'assets/images/find.svg'),
                                          const SizedBox(width: 8.0),
                                          SmallIconButton(asset: 'assets/images/calendar.svg'),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Expanded(
                                    child: BarChart(
                                      BarChartData(
                                        maxY: maxY,
                                        minY: 0,
                                        gridData: FlGridData(
                                          show: true,
                                          drawVerticalLine: false,
                                          drawHorizontalLine: true,
                                          horizontalInterval: interval,
                                          getDrawingHorizontalLine: (value) => FlLine(
                                            color: Colors.grey.withValues(alpha: 0.1),
                                            strokeWidth: 1,
                                          ),
                                        ),
                                        borderData: FlBorderData(
                                          show: true,
                                          border: Border(
                                            bottom: BorderSide(
                                              color: AppColors.borderGrafik
                                            )
                                          )
                                        ),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              interval: interval,
                                              reservedSize: 35,
                                              getTitlesWidget: (value, meta) {
                                                if (value == 0) return const SizedBox.shrink();
                                                return SideTitleWidget(
                                                  meta: meta,
                                                  space: 1,
                                                  child: Text(
                                                    _formatYAxisValue(value),
                                                    style: const TextStyle(
                                                      color: AppColors.leftTitles,
                                                      fontFamily: 'LeagueSpartan',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) => _bottomTitles(value, meta, _activeViewMode),
                                              reservedSize: 30,
                                            ),
                                          ),
                                        ),
                                        barGroups: chartData.map((data) {
                                          return BarChartGroupData(
                                            x: data.x,
                                            barsSpace: 4, 
                                            barRods: [
                                              BarChartRodData(
                                                toY: data.income,
                                                color: AppColors.primary,
                                                width: 6,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              BarChartRodData(
                                                toY: data.expense,
                                                color: AppColors.accentBlue,
                                                width: 6,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SummaryItem(
                                  label: 'Income',
                                  amount: totalIncome.toStringAsFixed(2),
                                  iconPath: 'assets/images/Income.svg',
                                  color: AppColors.primary,
                                ),
                                SummaryItem(
                                  label: 'Expense',
                                  amount: totalExpense.toStringAsFixed(2),
                                  iconPath: 'assets/images/Expense.svg',
                                  color: AppColors.accentBlue,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
        },
      ),
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta, String activeViewMode) {
    const style = TextStyle(
      color: AppColors.borderGrafik,
      fontWeight: FontWeight.w400,
      fontFamily: 'LeagueSpartan',
      fontSize: 14,
      height: 1.5
    );
    String text = '';
    int index = value.toInt();

    switch (activeViewMode) {
      case TransactionsPeriod.daily:
        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        if (index >= 0 && index < days.length) text = days[index];
        break;
      case TransactionsPeriod.weekly:
        text = 'Week ${index + 1}';
        break;
      case TransactionsPeriod.monthly:
      case TransactionsPeriod.yearly:
        if (activeViewMode == TransactionsPeriod.monthly) {
          final now = DateTime.now();
          final monthOffset = index - 11;
          final dt = DateTime(now.year, now.month + monthOffset, 1);
          const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
          text = months[dt.month - 1];
        } else {
          final now = DateTime.now();
          final years = 3;
          final year = now.year - (years - 1 - index);
          text = year.toString();
        }
        break;
    }

    return SideTitleWidget(
      meta: meta, 
      space: 4, 
      child: Text(text, style: style),
    );
  }

  
}
