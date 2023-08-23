import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    this.borderRadius = 20,
    this.width = 150,
    this.height = 40,
    this.onTap,
    this.icon,
    this.backgroundColor = Colors.blueAccent,
    this.textStyle,
    this.iconColor,
    this.textFlex = 1,
    Key? key,
  }) : super(key: key);
  IconData? icon;
  final String title;
  final double borderRadius;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final void Function()? onTap;
  final int textFlex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            Expanded(
              flex: textFlex,
              child: Text(
                title,
                style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
