import 'dart:io';

import 'package:chet/widgets/CustomExpection.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class authprovider with ChangeNotifier{
  Map<String, String> headers = {
    'Authorization': 'hXuRUGsEGuhGf6KG',
  };
  Future<http.Response> signupapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/signup_app";
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
  Future<http.Response> loginapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/login_app";
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
  Future<http.Response> forgotapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/forgot_password_app";
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
  Future<http.Response> profileupdateapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/edit_profile_app';
    var responseJson;
    try {
      final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
      imageUploadRequest.headers.addAll(headers);
      if (bodyData['profile_pic']?.isNotEmpty ?? false) {
        final file = await http.MultipartFile.fromPath(
            'profile_pic', bodyData['profile_pic'] ?? '',contentType: MediaType('image', 'jpg',),);
        imageUploadRequest.files.add(file);

      }
      imageUploadRequest.fields.addAll(bodyData);
      final streamResponse = await imageUploadRequest.send();
      responseJson = responses(await http.Response.fromStream(streamResponse));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

}