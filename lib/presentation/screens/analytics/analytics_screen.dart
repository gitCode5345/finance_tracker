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
import 'package:flutter_svg/flutter_svg.dart';

class AnalyticsScreen extends StatefulWidget {
  final User user;
  const AnalyticsScreen({super.key, required this.user});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  // Зберігаємо, яка кнопка фільтру зараз активна в UI (Daily, Weekly...)
  String _activeViewMode = TransactionsPeriod.daily;

  @override
  void initState() {
    super.initState();
    // При ініціалізації завантажуємо дані для дефолтного view
    _fetchDataForView(TransactionsPeriod.daily);
  }

  /// Цей метод вирішує, які дані потрібні з бази для обраного виду графіка
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
        dataPeriodNeeded = TransactionsPeriod.yearly; 
        break;
      default:
        dataPeriodNeeded = TransactionsPeriod.daily;
    }

    context.read<TransactionsBloc>().add(
      GetTransactionsEvent(period: dataPeriodNeeded),
    );
  }

  String _formatYAxisValue(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}k';
    }
    return value.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        
        // ВИПРАВЛЕННЯ 1: Явно вказуємо тип List<Transaction>
        final List<Transaction> transactions = state.maybeWhen(
          updated: (transactions, _) => transactions,
          loading: (_, transactions) => transactions ?? <Transaction>[],
          orElse: () => <Transaction>[],
        );

        // Тепер методи calculateChartData, totalIncome, totalExpense будуть доступні
        final chartData = transactions.calculateChartData(_activeViewMode);
        
        final totalIncome = transactions.totalIncome;
        final totalExpense = transactions.totalExpense;

        // Знаходимо максимальне значення Y для масштабу графіка
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
                            // Фільтри
                            GreenContainer(
                              width: maxWidth,
                              height: 60.0,
                              radius: BorderRadius.circular(22.0),
                              widget: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    _buildCustomFilterBtn('Daily', TransactionsPeriod.daily),
                                    _buildCustomFilterBtn('Weekly', TransactionsPeriod.weekly),
                                    _buildCustomFilterBtn('Monthly', TransactionsPeriod.monthly),
                                    _buildCustomFilterBtn('Yearly', TransactionsPeriod.yearly),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            
                            // Графік
                            GreenContainer(
                              radius: BorderRadius.circular(30.0),
                              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              width: maxWidth,
                              height: 320.0,
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          _buildIconBtn('assets/images/find.svg'),
                                          const SizedBox(width: 8.0),
                                          _buildIconBtn('assets/images/calendar.svg'),
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
                                              interval: interval, // ВАЖЛИВО: Крок шкали
                                              reservedSize: 35,   // Місце під текст зліва
                                              getTitlesWidget: (value, meta) {
                                                if (value == 0) return const SizedBox.shrink(); // Можна приховати 0, якщо хочете
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
                                              getTitlesWidget: (value, meta) => _bottomTitles(value, meta),
                                              reservedSize: 30,
                                            ),
                                          ),
                                        ),
                                        barGroups: chartData.map((data) {
                                          return BarChartGroupData(
                                            x: data.x,
                                            barsSpace: 4, 
                                            barRods: [
                                              // Income Bar
                                              BarChartRodData(
                                                toY: data.income,
                                                color: AppColors.primary,
                                                width: 6,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              // Expense Bar
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
                            
                            // Інформація про суми знизу
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildSummaryItem(
                                  'Income', 
                                  totalIncome.toStringAsFixed(2), 
                                  'assets/images/Income.svg',
                                  AppColors.primary
                                ),
                                _buildSummaryItem(
                                  'Expense', 
                                  totalExpense.toStringAsFixed(2), 
                                  'assets/images/Expense.svg',
                                  AppColors.accentBlue
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
    );
  }

  // Віджет підписів знизу графіка
  Widget _bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.borderGrafik,
      fontWeight: FontWeight.w400,
      fontFamily: 'LeagueSpartan',
      fontSize: 14,
      height: 1.5
    );
    String text = '';
    int index = value.toInt();

    switch (_activeViewMode) {
      case TransactionsPeriod.daily:
        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        if (index >= 0 && index < days.length) text = days[index];
        break;
      case TransactionsPeriod.weekly:
        text = '${index + 1} wk';
        break;
      case TransactionsPeriod.monthly:
      case TransactionsPeriod.yearly:
        const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        if (index >= 0 && index < months.length) text = months[index];
        break;
    }

    // ВИПРАВЛЕННЯ 2: Використовуємо meta замість axisSide, оскільки це SideTitleWidget
    return SideTitleWidget(
      meta: meta, 
      space: 4, 
      child: Text(text, style: style),
    );
  }

  // Кастомна кнопка фільтру
  Widget _buildCustomFilterBtn(String title, String mode) {
    final isActive = _activeViewMode == mode;
    return Expanded(
      child: SizedBox(
        height: 50.0,
        child: TextButton(
          onPressed: () => _fetchDataForView(mode),
          style: TextButton.styleFrom(
            backgroundColor: isActive ? AppColors.primary : Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconBtn(String asset) {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.primary
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(asset),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String amount, String iconPath, Color color) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          width: 25.0,
          height: 25.0,
        ),
        const SizedBox(height: 5.0),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '\$$amount',
          style: TextStyle(
            color: color,
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
