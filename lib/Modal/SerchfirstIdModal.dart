class SerchfirstIdModal {
  String? status;
  Data? data;

  SerchfirstIdModal({this.status, this.data});

  SerchfirstIdModal.fromJson(Map<String, dynamic> json) {
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
  int? totalExpericeIdea;
  int? ideaExperiencedCount;
  int? remainingNoOfIdeas;

  Data(
      {this.totalExpericeIdea,
        this.ideaExperiencedCount,
        this.remainingNoOfIdeas});

  Data.fromJson(Map<String, dynamic> json) {
    totalExpericeIdea = json['total_experice_idea'];
    ideaExperiencedCount = json['idea_experienced_count'];
    remainingNoOfIdeas = json['remaining_no_of_ideas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_experice_idea'] = this.totalExpericeIdea;
    data['idea_experienced_count'] = this.ideaExperiencedCount;
    data['remaining_no_of_ideas'] = this.remainingNoOfIdeas;
    return data;
  }
}
