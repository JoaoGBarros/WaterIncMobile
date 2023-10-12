import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RoundedBigButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData? icon;
  final String? label;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const RoundedBigButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.borderColor,
      required this.backgroundColor,
      required this.textColor,
      this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 7.0),
            color: Colors.blueGrey[100],
            shape: BoxShape.circle,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(500.0),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: icon != null
                  ? Icon(
                      icon,
                      color: backgroundColor,
                      size: 30,
                    )
                  : Text(
                      label!,
                      style: TextStyle(
                        backgroundColor: backgroundColor,
                        color: textColor,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
