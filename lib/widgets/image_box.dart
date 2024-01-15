import 'package:flutter/material.dart';
import 'package:house_app/theme/theme.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.fromLTRB(11.0, 77.0, 12.0, 94.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.borderColor,
          ),
        ),
        child: const Text('any image here', style: TextStyles.textStyle24),
      ),
    );
  }
}
