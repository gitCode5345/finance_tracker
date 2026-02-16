import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/core/validators/validators.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController textControllerFullName = TextEditingController();
  final TextEditingController textControllerEmail = TextEditingController();
  final TextEditingController textControllerTelephone = TextEditingController();
  final TextEditingController textControllerDateOfBirth = TextEditingController();
  final TextEditingController textControllerPassword = TextEditingController();
  final TextEditingController textControllerConfirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

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
          authenticated: (user) => Navigator.of(context).pop(),
          error: (error) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error))
          ),
          orElse: () {}
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
          orElse: () => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderWidget(
                  padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0, bottom: 20.0),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          foregroundColor: Colors.white,
                          iconSize: 32.0
                        ),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back)
                      )
                    ),
                    const Text(
                      'Create account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textButton
                      )
                    )
                  ]
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
                              _buildLabel('Full Name'),
                              _buildTextField(
                                controller: textControllerFullName,
                                hint: 'John Doe',
                                validator: (v) => Validators.fullName(v)
                              ),
                              const SizedBox(height: 18.0),
                              _buildLabel('Email'),
                              _buildTextField(
                                controller: textControllerEmail,
                                hint: 'example@example.com',
                                validator: (v) => Validators.email(v)
                              ),
                              const SizedBox(height: 18.0),
                              _buildLabel('Mobile Number'),
                              _buildTextField(
                                controller: textControllerTelephone,
                                hint: '+123 456 7890',
                                validator: (v) => Validators.phone(v)
                              ),
                              const SizedBox(height: 18.0),
                              _buildLabel('Date of Birth'),
                              _buildTextField(
                                controller: textControllerDateOfBirth,
                                hint: 'DD / MM / YYYY',
                                validator: (v) => Validators.date(v)
                              ),
                              const SizedBox(height: 18.0),
                              _buildLabel('Password'),
                              _buildPasswordField(
                                controller: textControllerPassword,
                                isVisible: isPasswordVisible,
                                toggle: () => setState(() => isPasswordVisible = !isPasswordVisible),
                                validator: (v) => Validators.password(v)
                              ),
                              const SizedBox(height: 18.0),
                              _buildLabel('Confirm Password'),
                              _buildPasswordField(
                                controller: textControllerConfirmPassword,
                                isVisible: isConfirmPasswordVisible,
                                toggle: () => setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible),
                                validator: (v) => Validators.confirmPassword(v, textControllerPassword.text),
                                hint: 'Confirm your password'
                              ),
                              const SizedBox(height: 18.0),
                              Center(
                                child: Text(
                                  'By continuing, you agree to Terms of Use and Privacy Policy.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'LeagueSpartan',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: AppColors.textSecondary
                                  )
                                )
                              ),
                              const SizedBox(height: 18.0),
                              Center(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                    minimumSize: const Size(200.0, 50.0)
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final names = textControllerFullName.text.split(' ');
                                      final user = User(
                                        firstName: names.first,
                                        lastName: names.length > 1 ? names.sublist(1).join(' ') : '',
                                        email: textControllerEmail.text,
                                        phone: textControllerTelephone.text,
                                        dateOfBirth: textControllerDateOfBirth.text,
                                        password: textControllerPassword.text,
                                        isNewUser: true
                                      );
                                      context.read<AuthBloc>().add(AuthEvent.registerUserEvent(user: user));
                                    }
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                      color: AppColors.textButton
                                    )
                                  )
                                )
                              ),
                              _buildSignInLink()
                            ]
                          )
                        )
                      )
                    )
                  )
                )
              ]
            )
          )
        );
      }
    );
  }

  Widget _buildLabel(String text) => Container(
    margin: const EdgeInsets.only(left: 15.0, bottom: 5.0),
    child: Text(text, style: const TextStyle(fontFamily: 'Poppins', fontSize: 15.0, fontWeight: FontWeight.w500, color: AppColors.textSecondary))
  );

  Widget _buildTextField({required TextEditingController controller, required String hint, String? Function(String?)? validator}) => TextFormField(
    controller: controller,
    validator: validator,
    decoration: InputDecoration(
      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)), borderSide: BorderSide.none),
      filled: true,
      fillColor: AppColors.secondary,
      hintText: hint,
      hintStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 16.0, fontWeight: FontWeight.w500, height: 1.5, color: AppColors.textHint)
    )
  );

  Widget _buildPasswordField({required TextEditingController controller, required bool isVisible, required VoidCallback toggle, required String? Function(String?)? validator, String hint = 'Enter your password'}) => TextFormField(
    controller: controller,
    validator: validator,
    obscureText: !isVisible,
    obscuringCharacter: '●',
    decoration: InputDecoration(
      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)), borderSide: BorderSide.none),
      suffixIcon: IconButton(
        onPressed: toggle,
        icon: SvgPicture.asset(isVisible ? 'assets/images/open-eye.svg' : 'assets/images/Eye-Pass.svg')
      ),
      filled: true,
      fillColor: AppColors.secondary,
      hintText: hint,
      hintStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 16.0, fontWeight: FontWeight.w500, height: 1.5, color: AppColors.textHint)
    )
  );

  Widget _buildSignInLink() => Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?', style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 14.0, color: AppColors.textButton)),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Sign In', style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w600, fontSize: 14.0, color: AppColors.primary))
        )
      ]
    )
  );
}
