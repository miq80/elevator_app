import 'dart:async';

import 'package:flutter/services.dart';

class ElevatorChannel {
  static const MethodChannel platformChannel =
      MethodChannel('elevator_channel');

  static Future<void> schedule(String houseName, int currentFloor) async {

    try {
      await platformChannel.invokeMethod('getDataFromNative', {
        'time':
            DateTime.now().add(const Duration(seconds: 2)).toIso8601String(),
        'message': 'You`re in $houseName on floor: $currentFloor'
      });
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }
}
