class NotificationFollowModal {
  String? status;
  List<Notifications>? notifications;

  NotificationFollowModal({this.status, this.notifications});

  NotificationFollowModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String? type;
  String? date;
  String? title;
  String? content;

  Notifications({this.type, this.date, this.title, this.content});

  Notifications.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    date = json['date'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['date'] = this.date;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
