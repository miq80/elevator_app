import 'package:flutter/material.dart';
import 'package:house_app/theme/theme.dart';
import 'package:house_app/widgets/floor_item.dart';

enum FloorState {
  current,
  target,
  none,
}

class FloorsPage extends StatefulWidget {
  final List<String> floors;

  const FloorsPage({Key? key, required this.floors}) : super(key: key);

  @override
  State<FloorsPage> createState() => _FloorsPageState();
}

class _FloorsPageState extends State<FloorsPage> {
  int? targetFloor;
  bool isRunning = false;
  int currentFloor = 0;
  @override
  void initState() {
    super.initState();
  }

  void onFloorItemTap(int index) {
    if (index == currentFloor || isRunning) {
      return;
    }
    setState(() {
      targetFloor = index;
      isRunning = true;
    });
    moveToTarget();
  }

  void moveToTarget() async {
    if (targetFloor == null) {
      return;
    }
    final initialFloor = currentFloor;
    if (targetFloor! > currentFloor) {
      for (var i = initialFloor + 1; i <= targetFloor!; i++) {
        await Future.delayed(const Duration(seconds: 3));
        setState(() {
          currentFloor = i;
        });
      }
    } else {
      for (var i = initialFloor - 1; i >= targetFloor!; i--) {
        await Future.delayed(const Duration(seconds: 3));
        setState(() {
          currentFloor = i;
        });
      }
    }
    targetFloor = null;
    isRunning = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 113,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      Text(
                        'Floors',
                        style: TextStyles.textStyles16,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.5),
                  child: Divider(
                    color: AppTheme.lineColor,
                  ),
                ),
                const SizedBox(
                  height: 26.5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.floors.length,
                    itemBuilder: (context, index) {
                      FloorState state = FloorState.none;

                      if (index == targetFloor) {
                        state = FloorState.target;
                      } else if (index == currentFloor) {
                        state = FloorState.current;
                      }
                      return FloorItem(
                        floorName: widget.floors[index],
                        state: state,
                        onTap: () {
                          onFloorItemTap(index);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 85,
                )
              ],
            ),
            const Positioned(
              left: 21,
              bottom: 22,
              child: Text(
                'designed by Mykola Dobrianskyi',
                style: TextStyles.textStyles16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
