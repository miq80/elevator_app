import 'package:flutter/material.dart';
import 'package:house_app/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onTap, required this.buttonText});

  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(19),
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(),
        ),
        child: Text(
          buttonText,
          style: TextStyles.textStyles16,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
