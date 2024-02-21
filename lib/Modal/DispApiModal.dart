class DispApiModal {
  String? status;
  Data? data;

  DispApiModal({this.status, this.data});

  DispApiModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalIdeas;
  int? ideaExperiencedCount;
  int? remainingNoOfIdeas;

  Data({this.totalIdeas, this.ideaExperiencedCount, this.remainingNoOfIdeas});

  Data.fromJson(Map<String, dynamic> json) {
    totalIdeas = json['total_ideas'];
    ideaExperiencedCount = json['ideaExperiencedCount'];
    remainingNoOfIdeas = json['remaining_no_of_ideas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_ideas'] = this.totalIdeas;
    data['ideaExperiencedCount'] = this.ideaExperiencedCount;
    data['remaining_no_of_ideas'] = this.remainingNoOfIdeas;
    return data;
  }
}
