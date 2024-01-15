import 'package:flutter/material.dart';
import 'package:house_app/theme/theme.dart';
import 'package:house_app/widgets/add_house_button.dart';
import 'package:house_app/widgets/house_list.dart';

class HousePage extends StatelessWidget {
  HousePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 98,
              ),
              const AddHouseButton(),
              const SizedBox(
                height: 30,
              ),
              HouseList(),
            ],
          ),
        ),
      ),
    );
  }
}
