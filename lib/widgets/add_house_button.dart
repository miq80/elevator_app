import 'package:flutter/material.dart';
import 'package:house_app/theme/theme.dart';
import 'package:house_app/widgets/input.dart';

class AddHouseButton extends StatelessWidget {
  const AddHouseButton({
    super.key,
  });

  Future<void> _dialogBuilder(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController floorsController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          content: const Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add house',
                  style: TextStyles.textStyles16,
                ),
                InputField(fieldText: 'Name'),
                InputField(fieldText: 'Floors count')
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _dialogBuilder(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 66),
        child: Container(
          padding: const EdgeInsets.all(10.5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Add house',
                    style: TextStyles.textStyles16,
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  right: 22,
                  width: 35,
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
