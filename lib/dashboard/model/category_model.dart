class CategoryModel{

  String id;
  String name;
  List<String> questions;

  CategoryModel(this.id, this.name,this.questions);

  CategoryModel.fromMap(String id, Map snapshot):
        id = id ?? '',
        name = snapshot['name'] ?? '',
        questions = List.from(snapshot['questionkeys'] )?? '';

}