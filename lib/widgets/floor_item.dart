import 'package:flutter/material.dart';
import 'package:house_app/pages/floors_page.dart';
import 'package:house_app/theme/theme.dart';

class FloorItem extends StatelessWidget {
  const FloorItem({
    super.key,
    required this.floorName,
    required this.state,
    required this.onTap,
  });

  final String floorName;
  final FloorState state;

  final VoidCallback onTap;

  Color get backgroundColor => switch (state) {
        FloorState.current => const Color(0xFF3B8642),
        FloorState.target => const Color(0xFFCAC316),
        FloorState.none => Colors.transparent
      };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 66),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.5),
          margin: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
            color: backgroundColor,
          ),
          child: Text(
            floorName,
            style: TextStyles.textStyles16,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
