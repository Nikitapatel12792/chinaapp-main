class ClaimModal {
  String? status;
  List<ClaimedEventsList>? claimedEventsList;

  ClaimModal({this.status, this.claimedEventsList});

  ClaimModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['claimed_events_list'] != null) {
      claimedEventsList = <ClaimedEventsList>[];
      json['claimed_events_list'].forEach((v) {
        claimedEventsList!.add(new ClaimedEventsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.claimedEventsList != null) {
      data['claimed_events_list'] =
          this.claimedEventsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClaimedEventsList {
  String? eventId;
  String? eventName;
  String? eventOrganizerId;
  String? eventOrganizerName;
  String? profilePicture;
  String? eventStartDate;
  String? eventEndDate;
  String? eventStartTime;
  String? eventEndTime;
  String? address;
  String? country;
  String? state;
  String? city;
  String? zipcode;
  int? noOfExperienced;

  ClaimedEventsList(
      {this.eventId,
        this.eventName,
        this.eventOrganizerId,
        this.eventOrganizerName,
        this.profilePicture,
        this.eventStartDate,
        this.eventEndDate,
        this.eventStartTime,
        this.eventEndTime,
        this.address,
        this.country,
        this.state,
        this.city,
        this.zipcode,
        this.noOfExperienced});

  ClaimedEventsList.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventName = json['event_name'];
    eventOrganizerId = json['event_organizer_id'];
    eventOrganizerName = json['event_organizer_name'];
    profilePicture = json['profile_picture'];
    eventStartDate = json['event_start_date'];
    eventEndDate = json['event_end_date'];
    eventStartTime = json['event_start_time'];
    eventEndTime = json['event_end_time'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipcode = json['zipcode'];
    noOfExperienced = json['no_of_experienced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['event_name'] = this.eventName;
    data['event_organizer_id'] = this.eventOrganizerId;
    data['event_organizer_name'] = this.eventOrganizerName;
    data['profile_picture'] = this.profilePicture;
    data['event_start_date'] = this.eventStartDate;
    data['event_end_date'] = this.eventEndDate;
    data['event_start_time'] = this.eventStartTime;
    data['event_end_time'] = this.eventEndTime;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['no_of_experienced'] = this.noOfExperienced;
    return data;
  }
}
