import 'package:flutter/material.dart';
import 'package:note_app/core/services/fire_store_services.dart';

// ignore: must_be_immutable
class CustomAddNoteAlert extends StatelessWidget {
  CustomAddNoteAlert({super.key});

  final FireStoreServices fireStoreServices = FireStoreServices();
  static var addNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: addNoteController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.00),
                borderSide: BorderSide(
                  width: 0.3,
                  color: Colors.blue.withOpacity(0.5),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5.00,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    if (addNoteController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('plz, Enter correct note to add.'),
                        ),
                      );
                      addNoteController.clear();
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Note added successfully.'),
                        ),
                      );
                      fireStoreServices.addNote(addNoteController.text);
                      addNoteController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 15.00,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    addNoteController.clear();
                  },
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 15.00,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
