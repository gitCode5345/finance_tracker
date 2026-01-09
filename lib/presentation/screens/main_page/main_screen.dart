import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:finance_tracker/presentation/widgets/on_boarding_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: user.isNewUser? _buildOnBoardingPage(context) : Column(
        children: [
          HeaderWidget(
            padding: const EdgeInsets.only(top: 60.0, left: 24.0, right: 24.0, bottom: 24.0,),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome, ${user.firstName}!',
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
                    SizedBox(height: 20),
                    Text(
                      'total balance: \$12,345.67',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: BodyContainerWidget(
              child: Center(
                child: SingleChildScrollView(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutUser());
                    },
                    child: Text('Logout'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: !user.isNewUser ? Container(
        width: double.infinity,
        height: 108.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(223, 247, 226, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70.0),
            topRight: Radius.circular(70.0),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.home)),
              IconButton(onPressed: () {}, icon: Icon(Icons.pie_chart)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            ],
          ),
        ),
      ) : null,
    );
  }

  Widget _buildOnBoardingPage(BuildContext context) {
    return OnBoardingSectionWidget(
      onFinish: () {
        context.read<AuthBloc>().add(RegisterUserSuccess(user: user));
      },
    );
  }
}
