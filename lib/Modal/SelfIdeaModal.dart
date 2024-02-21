class SelfIdeaModal {
  String? status;
  List<Data>? data;
  String? message;

  SelfIdeaModal({this.status, this.data, this.message});

  SelfIdeaModal.fromJson(Map<String, dynamic> json) {
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
  String? ideaId;
  String? ideaTitle;
  String? userId;
  int? experienceCount;
  int? collectedCount;

  Data(
      {this.ideaId,
        this.ideaTitle,
        this.userId,
        this.experienceCount,
        this.collectedCount});

  Data.fromJson(Map<String, dynamic> json) {
    ideaId = json['idea_id'];
    ideaTitle = json['idea_title'];
    userId = json['user_id'];
    experienceCount = json['experience_count'];
    collectedCount = json['collected_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idea_id'] = this.ideaId;
    data['idea_title'] = this.ideaTitle;
    data['user_id'] = this.userId;
    data['experience_count'] = this.experienceCount;
    data['collected_count'] = this.collectedCount;
    return data;
  }
}
