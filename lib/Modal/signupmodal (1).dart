// class SignupModal {
//   String? status;
//   String? message;
//
//   SignupModal({this.status, this.message});
//
//   SignupModal.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     return data;
//   }
// }
class SignupModal {
  String? status;
  UserData? userData;
  String? message;

  SignupModal({this.status, this.userData, this.message});

  SignupModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  String? id;
  String? username;
  String? email;
  String? loginTime;
  String? createdAt;
  Null? phoneNo;
  Null? profilePicture;
  Null? latitude;
  Null? longitude;

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

  UserData.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
