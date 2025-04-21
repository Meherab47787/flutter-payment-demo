import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final Color backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String? string;
  final double? height;
  final double? width;

  const CustomFAB({
    super.key,
    required this.onPressed,
    this.icon,
    required this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.string,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56.0, // default FAB size
      width: width ?? 56.0,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        foregroundColor: iconColor,
        tooltip: string,
        child: icon != null ? Icon(icon) : Text(string ?? '', style: TextStyle(color: textColor),),
      ),
    );
  }
}
