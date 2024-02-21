class Userprofile {
  String? status;
  Data? data;

  Userprofile({this.status, this.data});

  Userprofile.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? username;
  String? profilePicture;
  int? noOfExperienced;
  int? noOfCollected;
  int? noOfOwned;
  int? isFollow;
  List<SignupEventsList>? signupEventsList;
  List<EventsParticipatedInBefore>? eventsParticipatedInBefore;
  List<ExperiencedIdeasList>? experiencedIdeasList;
  List<CollectedIdeasList>? collectedIdeasList;
  int? userRatingCount;
  String? avatarName;

  Data(
      {this.userId,
        this.username,
        this.profilePicture,
        this.noOfExperienced,
        this.noOfCollected,
        this.noOfOwned,
        this.signupEventsList,
        this.eventsParticipatedInBefore,
        this.experiencedIdeasList,
        this.isFollow,
        this.collectedIdeasList,
        this.userRatingCount,  this.avatarName
      });

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    profilePicture = json['profile_picture'];
    noOfExperienced = json['No of Experienced'];
    noOfCollected = json['No of Collected'];
    noOfOwned = json['No of Owned'];
    isFollow = json['is_follow'];
    if (json['signup_events_list'] != null) {
      signupEventsList = <SignupEventsList>[];
      json['signup_events_list'].forEach((v) {
        signupEventsList!.add(new SignupEventsList.fromJson(v));
      });
    }
    if (json['events_participated_in_before'] != null) {
      eventsParticipatedInBefore = <EventsParticipatedInBefore>[];
      json['events_participated_in_before'].forEach((v) {
        eventsParticipatedInBefore!
            .add(new EventsParticipatedInBefore.fromJson(v));
      });
    }
    if (json['experienced_ideas_list'] != null) {
      experiencedIdeasList = <ExperiencedIdeasList>[];
      json['experienced_ideas_list'].forEach((v) {
        experiencedIdeasList!.add(new ExperiencedIdeasList.fromJson(v));
      });
    }
    if (json['collected_ideas_list'] != null) {
      collectedIdeasList = <CollectedIdeasList>[];
      json['collected_ideas_list'].forEach((v) {
        collectedIdeasList!.add(new CollectedIdeasList.fromJson(v));
      });
    }
    userRatingCount = json['user_rating_count'];
    avatarName = json['avatar_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['profile_picture'] = this.profilePicture;
    data['No of Experienced'] = this.noOfExperienced;
    data['No of Collected'] = this.noOfCollected;
    data['No of Owned'] = this.noOfOwned;
    data['is_follow'] = this.isFollow;
    if (this.signupEventsList != null) {
      data['signup_events_list'] =
          this.signupEventsList!.map((v) => v.toJson()).toList();
    }
    if (this.eventsParticipatedInBefore != null) {
      data['events_participated_in_before'] =
          this.eventsParticipatedInBefore!.map((v) => v.toJson()).toList();
    }
    if (this.experiencedIdeasList != null) {
      data['experienced_ideas_list'] =
          this.experiencedIdeasList!.map((v) => v.toJson()).toList();
    }
    if (this.collectedIdeasList != null) {
      data['collected_ideas_list'] =
          this.collectedIdeasList!.map((v) => v.toJson()).toList();
    }
    data['user_rating_count'] = this.userRatingCount;
    data['avatar_name'] = this.avatarName;
    return data;
  }
}

class SignupEventsList {
  String? eventOrgId;
  String? eventId;
  String? eventName;
  String? eventStartDate;
  String? eventEndDate;
  String? eventStartTime;
  String? eventEndTime;
  String? address;
  String? country;
  String? state;
  String? city;
  String? zipcode;
  String? profilePic;
  int? noOfExperienced;

  SignupEventsList(
      {this.eventOrgId,
        this.eventId,
        this.eventName,
        this.eventStartDate,
        this.eventEndDate,
        this.eventStartTime,
        this.eventEndTime,
        this.address,
        this.country,
        this.state,
        this.city,
        this.zipcode,
        this.profilePic,
        this.noOfExperienced});

  SignupEventsList.fromJson(Map<String, dynamic> json) {
    eventOrgId = json['event_org_id'];
    eventId = json['event_id'];
    eventName = json['event_name'];
    eventStartDate = json['event_start_date'];
    eventEndDate = json['event_end_date'];
    eventStartTime = json['event_start_time'];
    eventEndTime = json['event_end_time'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipcode = json['zipcode'];
    profilePic = json['profile_pic'];
    noOfExperienced = json['no_of_experienced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_org_id'] = this.eventOrgId;
    data['event_id'] = this.eventId;
    data['event_name'] = this.eventName;
    data['event_start_date'] = this.eventStartDate;
    data['event_end_date'] = this.eventEndDate;
    data['event_start_time'] = this.eventStartTime;
    data['event_end_time'] = this.eventEndTime;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['profile_pic'] = this.profilePic;
    data['no_of_experienced'] = this.noOfExperienced;
    return data;
  }
}

class EventsParticipatedInBefore {
  String? eventId;
  String? eventTitle;
  String? eventOrgId;
  String? eventName;
  String? eventStartDate;
  String? eventEndDate;
  String? eventStartTime;
  String? eventEndTime;
  String? address;
  String? country;
  String? state;
  String? city;
  String? zipcode;
  String? profilePic;
  int? noOfExperienced;

  EventsParticipatedInBefore(
      {this.eventId,
        this.eventTitle,
        this.eventOrgId,
        this.eventName,
        this.eventStartDate,
        this.eventEndDate,
        this.eventStartTime,
        this.eventEndTime,
        this.address,
        this.country,
        this.state,
        this.city,
        this.zipcode,
        this.profilePic,
        this.noOfExperienced});

  EventsParticipatedInBefore.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventTitle = json['event_title'];
    eventOrgId = json['event_org_id'];
    eventName = json['event_name'];
    eventStartDate = json['event_start_date'];
    eventEndDate = json['event_end_date'];
    eventStartTime = json['event_start_time'];
    eventEndTime = json['event_end_time'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipcode = json['zipcode'];
    profilePic = json['profile_pic'];
    noOfExperienced = json['no_of_experienced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['event_title'] = this.eventTitle;
    data['event_org_id'] = this.eventOrgId;
    data['event_name'] = this.eventName;
    data['event_start_date'] = this.eventStartDate;
    data['event_end_date'] = this.eventEndDate;
    data['event_start_time'] = this.eventStartTime;
    data['event_end_time'] = this.eventEndTime;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['profile_pic'] = this.profilePic;
    data['no_of_experienced'] = this.noOfExperienced;
    return data;
  }
}

class ExperiencedIdeasList {
  String? date;
  List<Idealist>? idealist;

  ExperiencedIdeasList({this.date, this.idealist});

  ExperiencedIdeasList.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['idealist'] != null) {
      idealist = <Idealist>[];
      json['idealist'].forEach((v) {
        idealist!.add(new Idealist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.idealist != null) {
      data['idealist'] = this.idealist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Idealist {
  String? ideaId;
  String? ideaTitle;
  String? yearMonth;
  int? isExperienced;
  int? isCollected;

  Idealist(
      {this.ideaId,
        this.ideaTitle,
        this.yearMonth,
        this.isExperienced,
        this.isCollected});

  Idealist.fromJson(Map<String, dynamic> json) {
    ideaId = json['idea_id'];
    ideaTitle = json['idea_title'];
    yearMonth = json['year_month'];
    isExperienced = json['is_experienced'];
    isCollected = json['is_collected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idea_id'] = this.ideaId;
    data['idea_title'] = this.ideaTitle;
    data['year_month'] = this.yearMonth;
    data['is_experienced'] = this.isExperienced;
    data['is_collected'] = this.isCollected;
    return data;
  }
}
class CollectedIdeasList {
  String? date;
  List<Idealist1>? idealist1;

  CollectedIdeasList({this.date, this.idealist1});

  CollectedIdeasList.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['idealist1'] != null) {
      idealist1 = <Idealist1>[];
      json['idealist1'].forEach((v) {
        idealist1!.add(new Idealist1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.idealist1 != null) {
      data['idealist1'] = this.idealist1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Idealist1 {
  String? ideaId;
  String? ideaTitle;
  String? yearMonth;
  int? isExperienced;
  int? isCollected;

  Idealist1(
      {this.ideaId,
        this.ideaTitle,
        this.yearMonth,
        this.isExperienced,
        this.isCollected});

  Idealist1.fromJson(Map<String, dynamic> json) {
    ideaId = json['idea_id'];
    ideaTitle = json['idea_title'];
    yearMonth = json['year_month'];
    isExperienced = json['is_experienced'];
    isCollected = json['is_collected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idea_id'] = this.ideaId;
    data['idea_title'] = this.ideaTitle;
    data['year_month'] = this.yearMonth;
    data['is_experienced'] = this.isExperienced;
    data['is_collected'] = this.isCollected;
    return data;
  }
}