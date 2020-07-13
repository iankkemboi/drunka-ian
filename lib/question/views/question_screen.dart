import 'package:drunka/dashboard/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:drunka/locator.dart';
import 'package:drunka/question/model/question_model.dart';
import 'package:drunka/question/sevices/question_api.dart';
import 'package:drunka/question/viewmodel/question_repository.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

QuestionRepository questionRepository = QuestionRepository();

class QuestionPage extends StatelessWidget {
  final CategoryModel question;
  List<QuestionModel> questionList = [];

  QuestionPage({this.question});

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title :Text('QUESTIONS')
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: StreamBuilder(

             // stream: questionProvider.fetchQuestionsAsStreams(question.id),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {

                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      //todo: style question
                      child: Text(
                        'it comes here'
                      ),
                    ),
                  );
                }
                return Text('fetching');
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                  //todo: implement functionality
                  onPressed: () {},
                  child: Text('Correct')),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                  //todo: implement functionality
                  onPressed: () {},
                  child: Text('Wrong')),
            ),
          )
        ],
      ),
    );
  }
}
