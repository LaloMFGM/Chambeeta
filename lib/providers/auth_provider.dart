import 'dart:developer';

import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/models/interfaces/login.dart';
import 'package:chambeeta/models/shared_preference.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String _user = "";
  String _email = "";
  String _password = "";

  String get user => _user;
  String get email => _email;
  String get password => _password;

  setUser(String user) {
    _user = user;
    notifyListeners();
  }

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<bool> signIn(String user, String email, String password) async {
    String url = '$baseUrl/cuentas/registrar';

    Map<String, String>? headers = {
      'Content-Type': 'application/json-patch+json',
      'Accept': 'text/json',
      'Authorization': ''
    };

    Map<String, dynamic> data = {
      'email': email,
      'userName': user,
      'password': password,
    };

    try {
      final response =
          await Dio().post(url, data: data, options: Options(headers: headers));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  Future<bool> login(String user, String password) async {
    String url = '$baseUrl/cuentas/login';

    Map<String, String>? headers = {
      'Content-Type': 'application/json-patch+json',
      'accept': 'text/plain',
    };

    Map<String, dynamic> data = {
      'userName': user,
      'password': password,
    };

    try {
      final response =
          await Dio().post(url, data: data, options: Options(headers: headers));
      

      if (response.statusCode == 200) {
        Login loginmodel = Login.fromJson(response.data);

        loginmodel.username = user;

        UserSharedPreferences().saveUserInfo(loginmodel);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }
}
