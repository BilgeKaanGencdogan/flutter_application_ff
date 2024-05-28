import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_ff/model/movie.dart';

class FireStoreService {
  final CollectionReference movies =
      FirebaseFirestore.instance.collection('movies');

  Future<void> addMovie(Movie movie) {
    return movies.add(movie.toMap());
  }

  Stream<QuerySnapshot> getMovies() {
    return movies.snapshots();
  }

  Future<void> updateMovie(Movie movie, String docId) {
    return movies.doc(docId).update(movie.toMap());
  }

  Future<void> deleteMovie(String docId) {
    return movies.doc(docId).delete();
  }
}
