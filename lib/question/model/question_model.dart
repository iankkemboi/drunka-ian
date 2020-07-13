
class QuestionModel{
  String id;
  String question;

  QuestionModel(this.id, this.question);

  QuestionModel.fromJSON(String id,Map snapshot):
      id = id ?? '',
      question = snapshot['name'] ?? '';


}