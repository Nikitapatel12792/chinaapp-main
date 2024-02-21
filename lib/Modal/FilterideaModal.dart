class FilterIdeaModal {
  String? status;
  List<Data>? data;
  String? message;

  FilterIdeaModal({this.status, this.data, this.message});

  FilterIdeaModal.fromJson(Map<String, dynamic> json) {
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
  int? experienced;
  int? collected;

  Data({this.ideaId, this.ideaTitle, this.experienced, this.collected});

  Data.fromJson(Map<String, dynamic> json) {
    ideaId = json['idea_id'];
    ideaTitle = json['idea_title'];
    experienced = json['experienced'];
    collected = json['collected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idea_id'] = this.ideaId;
    data['idea_title'] = this.ideaTitle;
    data['experienced'] = this.experienced;
    data['collected'] = this.collected;
    return data;
  }
}
