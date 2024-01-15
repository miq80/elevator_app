import 'package:flutter/material.dart';
import 'package:house_app/app.dart';
import 'package:house_app/pages/house_page.dart';
import 'package:house_app/theme/theme.dart';
import 'package:house_app/widgets/custom_button.dart';
import 'package:house_app/widgets/image_box.dart';

void main() {
  runApp(const App());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppTheme.backgroundColor,
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Test Task',
                style: TextStyles.textStyle24,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 47,
              ),
              const ImageBox(),
              const SizedBox(
                height: 31,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 66),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HousePage()));
                    },
                    buttonText: 'Enter',
                  ),
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          right: 49,
          bottom: 28,
          child: Text('designed by Mykola Dobrianskyi',
              style: TextStyles.textStyles16),
        )
      ]),
    );
  }
}
