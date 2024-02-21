class CommentdisplayModal {
  String? status;
  List<Data>? data;

  CommentdisplayModal({this.status, this.data});

  CommentdisplayModal.fromJson(Map<String, dynamic> json) {
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
  String? commentId;
  String? commentName;
  String? location;
  List<String>? picture;
  String? username;
  String? userpicture;
  String? commentDescription;
  int? commentLikes;
  int? subcommentCount;
  List<Subcomment>? subcomment;
  int? likeCount;

  Data(
      {this.commentId,
        this.commentName,
        this.location,
        this.picture,
        this.username,
        this.userpicture,
        this.commentDescription,
        this.commentLikes,
        this.subcommentCount,
        this.likeCount,
        this.subcomment});

  Data.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    commentName = json['comment_name'];
    location = json['location'];
    picture = json['picture'].cast<String>();
    username = json['username'];
    userpicture = json['userpicture'];
    commentDescription = json['comment_description'];
    commentLikes = json['comment_likes'];
    subcommentCount = json['subcomment_count'];
    likeCount = json['like_count'];
    if (json['subcomment'] != null) {
      subcomment = <Subcomment>[];
      json['subcomment'].forEach((v) {
        subcomment!.add(new Subcomment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_id'] = this.commentId;
    data['comment_name'] = this.commentName;
    data['location'] = this.location;
    data['picture'] = this.picture;
    data['username'] = this.username;
    data['userpicture'] = this.userpicture;
    data['comment_description'] = this.commentDescription;
    data['comment_likes'] = this.commentLikes;
    data['subcomment_count'] = this.subcommentCount;
    data['like_count'] = this.likeCount;
    if (this.subcomment != null) {
      data['subcomment'] = this.subcomment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcomment {
  String? subcommentId;
  String? subcomment;
  String? subcommentName;

  Subcomment({this.subcommentId, this.subcomment, this.subcommentName});

  Subcomment.fromJson(Map<String, dynamic> json) {
    subcommentId = json['subcomment_id'];
    subcomment = json['subcomment'];
    subcommentName = json['subcomment_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcomment_id'] = this.subcommentId;
    data['subcomment'] = this.subcomment;
    data['subcomment_name'] = this.subcommentName;
    return data;
  }
}
