import 'package:drunka/dashboard/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:drunka/locator.dart';
import 'package:drunka/question/model/question_model.dart';
import 'package:drunka/question/sevices/question_api.dart';
import 'package:drunka/question/viewmodel/question_repository.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

QuestionRepository questionRepository = QuestionRepository();

class QuestionChangePage extends StatelessWidget {
   CategoryModel question;


  QuestionChangePage({this.question});

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title :Text('QUESTIONS')
      ),
      backgroundColor: Colors.teal,
        body: new ListView.builder(

            itemCount: question.questions.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new Text(question.questions[index]);
            }
        )
    );
  }
}
