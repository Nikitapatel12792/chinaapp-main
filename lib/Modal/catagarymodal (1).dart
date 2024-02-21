class DetalisDataModal {
  String? status;
  Data? data;

  DetalisDataModal({this.status, this.data});

  DetalisDataModal.fromJson(Map<String, dynamic> json) {
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
  String? ideaId;
  String? userId;
  String? ideaName;
  List<String>? ideaCategory;
  String? contributorName;
  String? contributorProfile;
  String? experienceValue;
  String? collectionValue;
  int? noOfExperience;
  int? noOfCollection;
  int? noOfIdeaOwned;
  String? experienceLength;
  List<Event>? event;

  Data(
      {this.ideaId,
        this.userId,
        this.ideaName,
        this.ideaCategory,
        this.contributorName,
        this.contributorProfile,
        this.experienceValue,
        this.collectionValue,
        this.noOfExperience,
        this.noOfCollection,
        this.noOfIdeaOwned,
        this.experienceLength,
        this.event});

  Data.fromJson(Map<String, dynamic> json) {
    ideaId = json['idea_id'];
    userId = json['user_id'];
    ideaName = json['idea_name'];
    ideaCategory = json['idea_category'].cast<String>();
    contributorName = json['contributor_name'];
    contributorProfile = json['contributor_profile'];
    experienceValue = json['experience_value'];
    collectionValue = json['collection_value'];
    noOfExperience = json['no_of_experience'];
    noOfCollection = json['no_of_collection'];
    noOfIdeaOwned = json['no_of_idea_owned'];
    experienceLength = json['experience_length'];
    if (json['event'] != null) {
      event = <Event>[];
      json['event'].forEach((v) {
        event!.add(new Event.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idea_id'] = this.ideaId;
    data['user_id'] = this.userId;
    data['idea_name'] = this.ideaName;
    data['idea_category'] = this.ideaCategory;
    data['contributor_name'] = this.contributorName;
    data['contributor_profile'] = this.contributorProfile;
    data['experience_value'] = this.experienceValue;
    data['collection_value'] = this.collectionValue;
    data['no_of_experience'] = this.noOfExperience;
    data['no_of_collection'] = this.noOfCollection;
    data['no_of_idea_owned'] = this.noOfIdeaOwned;
    data['experience_length'] = this.experienceLength;
    if (this.event != null) {
      data['event'] = this.event!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Event {
  String? eventId;
  String? eventUserId;
  String? eventTitle;
  String? eventDescription;
  String? eventStartDate;
  String? eventStartTime;
  String? eventLocation;
  List<String>? eventPicture;
  String? eventFee;
  String? eventOrganizerName;
  String? eventProfilePic;
  String? rating;
  int? numberOfExperienced;
  int? numberOfIdeasOwned;
  String? experienceLength;
  String? remainingSeats;
  String? totalSeats;
  String? btnTxt;
  int? userRatingCount;

  Event(
      {this.eventId,
        this.eventUserId,
        this.eventTitle,
        this.eventDescription,
        this.eventStartDate,
        this.eventStartTime,
        this.eventLocation,
        this.eventPicture,
        this.eventFee,
        this.eventOrganizerName,
        this.eventProfilePic,
        this.rating,
        this.numberOfExperienced,
        this.numberOfIdeasOwned,
        this.experienceLength,
        this.remainingSeats,
        this.totalSeats,
        this.btnTxt,
        this.userRatingCount});

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventUserId = json['event_user_id'];
    eventTitle = json['event_title'];
    eventDescription = json['event_description'];
    eventStartDate = json['event_start_date'];
    eventStartTime = json['event_start_time'];
    eventLocation = json['event_location'];
    eventPicture = json['event_picture'].cast<String>();
    eventFee = json['event_fee'];
    eventOrganizerName = json['event_organizer_name'];
    eventProfilePic = json['event_profile_pic'];
    rating = json['rating'];
    numberOfExperienced = json['Number of Experienced'];
    numberOfIdeasOwned = json['Number of Ideas Owned'];
    experienceLength = json['Experience Length'];
    remainingSeats = json['remaining_seats'];
    totalSeats = json['total_seats'];
    btnTxt = json['btn_txt'];
    userRatingCount = json['user_rating_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['event_user_id'] = this.eventUserId;
    data['event_title'] = this.eventTitle;
    data['event_description'] = this.eventDescription;
    data['event_start_date'] = this.eventStartDate;
    data['event_start_time'] = this.eventStartTime;
    data['event_location'] = this.eventLocation;
    data['event_picture'] = this.eventPicture;
    data['event_fee'] = this.eventFee;
    data['event_organizer_name'] = this.eventOrganizerName;
    data['event_profile_pic'] = this.eventProfilePic;
    data['rating'] = this.rating;
    data['Number of Experienced'] = this.numberOfExperienced;
    data['Number of Ideas Owned'] = this.numberOfIdeasOwned;
    data['Experience Length'] = this.experienceLength;
    data['remaining_seats'] = this.remainingSeats;
    data['total_seats'] = this.totalSeats;
    data['btn_txt'] = this.btnTxt;
    data['user_rating_count'] = this.userRatingCount;
    return data;
  }
}

