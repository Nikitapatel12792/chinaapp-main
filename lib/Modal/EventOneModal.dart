class EventOne {
  String? status;
  Data? data;
  String? message;

  EventOne({this.status, this.data, this.message});

  EventOne.fromJson(Map<String, dynamic> json) {
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
  int? eventId;

  Data({this.eventId});

  Data.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    return data;
  }
}
