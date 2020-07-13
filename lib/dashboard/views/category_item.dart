import 'package:drunka/question/views/question_ianscreen.dart';
import 'package:flutter/material.dart';
import 'package:drunka/dashboard/model/category_model.dart';
import 'package:drunka/question/views/question_screen.dart';
import 'dart:developer';
import 'package:toast/toast.dart';
class CategoryItem extends StatelessWidget {
  CategoryModel categoryDetails;
  CategoryItem({this.categoryDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        final string = categoryDetails.questions.reduce((value, element) => value + ',' + element);
        Toast.show(string, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        log('data: $string');

        Navigator.push(context, MaterialPageRoute(builder: (_) => QuestionChangePage(question: categoryDetails,)));
      },
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Center(
          child: Text(
            categoryDetails.name,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'SourceSansPro'
            ),
          ),
        ),
      ),
    );
  }
}


