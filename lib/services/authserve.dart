import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();

  auth(username, ID, pass) async {
    try {
      return await dio.post(
        "https://sihbackendflutter.herokuapp.com/authenticate",
        data: {
          "username": username,
          "mseID": ID,
          "password": pass,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  addUser(username, ID, password) async {
    try {
      return await dio.post(
        "https://sihbackendflutter.herokuapp.com/adduser",
        data: {
          "username": username,
          "mseID": ID,
          "password": password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
    } on DioError catch (e) {}
  }
}
