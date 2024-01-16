import 'package:flutter/material.dart';

class FloorsPage extends StatelessWidget {
  final String houseName;
  final List<String> floors;

  FloorsPage({required this.houseName, required this.floors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floors in $houseName'),
      ),
      body: ListView.builder(
        itemCount: floors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(floors[index]),
          );
        },
      ),
    );
  }
}
