class MessangerChatModel {
  String? image;
  String? name;
  String? message;
  Status? status;

  MessangerChatModel.fromJson(Map json) {
    image = json["image"];
    name = json["name"];
    message = json["message"];
    switch (json["status"]) {
      case "recieved":
        status = Status.REC;
      case "read":
        status = Status.READ;
      case "read_recieved":
        status = Status.READ_REC;
      default:
        status = Status.READ_REC;
    }
  }
}

/// read
/// recieved
/// read and online
///
enum Status {
  READ,
  REC,
  READ_REC,
}
