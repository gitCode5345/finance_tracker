import 'package:flutter/material.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class GreenContainer extends StatelessWidget {
  final Widget widget;
  final EdgeInsetsGeometry? padding;
  final double width;
  final double height;
  final BorderRadius radius;
  final AlignmentGeometry? aligment;

  const GreenContainer({
    super.key,
    required this.widget,
    this.padding,
    required this.radius,
    this.width = 100,
    this.height = 100,
    this.aligment
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: aligment,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: radius,
      ),
      child: widget,
    );
  }
}
