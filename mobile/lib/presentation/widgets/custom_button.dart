import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton({
    Key? key,
    this.backgroundColor,
    required this.displaytext,
    required this.onTap,
    this.borderRadius = 30,
    this.width,
    this.height = 60,
    this.elevation,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget displaytext;
  final Function() onTap;
  final double height;
  final double? width;
  final double? elevation;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: height,
      child: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              minimumSize:
                  Size(width ?? MediaQuery.of(context).size.width / 2, 40),
              backgroundColor: backgroundColor ?? Colors.blueAccent,
              elevation: elevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: displaytext,
          ),
        ),
      ),
    );
  }
}
