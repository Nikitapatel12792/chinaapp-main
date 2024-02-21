class ChatListModal {
  String? status;
  List<MessagesData>? messagesData;

  ChatListModal({this.status, this.messagesData});

  ChatListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['messages_data'] != null) {
      messagesData = <MessagesData>[];
      json['messages_data'].forEach((v) {
        messagesData!.add(new MessagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.messagesData != null) {
      data['messages_data'] =
          this.messagesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessagesData {
  String? mid;
  String? from;
  String? to;
  String? readStatus;
  String? createdAt;
  String? type;
  String? message;
  String? profilePicture;
  String? username;
  String? uid;
  int? messageCount;
  String? msgTime;

  MessagesData(
      {this.mid,
        this.from,
        this.to,
        this.readStatus,
        this.createdAt,
        this.type,
        this.message,
        this.profilePicture,
        this.username,
        this.uid,
        this.messageCount,
        this.msgTime});

  MessagesData.fromJson(Map<String, dynamic> json) {
    mid = json['mid'];
    from = json['from'];
    to = json['to'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
    type = json['type'];
    message = json['message'];
    profilePicture = json['profile_picture'];
    username = json['username'];
    uid = json['uid'];
    messageCount = json['message_count'];
    msgTime = json['msg_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mid'] = this.mid;
    data['from'] = this.from;
    data['to'] = this.to;
    data['read_status'] = this.readStatus;
    data['created_at'] = this.createdAt;
    data['type'] = this.type;
    data['message'] = this.message;
    data['profile_picture'] = this.profilePicture;
    data['username'] = this.username;
    data['uid'] = this.uid;
    data['message_count'] = this.messageCount;
    data['msg_time'] = this.msgTime;
    return data;
  }
}
