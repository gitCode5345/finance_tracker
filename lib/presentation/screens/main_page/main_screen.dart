import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/data/models/transactions_get_count/transactions_get_count.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/presentation/screens/analytics/analytics_screen.dart';
import 'package:finance_tracker/presentation/screens/categories/categories_screen.dart';
import 'package:finance_tracker/presentation/screens/home/home_screen.dart';
import 'package:finance_tracker/presentation/screens/profile/profile_screen.dart';
import 'package:finance_tracker/presentation/screens/transactions/transactions_screen.dart';
import 'package:finance_tracker/presentation/widgets/green_container.dart';
import 'package:finance_tracker/presentation/widgets/on_boarding_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPageIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreen(user: widget.user),
      AnalyticsScreen(user: widget.user),
      TransactionsScreen(),
      CategoriesScreen(),
      ProfileScreen(user: widget.user)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.user.isNewUser
          ? _buildOnBoardingPage(context)
          : IndexedStack(
              index: selectedPageIndex,
              children: pages
            ),
      bottomNavigationBar: !widget.user.isNewUser
          ? GreenContainer(
              width: double.infinity,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(70.0),
                topRight: Radius.circular(70.0)
              ),
              widget: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() => selectedPageIndex = 0);
                        final currentState = context.read<TransactionsBloc>().state;
                        final currentPeriod = currentState.maybeWhen(
                          updated: (view) => view.currentPeriod,
                          silentUpdated: (view) => view.currentPeriod,
                          orElse: () => 'daily'
                        );
                        context.read<TransactionsBloc>().add(
                          TransactionsEvent.getTransactions(
                            period: currentPeriod ?? 'daily',
                            count: const TransactionsGetCount(firstPage: 0, lastPage: 49)
                          )
                        );
                      },
                      icon: SvgPicture.asset(
                        selectedPageIndex == 0 ? 'assets/images/Home_1.svg' : 'assets/images/Home.svg'
                      )
                    ),
                    IconButton(
                      onPressed: () => setState(() => selectedPageIndex = 1),
                      icon: SvgPicture.asset(
                        selectedPageIndex == 1 ? 'assets/images/Analysis_1.svg' : 'assets/images/Analysis.svg'
                      )
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() => selectedPageIndex = 2);
                        context.read<TransactionsBloc>().add(GetAllTransactionsEvent());
                      },
                      icon: SvgPicture.asset(
                        selectedPageIndex == 2 ? 'assets/images/Transactions_1.svg' : 'assets/images/Transactions.svg'
                      )
                    ),
                    IconButton(
                      onPressed: () => setState(() => selectedPageIndex = 3),
                      icon: SvgPicture.asset(
                        selectedPageIndex == 3 ? 'assets/images/Category_1.svg' : 'assets/images/Category.svg'
                      )
                    ),
                    IconButton(
                      onPressed: () => setState(() => selectedPageIndex = 4),
                      icon: SvgPicture.asset(
                        selectedPageIndex == 4 ? 'assets/images/Profile_1.svg' : 'assets/images/Profile.svg'
                      )
                    )
                  ]
                )
              )
            )
          : null
    );
  }

  Widget _buildOnBoardingPage(BuildContext context) {
    return OnBoardingSectionWidget(
      onFinish: () => context.read<AuthBloc>().add(RegisterUserSuccess(user: widget.user))
    );
  }
}
