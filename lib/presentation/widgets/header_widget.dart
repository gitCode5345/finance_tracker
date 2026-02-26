import 'package:flutter/material.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  final EdgeInsets padding;
  final Alignment alignment;
  final List<Widget> children;

  const HeaderWidget({
      super.key, 
      this.padding = const EdgeInsets.all(16.0), 
      this.alignment = Alignment.center, 
      required this.children
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding: padding,
        child: Stack(
          alignment: alignment,
          children: children,
        ),
      ),
    );
  }
}
