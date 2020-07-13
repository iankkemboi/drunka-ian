import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class CategoryApi{
  final Firestore _db = Firestore.instance;
  String pathUrl;
  CollectionReference ref;

  CategoryApi( this.pathUrl ) {
    ref = _db.collection(pathUrl);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments() ;
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots() ;
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

}