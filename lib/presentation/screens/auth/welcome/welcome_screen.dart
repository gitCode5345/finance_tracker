import 'package:finance_tracker/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:finance_tracker/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 255, 243, 1.0),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth * 0.7;
          return Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: maxWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo_welcome_screen.svg',
                      width: 110,
                      height: 110,
                    ),
                    const SizedBox(),
                    const Text(
                      'FinWise',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 52,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(0, 208, 158, 1.0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(),
                    const Text(
                      'Your personal finance management app.',
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(75, 69, 68, 1.0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 208, 158, 1.0),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: Size(200.0, 50.0),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        ),
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          color: Color.fromRGBO(9, 48, 48, 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(223, 247, 226, 1.0),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: Size(200.0, 50.0),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        ),
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          color: Color.fromRGBO(9, 48, 48, 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
