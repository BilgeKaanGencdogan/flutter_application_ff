import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  // get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // CREATE : add a new note

  Future<void> addNote(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

  // READ : get all notes
  Stream<QuerySnapshot> getNotes() {
    return notes.orderBy('timestamp', descending: true).snapshots();
  }

  //UPDATE : update a note given a doc id

  Future<void> updateNote(String newNote, String docId) {
    return notes
        .doc(docId)
        .update({'note': newNote, 'timestamp': Timestamp.now()});
  }
}
