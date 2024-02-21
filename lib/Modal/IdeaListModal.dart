class IdeaListModal {
  String? status;
  List<Data>? data;

  IdeaListModal({this.status, this.data});

  IdeaListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? ideaId;
  String? ideaName;
  int? noOfExperience;
  String? buttonExperience;
  String? buttonCollected;
  int? noOfCollection;
  String? experienceValue;

  Data(
      {this.ideaId,
        this.ideaName,
        this.noOfExperience,
        this.buttonExperience,
        this.buttonCollected,
        this.noOfCollection,
        this.experienceValue});

  Data.fromJson(Map<String, dynamic> json) {
    ideaId = json['idea_id'];
    ideaName = json['idea_name'];
    noOfExperience = json['no_of_experience'];
    buttonExperience = json['button_experience'];
    buttonCollected = json['button_collected'];
    noOfCollection = json['no_of_collection'];
    experienceValue = json['experience_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idea_id'] = this.ideaId;
    data['idea_name'] = this.ideaName;
    data['no_of_experience'] = this.noOfExperience;
    data['button_experience'] = this.buttonExperience;
    data['button_collected'] = this.buttonCollected;
    data['no_of_collection'] = this.noOfCollection;
    data['experience_value'] = this.experienceValue;
    return data;
  }
}
