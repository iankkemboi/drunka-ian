import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drunka/locator.dart';
import 'package:drunka/question/model/question_model.dart';
import 'package:drunka/question/sevices/question_api.dart';
import 'package:drunka/locator.dart';

class QuestionRepository extends ChangeNotifier{

  QuestionApi _questionApi = locator<QuestionApi>();

  List<QuestionModel> _questions = [];
  int _questionNumber = 0;

  //fetch questions
  Future<List<QuestionModel>> fetchQuestions(String categoryId) async{
    var result = await _questionApi.getDataCollection(categoryId);
    _questions = result.documents
        .map((doc) => QuestionModel.fromJSON(doc.documentID, doc.data))
        .toList();
    print(_questions);
    return _questions;
  }

  //fetch all questions as steam
  Stream<QuerySnapshot> fetchQuestionsAsStreams(String categoryId) {
    return _questionApi.streamDataCollection(categoryId);
  }

  //get question
  String getQuestion(){
    return _questions[_questionNumber].question;
  }

  //get next question
  void nextQuestion(){
    if(_questionNumber< _questions.length -1){
      _questionNumber++;
      print(_questionNumber);
    }
  }


}