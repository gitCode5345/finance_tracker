import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/presentation/screens/auth/main_page/main_screen.dart';
import 'package:finance_tracker/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:finance_tracker/presentation/screens/auth/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(0, 208, 158, 1.0),
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
            loading: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
            authenticated: (user) => MainScreen(user: user),
            unauthenticated: () => WelcomeScreen(),

            error: (message) => SignInScreen(),
          );
        },
      ),
    );
  }
}
