import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drunka/common/global.dart';
import 'dart:async';

import 'package:drunka/question/model/question_model.dart';

class QuestionApi{
  final Firestore _db = Firestore.instance;
  String pathUrl;
  //String categoryId;
  //String subCollection;
  CollectionReference ref;
  List<QuestionModel> _questions;

  QuestionApi(this.pathUrl){
    ref= _db.collection(pathUrl);
  }

  Future<QuerySnapshot> getDataCollection(String categoryId) {
    var collection = ref.document(categoryId).collection(Global.questionsCollection);
    return  collection.getDocuments() ;
  }

  Stream<QuerySnapshot> streamDataCollection(String categoryId) {
    var collection = ref.document(categoryId).collection(Global.questionsCollection);
    return collection.snapshots() ;
  }

  /// Query a subcollection
  Stream<List<QuestionModel>> streamWeapons(String categoryId ){
  var collection = ref.document(categoryId).collection(Global.questionsCollection);

  return collection.snapshots().map((list) =>
  list.documents.map((doc) =>QuestionModel.fromJSON(doc.documentID,doc.data)).toList());
  }
  //Future<>

}