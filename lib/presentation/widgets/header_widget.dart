import 'package:flutter/material.dart';

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
        color: Color.fromRGBO(0, 208, 158, 1.0),
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
