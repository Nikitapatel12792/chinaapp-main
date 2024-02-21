class RecommendedFriendModal {
  String? status;
  List<Data>? data;
  String? message;

  RecommendedFriendModal({this.status, this.data, this.message});

  RecommendedFriendModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? userId;
  String? name;
  String? profilePicture;

  Data({this.userId, this.name, this.profilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}
