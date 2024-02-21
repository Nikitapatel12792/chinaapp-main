class FirstideaModal {
  String? status;
  Data? data;
  String? message;

  FirstideaModal({this.status, this.data, this.message});

  FirstideaModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? ideaId;

  Data({this.ideaId});

  Data.fromJson(Map<String, dynamic> json) {
    ideaId = json['idea_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idea_id'] = this.ideaId;
    return data;
  }
}
