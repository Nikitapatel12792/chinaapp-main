class CityIdeaModal {
  String? status;
  List<String>? cities;
  String? message;

  CityIdeaModal({this.status, this.cities, this.message});

  CityIdeaModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    cities = json['cities'].cast<String>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['cities'] = this.cities;
    data['message'] = this.message;
    return data;
  }
}
