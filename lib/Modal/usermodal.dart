class UserModal {
  String? status;
  String? message;
  UserData? userData;

  UserModal({this.status, this.message, this.userData});

  UserModal.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? username;
  String? email;
  String? loginTime;
  String? createdAt;
  String? phoneNo;
  String? profilePicture;
  String? latitude;
  String? longitude;

  UserData(
      {this.id,
        this.username,
        this.email,
        this.loginTime,
        this.createdAt,
        this.phoneNo,
        this.profilePicture,
        this.latitude,
        this.longitude});

  UserData.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    loginTime = json['login_time'];
    createdAt = json['created_at'];
    phoneNo = json['phone_no'];
    profilePicture = json['profile_picture'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['login_time'] = this.loginTime;
    data['created_at'] = this.createdAt;
    data['phone_no'] = this.phoneNo;
    data['profile_picture'] = this.profilePicture;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
