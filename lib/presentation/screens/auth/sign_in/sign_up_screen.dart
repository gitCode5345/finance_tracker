import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/core/validators/validators.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final textControllerFullName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerTelephone = TextEditingController();
  final textControllerDateOfBirth = TextEditingController();
  final textControllerPassword = TextEditingController();
  final textControllerConfirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String password = '';
  SvgPicture closeEyeIcon = SvgPicture.asset('assets/images/Eye-Pass.svg');
  SvgPicture openEyeIcon = SvgPicture.asset('assets/images/open-eye.svg');

  @override
  void dispose() {
    textControllerFullName.dispose();
    textControllerEmail.dispose();
    textControllerTelephone.dispose();
    textControllerDateOfBirth.dispose();
    textControllerPassword.dispose();
    textControllerConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (user) {
            Navigator.of(context).pop();
          },
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
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => Center(
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeaderWidget(
                      padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0, bottom: 20.0,),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color.fromRGBO(9, 48, 48, 1.0),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const Text(
                          'Create account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(9, 48, 48, 1.0),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: BodyContainerWidget(
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Full Name',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(54, 49, 48, 1.0),
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: textControllerFullName,
                                    validator: (value) => Validators.fullName(value),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      filled: true,
                                      fillColor: Color.fromRGBO(223, 247, 226, 1.0),
                                      hintText: 'John Doe',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        color: Color.fromRGBO(48, 62, 62, 0.45),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18.0),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(54, 49, 48, 1.0),
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: textControllerEmail,
                                    validator: (value) => Validators.email(value),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      filled: true,
                                      fillColor: Color.fromRGBO(223, 247, 226, 1.0),
                                      hintText: 'example@example.com',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        color: Color.fromRGBO(48, 62, 62, 0.45),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18.0),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Mobile Number',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(54, 49, 48, 1.0),
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: textControllerTelephone,
                                    validator: (value) => Validators.phone(value),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      filled: true,
                                      fillColor: Color.fromRGBO(223, 247, 226, 1.0),
                                      hintText: '+123 456 7890',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        color: Color.fromRGBO(48, 62, 62, 0.45),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18.0),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Date of Birth',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(54, 49, 48, 1.0),
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: textControllerDateOfBirth,
                                    validator: (value) => Validators.date(value),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      filled: true,
                                      fillColor: Color.fromRGBO(223, 247, 226, 1.0),
                                      hintText: 'DD / MM / YYYY',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        color: Color.fromRGBO(48, 62, 62, 0.45),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18.0),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Password',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(54, 49, 48, 1.0),
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: textControllerPassword,
                                    validator: (value) => Validators.password(value),
                                    obscureText: !isPasswordVisible,
                                    obscuringCharacter: '●',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () => setState(() {
                                          isPasswordVisible = !isPasswordVisible;
                                        }),
                                        icon: isPasswordVisible? openEyeIcon : closeEyeIcon,
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      filled: true,
                                      fillColor: Color.fromRGBO(223,247,226,1.0),
                                      hintText: 'Enter your password',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        color: Color.fromRGBO(48, 62, 62, 0.45),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18.0),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Confirm Password',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(54, 49, 48, 1.0),
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: textControllerConfirmPassword,
                                    validator: (value) =>
                                        Validators.confirmPassword(value, textControllerPassword.text),
                                    obscureText: !isConfirmPasswordVisible,
                                    obscuringCharacter: '●',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30.0),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () => setState(() {
                                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                                        }),
                                        icon: isConfirmPasswordVisible ? openEyeIcon : closeEyeIcon,
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      filled: true,
                                      fillColor: Color.fromRGBO(223, 247, 226, 1.0),
                                      hintText: 'Confirm your password',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        color: Color.fromRGBO(48, 62, 62, 0.45),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18.0),
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      final constraintsWidth = constraints.maxWidth * 0.7;
                                      return Center(
                                        child: SizedBox(
                                          width: constraintsWidth,
                                          child: Text(
                                            'By continuing, you agree to Terms of Use and Privacy Policy.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'LeagueSpartan',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 18.0),
                                  Center(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Color.fromRGBO(0, 208, 158, 1.0),
                                        side: BorderSide.none,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        minimumSize: Size(200.0, 50.0),
                                      ),
                                      onPressed: () {
                                        final isValid = _formKey.currentState!.validate();

                                        if (isValid) {
                                          final userFirstNameLastName =textControllerFullName.text.split(' ');

                                          final user = User(
                                            firstName: userFirstNameLastName.first,
                                            lastName: userFirstNameLastName.length > 1
                                                      ? userFirstNameLastName.sublist(1).join(' ') : '',
                                            email: textControllerEmail.text,
                                            phone: textControllerTelephone.text,
                                            dateOfBirth: textControllerDateOfBirth.text,
                                            password: textControllerPassword.text,
                                          );

                                          context.read<AuthBloc>().add(
                                            AuthEvent.registerUserEvent(
                                              user: user,
                                            ),
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.0,
                                          color: Color.fromRGBO(9, 48, 48, 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Already have an account?',
                                          style: TextStyle(
                                            fontFamily: 'LeagueSpartan',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                            color: Color.fromRGBO(9, 48, 48, 1.0),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Sign In',
                                            style: TextStyle(
                                              fontFamily: 'LeagueSpartan',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                              color: Color.fromRGBO(0, 208, 158, 1.0),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
