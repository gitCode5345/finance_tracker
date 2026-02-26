import 'package:finance_tracker/business/bloc/analytics_bloc/analytics_view.dart';
import 'package:finance_tracker/data/models/extensions/transactions_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finance_tracker/data/services/transactions/transactions_service.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';
part 'analytics_bloc.freezed.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  TransactionsService transactionsService;

  AnalyticsBloc({required this.transactionsService}) : super(_Initial()) {
    on<LoadAnalyticsEvent>(onLoadAnalytics);
  }

  Future<void> onLoadAnalytics(LoadAnalyticsEvent e, Emitter emit) async {
    try {
      final previousData = state.maybeWhen(
        loading: (view) => view,
        loaded: (view) => view,
        orElse: () => AnalyticsView(
          data: [], 
          totalIncome: 0, 
          totalExpense: 0, 
          period: e.period,
        ),
      );

      emit(Loading(view: previousData));

      final transactions = await transactionsService.getTransactionsForAnalytics(e.period);

      final income = transactions.totalIncome;
      final expenses = transactions.totalExpense;

      final data = transactions.calculateChartData(e.period);

      emit(Loaded(view: AnalyticsView(
        data: data,
        totalIncome: income,
        totalExpense: expenses,
        period: e.period,
      )));

    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
