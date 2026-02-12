import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class SummaryItem extends StatelessWidget {
  final String label;
  final String amount;
  final String iconPath;
  final Color color;

  const SummaryItem({super.key, required this.label, required this.amount, required this.iconPath, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          width: 25.0,
          height: 25.0,
        ),
        const SizedBox(height: 5.0),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '\$$amount',
          style: TextStyle(
            color: color,
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
