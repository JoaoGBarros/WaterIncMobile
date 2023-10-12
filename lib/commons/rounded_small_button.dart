import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RoundedSmallButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final bool highlight;
  final Color? highlghtColor;
  final Color backgroundColor;
  final Color textColor;

  const RoundedSmallButton(
      {super.key,
      required this.onTap,
      required this.label,
      required this.backgroundColor,
      required this.textColor,
      required this.highlight,
      required this.highlghtColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
        backgroundColor: highlight == true ? highlghtColor : backgroundColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );
  }
}
