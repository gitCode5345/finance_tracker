import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/core/validators/validators.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  SvgPicture closeEyeIcon = SvgPicture.asset('assets/images/Eye-Pass.svg');
  SvgPicture openEyeIcon = SvgPicture.asset('assets/images/open-eye.svg');

  @override
  void initState() {
    _emailController.text = '';
    _passwordController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (_) => Navigator.of(context).pop(),
          error: (error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(error)));
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading:() => Scaffold(body: Center(child: CircularProgressIndicator()),),
          orElse: () => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderWidget(
                  padding: EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 40.0),
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          foregroundColor: Colors.white,
                          iconSize: 32.0
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                    Text(
                      'Welcome!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: BodyContainerWidget(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Align(
                          alignment: AlignmentGeometry.topCenter,
                          child: SizedBox(
                            width: constraints.maxWidth * 0.9,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 70.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 15.0,
                                              bottom: 5.0,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Email',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(54, 49, 48, 1.0,),
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _emailController,
                                          validator: (value) => Validators.email(value),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0),
                                                ),
                                                borderSide: BorderSide.none,
                                              ),
                                            floatingLabelBehavior: FloatingLabelBehavior.never,
                                              filled: true,
                                              fillColor: AppColors.secondary,
                                              hintText: 'example@example.com',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                color: AppColors.textHint,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 15.0,
                                              bottom: 5.0,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Password',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.textSecondary,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _passwordController,
                                            obscureText: !isPasswordVisible,
                                            obscuringCharacter: '●',
                                            validator: (value) =>
                                                Validators.password(value),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0),
                                                ),
                                                borderSide: BorderSide.none,
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                  isPasswordVisible = !isPasswordVisible;
                                                  });
                                                },
                                                icon: SvgPicture.asset(
                                                  isPasswordVisible
                                                      ? 'assets/images/open-eye.svg'
                                                      : 'assets/images/Eye-Pass.svg',
                                                ),
                                              ),
                                            floatingLabelBehavior: FloatingLabelBehavior.never,
                                              filled: true,
                                              fillColor: AppColors.secondary,
                                              hintText: 'Enter your password',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                color: AppColors.textHint,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                            backgroundColor: Color.fromRGBO(0, 208, 158, 1.0,),
                                              side: BorderSide.none,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              minimumSize: Size(200.0, 50.0),
                                            ),
                                            onPressed: () {
                                              final bool isValid = _formKey.currentState?.validate() ?? false;
                                              if (isValid) {
                                              final email = _emailController.text;
                                              final password = _passwordController.text;
                                                context.read<AuthBloc>().add(
                                                  LoginUser(
                                                    email: email,
                                                    password: password,
                                                  ),
                                                );
                                              }
                                            },
                                            child: Text(
                                              'Log in',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0,
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
