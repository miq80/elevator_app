import 'package:flutter/services.dart';

class ElevatorChannel {
  static const MethodChannel _channel =
      MethodChannel('com.yourcompany.elevator');

  static Future<void> sendElevatorInfo(
      String buildingName, int currentFloor) async {
    try {
      await _channel.invokeMethod('sendElevatorInfo', {
        'buildingName': buildingName,
        'currentFloor': currentFloor,
      });
    } catch (e) {
      print('Error sending elevator info: $e');
    }
  }
}
