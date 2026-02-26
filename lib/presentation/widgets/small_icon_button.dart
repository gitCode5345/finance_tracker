import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class SmallIconButton extends StatelessWidget {
  final String asset;
  final VoidCallback? onPressed;

  const SmallIconButton({super.key, required this.asset, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 32.0,
        height: 32.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(asset),
        ),
      ),
    );
  }
}
