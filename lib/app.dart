import 'package:finance_tracker/app_view.dart';
import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/data/services/transactions/transactions_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/data/services/auth/auth_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authService: AuthService(),
          )..add(const AuthEvent.checkAuthEvent()),
        ),
        BlocProvider<TransactionsBloc>(
          create: (context) => TransactionsBloc(
            transactionsService: TransactionsService()
          )..add(const TransactionsEvent.getTransactions(period: 'daily')),
        ),
      ],
      child: MyAppView(),
    );
  }
}
