import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_plus/models/model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('users');

// * firebase 구성
// * users - doc(uid) - projects - doc(projectName) - notes - doc(note)

class DataService {
  static String? userUid;

  // Create Project
  static Future<void> createProject({required String projectTitle}) async {
    await _mainCollection
        .doc(userUid)
        .collection('projects')
        .doc(projectTitle)
        .set({});
  }

  // get Projects docs
  static Stream<QuerySnapshot> getProject() {
    CollectionReference collectionReference =
        _mainCollection.doc(userUid).collection('projects');

    return collectionReference.snapshots();
  }

  // Get notes
  static Stream<QuerySnapshot> getNotes(String title) {
    CollectionReference collectionReference = _mainCollection
        .doc(userUid)
        .collection('project')
        .doc(title)
        .collection('notes');

    return collectionReference.snapshots();
  }

  // Add Note
  static Future<void> addNote(
      {required String title, required String? description, required int index}) async {
    DocumentReference documentReference = _mainCollection
        .doc(userUid)
        .collection('projects')
        .doc()
        .collection('notes')
        .doc();

    DataModel data =
        DataModel(title: title, description: description = '', index: index);

    await documentReference.set(data);
  }

  // Update
  void update() {}

  // Delete
  void delete() {}
}
