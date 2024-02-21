class MapExplorationModal {
  String? status;
  List<Data>? data;
  String? message;

  MapExplorationModal({this.status, this.data, this.message});

  MapExplorationModal.fromJson(Map<String, dynamic> json) {
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
  String? eventId;
  String? eventTitle;
  int? noOfExperienced;
  int? noOfCollected;
  String? eventStartDate;
  String? eventStartTime;
  Null? distanceToCurrentPlace;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  String? eventLatitude;
  String? eventLongitude;
  String? eventFees;
  String? profilePicture;

  Data(
      {this.eventId,
        this.eventTitle,
        this.noOfExperienced,
        this.noOfCollected,
        this.eventStartDate,
        this.eventStartTime,
        this.distanceToCurrentPlace,
        this.address,
        this.city,
        this.state,
        this.country,
        this.zipcode,
        this.eventLatitude,
        this.eventLongitude,
        this.eventFees,
        this.profilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventTitle = json['event_title'];
    noOfExperienced = json['no_of_experienced'];
    noOfCollected = json['no_of_collected'];
    eventStartDate = json['event_start_date'];
    eventStartTime = json['event_start_time'];
    distanceToCurrentPlace = json['distance_to_current_place'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipcode = json['zipcode'];
    eventLatitude = json['event_latitude'];
    eventLongitude = json['event_longitude'];
    eventFees = json['event_fees'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['event_title'] = this.eventTitle;
    data['no_of_experienced'] = this.noOfExperienced;
    data['no_of_collected'] = this.noOfCollected;
    data['event_start_date'] = this.eventStartDate;
    data['event_start_time'] = this.eventStartTime;
    data['distance_to_current_place'] = this.distanceToCurrentPlace;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zipcode'] = this.zipcode;
    data['event_latitude'] = this.eventLatitude;
    data['event_longitude'] = this.eventLongitude;
    data['event_fees'] = this.eventFees;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}
