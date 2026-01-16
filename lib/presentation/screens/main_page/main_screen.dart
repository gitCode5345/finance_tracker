import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/presentation/screens/home/home_screen.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/green_container.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
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
  final List<Widget> _pages = [
    HomeScreen(),
    Text('Statistics Page'),
    Text('Settings Page'),
    Text('Transactions Page'),
    Text('Profile Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.user.isNewUser
          ? _buildOnBoardingPage(context)
          : Column(
              children: [
                HeaderWidget(
                  padding: const EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0, bottom: 24.0,),
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Welcome, ${widget.user.firstName}!',
                              style: TextStyle(
                                color: Color.fromRGBO(5, 34, 36, 1.0),
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
                                          color: Color.fromRGBO(5, 34, 36, 1.0),
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
                                    '7,7883\$',
                                    style: TextStyle(
                                      color: Color.fromRGBO(241, 255, 243, 1.0),
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
                                color: Color.fromRGBO(223, 247, 226, 1.0),
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
                                          color: Color.fromRGBO(5, 34, 36, 1.0),
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
                                    '7,7883\$',
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 104, 255, 1.0),
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
                    child: _pages[selectedPageIndex],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: !widget.user.isNewUser
          ? GreenContainer(
              width: double.infinity,
              height: 108.0,
              radius: BorderRadius.only(
                topLeft: Radius.circular(70.0),
                topRight: Radius.circular(70.0),
              ),
              widget: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedPageIndex = 0;
                        });
                      },
                      icon: SvgPicture.asset(
                        selectedPageIndex == 0
                            ? 'assets/images/Home_1.svg'
                            : 'assets/images/Home.svg',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedPageIndex = 1;
                        });
                      },
                      icon: SvgPicture.asset(
                        selectedPageIndex == 1
                            ? 'assets/images/Analysis_1.svg'
                            : 'assets/images/Analysis.svg',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedPageIndex = 2;
                        });
                      },
                      icon: SvgPicture.asset(
                        selectedPageIndex == 2
                            ? 'assets/images/Transactions_1.svg'
                            : 'assets/images/Transactions.svg',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedPageIndex = 3;
                        });
                      },
                      icon: SvgPicture.asset(
                        selectedPageIndex == 3
                            ? 'assets/images/Category_1.svg'
                            : 'assets/images/Category.svg',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedPageIndex = 4;
                        });
                      },
                      icon: SvgPicture.asset(
                        selectedPageIndex == 4
                            ? 'assets/images/Profile_1.svg'
                            : 'assets/images/Profile.svg',
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildOnBoardingPage(BuildContext context) {
    return OnBoardingSectionWidget(
      onFinish: () {
        context.read<AuthBloc>().add(RegisterUserSuccess(user: widget.user));
      },
    );
  }
}
