import 'package:flutter/material.dart';
import 'package:house_app/theme/theme.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(1.0), 
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.borderColor,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.zero, 
          child: Image.asset(
            'assets/cat.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover, 
          ),
        ),
      ),
    );
  }
}
