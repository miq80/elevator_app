import 'package:flutter/material.dart';
import 'package:house_app/theme/theme.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.fieldText});

  final String fieldText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          fieldText,
          style: TextStyles.textStyle14,
        ),
        const Expanded(
            child: TextField(
          decoration: InputDecoration(fillColor: Color(0xFFE7E6E6)),
        )),
      ],
    );
  }
}
