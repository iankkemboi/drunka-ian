import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drunka/locator.dart';
import 'package:drunka/dashboard/model/category_model.dart';
import 'package:drunka/dashboard/services/category_api.dart';

class CategoryRepository extends ChangeNotifier {

  CategoryApi _categoryApi = locator<CategoryApi>();

  List<CategoryModel> categories;

  Future<List<CategoryModel>> fetchCategories() async{
    var result = await _categoryApi.getDataCollection();
    categories = result.documents
        .map((doc) => CategoryModel.fromMap(doc.documentID, doc.data))
        .toList();

    return categories;
  }


  @override
  String toString() {
    return 'categories: $categories';
  }

  Stream<QuerySnapshot> fetchCategoriesAsStream() {
    return _categoryApi.streamDataCollection();
  }

  Future<CategoryModel> getCategoryById(String id) async{
    var doc = await _categoryApi.getDocumentById(id);
    return CategoryModel.fromMap(doc.documentID, doc.data);
  }

}