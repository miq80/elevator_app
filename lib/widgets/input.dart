import 'package:flutter/material.dart';
import 'package:house_app/theme/theme.dart';
import 'package:house_app/widgets/size_wrapper.dart';

class InputField extends StatelessWidget {
  const InputField({
    key,
    required this.fieldText,
    required this.controller,
    this.textFieldWidth,
  });

  final String fieldText;
  final TextEditingController controller;
  final double? textFieldWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 115,
          child: Text(
            fieldText,
            style: TextStyles.textStyle14,
          ),
        ),
        ConditionalSizedBox(
          width: textFieldWidth,
          child: Expanded(
            child: TextField(
              style: TextStyles.textStyle14,
              controller: controller,
              decoration: const InputDecoration(
                isCollapsed: true,
                isDense: true,
                border: InputBorder.none,
                fillColor: AppTheme.dialogWindowInputColor,
                filled: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
