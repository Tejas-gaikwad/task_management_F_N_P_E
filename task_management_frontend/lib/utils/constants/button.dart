import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final String buttonText;

  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.borderColor,
    required this.textColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: buttonColor,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
