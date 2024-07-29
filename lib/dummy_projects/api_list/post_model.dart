class PostModel {
  num? userId;
  num? id;
  String? title;
  String? body;
  PostModel({this.body, this.id, this.title, this.userId});

  PostModel.fromJson(Map json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}
