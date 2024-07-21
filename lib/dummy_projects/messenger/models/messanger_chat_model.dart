class MessangerChatModel {
  String? image;
  String? name;
  String? message;

  MessangerChatModel.fromJson(Map json) {
    image = json["image"];
    name = json["name"];
    message = json["message"];
  }
}

/// read
/// recieved
/// read and online
