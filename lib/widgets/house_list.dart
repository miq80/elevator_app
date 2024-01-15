import 'package:flutter/material.dart';

class HouseList extends StatelessWidget {
  HouseList({super.key});

  final List<String> houses = ['house name 1', 'house name 2'];

  static const textStyles = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    height: 19 / 16,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: houses.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 66),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.5),
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 9,
                      ),
                      const Text(
                        'House',
                        style: textStyles,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      Text(
                        houses[index],
                        style: textStyles,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
