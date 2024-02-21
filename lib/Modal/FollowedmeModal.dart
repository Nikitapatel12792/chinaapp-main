class FollowedmeModal {
  String? status;
  List<Data>? data;
  String? message;

  FollowedmeModal({this.status, this.data, this.message});

  FollowedmeModal.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? profilePicture;
  String? id;
  String? followingUserId;
  String? followersUserId;
  String? followStatus;
  String? createdAt;

  Data(
      {this.name,
        this.profilePicture,
        this.id,
        this.followingUserId,
        this.followersUserId,
        this.followStatus,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
    id = json['id'];
    followingUserId = json['following_user_id'];
    followersUserId = json['followers_user_id'];
    followStatus = json['follow_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profile_picture'] = this.profilePicture;
    data['id'] = this.id;
    data['following_user_id'] = this.followingUserId;
    data['followers_user_id'] = this.followersUserId;
    data['follow_status'] = this.followStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
