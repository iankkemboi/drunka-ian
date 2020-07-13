import 'package:flutter/material.dart';
import 'package:drunka/dashboard/model/category_model.dart';
import 'package:drunka/dashboard/viewmodel/category_repository.dart';
import 'package:drunka/dashboard/services/category_api.dart';
import 'package:drunka/locator.dart';
import 'package:drunka/dashboard/views/category_item.dart';
import 'package:drunka/dashboard/views/category_item.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {

    final categoriesProvider = Provider.of<CategoryRepository>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.navigation,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: <Widget>[

          Column(
            children: <Widget>[
              Expanded(
                child: Container(color: Colors.deepPurple),
                flex: 2,
              ),
              Expanded(
                child: Container(color: Colors.transparent),
                flex: 5,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  title: Center(
                    child: Text(
                      'You\'re not even ready',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20.0, fontFamily: 'Montserrat'),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      'iriz what iriz',
                      style: TextStyle(
                          fontFamily: 'Montserrat', color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ),
                Expanded(
                  //todo: bulid list in viewmodel
                  child: StreamBuilder(
                    stream: categoriesProvider.fetchCategoriesAsStream(),
                    builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasData){
                        categories = snapshot.data.documents
                            .map((doc) => CategoryModel.fromMap(doc.documentID, doc.data)).
                        toList();

                        return GridView.builder(
                            itemCount: categories.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: .90,
                                crossAxisSpacing: 24.0
                            ),
                            itemBuilder: (buildContext, index) =>
                                CategoryItem(categoryDetails: categories[index],));
                      }
                      // todo: set indicator
                      return Text('Fetching');
                    },
                  ),
                )],
            ),
          )],
      ),
    );
  }
}