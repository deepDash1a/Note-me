import 'package:flutter/material.dart';
import 'package:note_app/core/services/fire_store_services.dart';
import 'package:note_app/features/home/ui/widgets/custom_add_note_alert.dart';

// ignore: must_be_immutable
class CustomUpdateNoteAlert extends StatelessWidget {
  CustomUpdateNoteAlert({super.key, required this.docId});

  final FireStoreServices fireStoreServices = FireStoreServices();
  var updateNoteController =
      TextEditingController(text: CustomAddNoteAlert.addNoteController.text);
  String docId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: updateNoteController,
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
                    fireStoreServices.updateNote(
                        docId, updateNoteController.text);
                    updateNoteController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Update',
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
                    updateNoteController.text = 'Cleared';
                    fireStoreServices.updateNote(
                      docId,
                      updateNoteController.text,
                    );
                    Navigator.pop(context);
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
