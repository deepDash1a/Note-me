import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/services/fire_store_services.dart';
import 'package:note_app/features/home/ui/widgets/custom_add_note_alert.dart';
import 'package:note_app/features/home/ui/widgets/custom_update_note_alert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FireStoreServices fireStoreServices = FireStoreServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Notes',
            style: TextStyle(
              fontSize: 20.00,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: fireStoreServices.getNoteStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;
              if (notesList.isNotEmpty) {
                return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = notesList[index];
                    String docID = document.id;

                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String noteText = data['note'];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          child: ListTile(
                            title: Text(noteText),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit_outlined,
                                      size: 20.00,
                                    ),
                                    onPressed: () {
                                      openToUpdateNote(docID);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.00,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.red.withOpacity(0.5),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      size: 20.00,
                                    ),
                                    onPressed: () {
                                      deleteNote(docID);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    'No Notes ... ',
                    style: TextStyle(fontSize: 20.00),
                  ),
                );
              }
            } else {
              return const Center(
                child: Text(
                  'Enter some Notes ... ',
                  style: TextStyle(fontSize: 20.00),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.withOpacity(0.5),
        onPressed: openToAddNote,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void openToAddNote() {
    showDialog(
      context: context,
      builder: (context) => CustomAddNoteAlert(),
    );
  }

  void openToUpdateNote(String docId) {
    showDialog(
      context: context,
      builder: (context) => CustomUpdateNoteAlert(docId: docId),
    );
  }

  void deleteNote(String docId) {
    fireStoreServices.deleteNote(docId);
  }
}
