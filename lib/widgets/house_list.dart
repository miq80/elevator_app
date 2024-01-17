import 'package:flutter/material.dart';
import 'package:house_app/models/house.dart';
import 'package:house_app/pages/floors_page.dart';
import 'package:house_app/services/database_service.dart';
import 'package:house_app/theme/theme.dart';

class HouseList extends StatelessWidget {
  HouseList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseService.instance.getBuildings(),
      builder: (BuildContext context, AsyncSnapshot<List<House>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data!.length,
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
                      onTap: () async {
                        int buildingId = snapshot.data![index].id;
                        List<String> floors = await DatabaseService.instance
                            .getFloorsForBuilding(buildingId);

                        if (floors.isNotEmpty) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FloorsPage(floors: floors),
                            ),
                          );
                        } else {
                          print(
                              'Failed to retrieve floors for building with ID $buildingId');
                        }
                      },
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 9,
                          ),
                          const Text(
                            'House',
                            style: TextStyles.textStyles16,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          Text(
                            snapshot.data![index].name,
                            style: TextStyles.textStyles16,
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
      },
    );
  }
}
