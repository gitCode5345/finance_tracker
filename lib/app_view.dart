import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/presentation/screens/main_page/main_screen.dart';
import 'package:finance_tracker/presentation/screens/auth/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) {
          return current.maybeWhen(
            authenticated: (_) => true,
            unauthenticated: () => true,
            orElse: () => false,
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (user) => MainScreen(user: user),
            unauthenticated: () => WelcomeScreen(),
            orElse: () => WelcomeScreen()
          );
        },
      ),
    );
  }
}
