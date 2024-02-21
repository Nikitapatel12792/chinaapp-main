class GeneratePdfModal {
  String? status;
  Data? data;

  GeneratePdfModal({this.status, this.data});

  GeneratePdfModal.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? profilePicture;
  int? exprienceCount;
  int? collectedCount;
  int? ideaOwned;
  List<ExpriencedIdeas>? expriencedIdeas;

  Data(
      {this.name,
        this.profilePicture,
        this.exprienceCount,
        this.collectedCount,
        this.ideaOwned,
        this.expriencedIdeas});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
    exprienceCount = json['exprience_count'];
    collectedCount = json['collected_count'];
    ideaOwned = json['idea_owned'];
    if (json['exprienced_ideas'] != null) {
      expriencedIdeas = <ExpriencedIdeas>[];
      json['exprienced_ideas'].forEach((v) {
        expriencedIdeas!.add(new ExpriencedIdeas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profile_picture'] = this.profilePicture;
    data['exprience_count'] = this.exprienceCount;
    data['collected_count'] = this.collectedCount;
    data['idea_owned'] = this.ideaOwned;
    if (this.expriencedIdeas != null) {
      data['exprienced_ideas'] =
          this.expriencedIdeas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpriencedIdeas {
  String? ideaId;
  String? ideaTitle;

  ExpriencedIdeas({this.ideaId, this.ideaTitle});

  ExpriencedIdeas.fromJson(Map<String, dynamic> json) {
    ideaId = json['idea_id'];
    ideaTitle = json['idea_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idea_id'] = this.ideaId;
    data['idea_title'] = this.ideaTitle;
    return data;
  }
}
