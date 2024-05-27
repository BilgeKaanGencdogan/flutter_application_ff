import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ff/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // firestore service
  final FireStoreService fireStoreService = FireStoreService();
  // text controller
  final TextEditingController _textController = TextEditingController();
  //open a dialog box to add a note
  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: 'Enter your note',
                ),
              ),
              actions: [
                //button to save the note
                ElevatedButton(
                    onPressed: () {
                      // add a new note
                      if (docID == null) {
                        fireStoreService.addNote(_textController.text);
                      }

                      // update the note
                      else {
                        fireStoreService.updateNote(
                            _textController.text, docID);
                      }
                      // clear the text controller
                      _textController.clear();
                      // close the box
                      Navigator.pop(context);
                    },
                    child: Text(docID == null ? "Add" : "Update"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreService.getNotes(),
        builder: (context, snapshot) {
          // if we have data, get all the docs
          if (snapshot.hasData) {
            List notesLites = snapshot.data!.docs;
            // display as the list
            return ListView.builder(
              itemCount: notesLites.length,
              itemBuilder: (context, index) {
                // get each individual doc
                DocumentSnapshot document = notesLites[index];
                String docID = document.id;

                // get note from each doc
                Map<String, dynamic> note =
                    document.data() as Map<String, dynamic>;

                String noteText = note['note'];

                // display as a list tile

                return ListTile(
                  title: Text(noteText),
                  trailing: IconButton(
                    onPressed: () => openNoteBox(docID: docID),
                    icon: const Icon(Icons.settings),
                  ),
                );
              },
            );
          } else {
            return const Text("No notes found");
          }
        },
      ),
    );
  }
}
