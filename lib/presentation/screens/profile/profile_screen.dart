import 'package:finance_tracker/business/bloc/auth_bloc/auth_bloc.dart';
import 'package:finance_tracker/core/const/app_colors.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/presentation/screens/edit_profile/edit_profile_screen.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 5,
            left: 20,
            right: 20,
            bottom: 50
          ),
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal
              )
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white
                ),
                onPressed: () {},
                icon: const Icon(Icons.notifications_none)
              )
            )
          ]
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
                      '${user.firstName} ${user.lastName}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: AppColors.textPrimary
                      )
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
                            fontStyle: FontStyle.normal,
                            height: 1.5,
                            color: AppColors.textButton
                          )
                        ),
                        Text(
                          user.id ?? '',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                            height: 1.5,
                            color: AppColors.textButton
                          )
                        )
                      ]
                    ),
                    const SizedBox(height: 32.0),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final maxWidth = constraints.maxWidth * 0.9;
                        return SizedBox(
                          width: maxWidth,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfileScreen(user: user)
                                  )
                                ),
                                leading: SvgPicture.asset(
                                  'assets/images/profile_edit.svg',
                                  width: 57,
                                  height: 57
                                ),
                                title: const Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.textPrimary
                                  )
                                )
                              ),
                              const SizedBox(height: 30.0),
                              ListTile(
                                onTap: () => context.read<AuthBloc>().add(LogoutUser()),
                                leading: SvgPicture.asset(
                                  'assets/images/logout_btn.svg',
                                  width: 57,
                                  height: 57
                                ),
                                title: const Text(
                                  'Logout',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.textPrimary
                                  )
                                )
                              )
                            ]
                          )
                        );
                      }
                    ),
                    const SizedBox(height: 32.0)
                  ]
                )
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
                      fit: BoxFit.cover
                    )
                  )
                )
              )
            ]
          )
        )
      ]
    );
  }
}
