class DisplayemotionModal {
  String? status;
  String? emotionName;

  DisplayemotionModal({this.status, this.emotionName});

  DisplayemotionModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    emotionName = json['emotion_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['emotion_name'] = this.emotionName;
    return data;
  }
}
