class ChatMessagesUserModal {
  String? status;
  String? message;
  List<Data>? data;

  ChatMessagesUserModal({this.status, this.message, this.data});

  ChatMessagesUserModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? chatId;
  String? fromUserId;
  String? toUserId;
  String? message;
  String? messageType;
  String? readStatus;
  String? date;
  String? time;

  Data(
      {this.chatId,
        this.fromUserId,
        this.toUserId,
        this.message,
        this.messageType,
        this.readStatus,
        this.date,
        this.time});

  Data.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    fromUserId = json['from_user_id'];
    toUserId = json['to_user_id'];
    message = json['message'];
    messageType = json['message_type'];
    readStatus = json['read_status'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    data['from_user_id'] = this.fromUserId;
    data['to_user_id'] = this.toUserId;
    data['message'] = this.message;
    data['message_type'] = this.messageType;
    data['read_status'] = this.readStatus;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
