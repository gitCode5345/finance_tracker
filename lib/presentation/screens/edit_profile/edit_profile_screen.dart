import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/core/const/app_colors.dart';
import 'package:finance_tracker/core/validators/validators.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;
  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.user.email;
    _phoneNumberController.text = widget.user.phone;
    _fullNameController.text = '${widget.user.firstName} ${widget.user.lastName}'.trim();
    _dateOfBirthController.text = widget.user.dateOfBirth;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (updatedUser) {
            if (updatedUser != widget.user) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile updated successfully!'),
                  backgroundColor: AppColors.primary,
                ),
              );
              Navigator.pop(context);
            }
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error), backgroundColor: Colors.red),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            HeaderWidget(
              padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 5,
              left: 20,
              right: 20,
              bottom: 40,
            ),
              children: [
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.white,
                      iconSize: 32.0
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  BodyContainerWidget(
                    child: Column(
                      children: [
                        const SizedBox(height: 80.0),
                        Text(
                          '${widget.user.firstName} ${widget.user.lastName}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'ID: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textButton,
                              ),
                            ),
                            Text(
                              widget.user.id ?? '',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: AppColors.textButton,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 32.0),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildLabel('Phone Number'),
                                    TextFormField(
                                      controller: _phoneNumberController,
                                      validator: (value) => Validators.phone(value),
                                      decoration: _buildInputDecoration('+1 234 567 8900'),
                                    ),
                                    const SizedBox(height: 20),
                                    _buildLabel('Full name'),
                                    TextFormField(
                                      controller: _fullNameController,
                                      validator: (value) => Validators.fullName(value),
                                      decoration: _buildInputDecoration('Full name'),
                                    ),
                                    const SizedBox(height: 20),
                                    _buildLabel('Date of Birth'),
                                    TextFormField(
                                      controller: _dateOfBirthController,
                                      validator: (value) => Validators.date(value),
                                      decoration: _buildInputDecoration('DD/MM/YYYY'),
                                    ),
                                    const SizedBox(height: 20),
                                    _buildLabel('Email'),
                                    TextFormField(
                                      controller: _emailController,
                                      validator: (value) => Validators.email(value),
                                      decoration: _buildInputDecoration('example@example.com'),
                                    ),
                                    const SizedBox(height: 40),
                                    Center(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          side: BorderSide.none,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                          minimumSize: const Size(200.0, 50.0),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState?.validate() ?? false) {
                                            final nameParts = _fullNameController.text.trim().split(' ');
                                            final firstName = nameParts.first;
                                            final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
                    
                                            context.read<AuthBloc>().add(
                                              UserDataChanged(
                                                user: widget.user.copyWith(
                                                  firstName: firstName,
                                                  lastName: lastName,
                                                  phone: _phoneNumberController.text,
                                                  dateOfBirth: _dateOfBirthController.text,
                                                  email: _emailController.text,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text(
                                          'Update profile',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -50,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 50,
                      child: ClipOval(
                        child: SvgPicture.asset(
                          'assets/images/profile_edit.svg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, bottom: 5.0),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide.none,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: AppColors.secondary,
      hintText: hint,
      hintStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: AppColors.textHint,
      ),
    );
  }
}