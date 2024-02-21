class AddcommentlikeModal {
  String? status;
  String? message;

  AddcommentlikeModal({this.status, this.message});

  AddcommentlikeModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}