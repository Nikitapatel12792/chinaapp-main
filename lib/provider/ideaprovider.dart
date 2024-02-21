import 'dart:convert';
import 'dart:io';

import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class ideaprovider with ChangeNotifier {
  Map<String, String> headers = {
    'Authorization': 'hXuRUGsEGuhGf6KG',

  };
  Future<http.Response> searchapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/search_ideas_by_keywords";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> idealfirst(Map<String, String> bodyData) async {
    const url = "$baseUrl/create_new_idea_step1";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> ideasecond(Map<String, String> bodyData) async {
    const url = "$baseUrl/create_new_idea_step2";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> eventone(Map<String, String> bodyData,List<File> imagePaths) async {
    const url = "$baseUrl/create_event_step1";
    var responseJson;
    final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
    imageUploadRequest.headers.addAll(headers);
    if (imagePaths.isNotEmpty) {
      for (var imagePath in imagePaths) {
        var file = await http.MultipartFile.fromPath(
          'event_pictures[]',
          imagePath.path,
          contentType: MediaType('image', 'jpg'),
        );
        imageUploadRequest.files.add(file);
      }
    }
    imageUploadRequest.fields.addAll(bodyData);
    final streamResponse = await imageUploadRequest.send();
    var response = await http.Response.fromStream(streamResponse);
    responseJson = responses(response);
    // print("responseJson = ${json.decode(responseJson)}");
    return responseJson;
  }
  Future<http.Response> idealistapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/idea_list";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> experincebuttonapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/experience_data";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> collectionbuttonapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/collection_data";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> detailidea(Map<String, String> bodyData) async {
    const url = "$baseUrl/detail_data";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> serchidapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/search_ideas";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> categoryap(Map<String, String> bodyData) async {
    const url = "$baseUrl/all_categories";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> addcommentapi(Map<String, String> bodyData,List<File> imagePaths) async {
    const url = "$baseUrl/add_comments";

    var responseJson;
    final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
    imageUploadRequest.headers.addAll(headers);
    if (imagePaths.isNotEmpty) {
      for (var imagePath in imagePaths) {
        var file = await http.MultipartFile.fromPath(
          'comment_picture[]',
          imagePath.path,
          contentType: MediaType('image', 'jpg'),
        );
        imageUploadRequest.files.add(file);
      }
    }
    imageUploadRequest.fields.addAll(bodyData);
    final streamResponse = await imageUploadRequest.send();
    var response = await http.Response.fromStream(streamResponse);
    responseJson = responses(response);
  return responseJson;
  }
  Future<http.Response> commentdisplayapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/comments";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> eventtwoapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/create_event_step2";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> userprofileapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/user_event_profile";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> DispAp(Map<String, String> bodyData) async {
    const url = "$baseUrl/login_user_ideas_count";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> Filteridiaap(Map<String, String> bodyData) async {
    const url = "$baseUrl/search_ideas";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> eventtreeapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/create_event_step3";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> addsubcommentapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/add_subcomment";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> addsubcommentlikeapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/add_likecomment";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> ifollowlistapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/followed_list";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson =
        responses(response);
    return responseJson;
  }
  Future<http.Response> followmelistapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/followers_list";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> unfloowapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/unfollow_user";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> floowapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/follow_user";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }


  Future<http.Response> mapexpolorapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/map_exploration";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> chatlistapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/messages_list";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> messagesapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/send_message";
    var responseJson;
    if(bodyData['type'] == "1" || bodyData['type'] == "6" ){
      final response = await http
          .post(Uri.parse(url), body: bodyData, headers: headers)
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const SocketException('Something went wrong');
        },
      );
      responseJson = responses(response);
      return responseJson;
    }
    else{
      final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
      imageUploadRequest.headers.addAll(headers);
      if (bodyData['message']?.isNotEmpty ?? false) {

        var file = await http.MultipartFile.fromPath(
          'message',
          bodyData['message'] ?? "",
          contentType: MediaType('image', 'jpg'),
        );
        imageUploadRequest.files.add(file);

      }
      imageUploadRequest.fields.addAll(bodyData);
      final streamResponse = await imageUploadRequest.send();
      var response = await http.Response.fromStream(streamResponse);
      responseJson = responses(response);

      return responseJson;
    }

  }
  Future<http.Response> messagesuserapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/chat_messages";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> signeventupapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/event_signup";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> recommdefrapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/recommended_friend";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> eventcancelapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/cancel_event_signup";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> statsapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/update_read_status";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> notificationapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/message_notification";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> cityapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/idea_cities";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  // Future<http.Response> profileupdateapi(Map<String, String> bodyData,List<File> imagePaths) async {
  //   const url = '$baseUrl/edit_profile_app';
  //   var responseJson;
  //   try {
  //     final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
  //     imageUploadRequest.headers.addAll(headers);
  //     if (bodyData['profile_pic']?.isNotEmpty ?? false) {
  //       final file = await http.MultipartFile.fromPath(
  //           'profile_pic', bodyData['profile_pic'] ?? '',contentType: MediaType('image', 'jpg,jpeg'));
  //       imageUploadRequest.files.add(file);
  //     }
  //     imageUploadRequest.fields.addAll(bodyData);
  //     final streamResponse = await imageUploadRequest.send();
  //     responseJson = responses(await http.Response.fromStream(streamResponse));
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  Future<http.Response> profileupdateapi(Map<String, String> bodyData,List<File> imagePaths) async {
    const url = "$baseUrl/edit_profile_app";
    var responseJson;
    final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
    imageUploadRequest.headers.addAll(headers);
    if (imagePaths.isNotEmpty) {
      for (var imagePath in imagePaths) {
        var file = await http.MultipartFile.fromPath(
          'profile_pic',
          imagePath.path,
          contentType: MediaType('image', 'jpg'),
        );
        imageUploadRequest.files.add(file);
      }
    }
    imageUploadRequest.fields.addAll(bodyData);
    final streamResponse = await imageUploadRequest.send();
    var response = await http.Response.fromStream(streamResponse);
    responseJson = responses(response);
    // print("responseJson = ${json.decode(responseJson)}");
    return responseJson;
  }
  Future<http.Response> displayemotion(Map<String, String> bodyData) async {
    const url = "$baseUrl/display_emotion";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> emotionadd(Map<String, String> bodyData) async {
    const url = "$baseUrl/add_emotion";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> ratingapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/add_rating";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> selfapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/login_user_idea_list";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> generatepdfapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/generate_pdf";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> claimapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/claim_events_list";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> notificationfollowapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/getMyNotification";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> climeventdeleteapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/delete_claim_event";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }


// Replace with your server endpoint
//   final String uploadUrl = 'https://suppchat.fableadtechnolabs.com/api/edit_profile_app';
//
//   Future<void> uploadImage(String imagePath) async {
//     var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
//     request.files.add(await http.MultipartFile.fromPath(
//       'profile_pic',
//       imagePath,
//       contentType: MediaType('image', 'jpeg'), // Adjust content type as needed
//     ));
//
//     try {
//       var response = await request.send();
//       if (response.statusCode == 200) {
//         print('Image uploaded successfully');
//       } else {
//         print('Image upload failed with status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error uploading image: $error');
//     }
//   }
  }