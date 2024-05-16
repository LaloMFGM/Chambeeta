import 'dart:developer';

import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/models/interfaces/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginService {
  Future<bool?> signIn(String email, String password, String user) async {
    String url = '$baseUrl/api/auth/login';

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': ''
    };

    Map<String, dynamic> data = {
      'email': email,
      'user': user,
      'password': password,
    };

    try {
      final response =
          await Dio().post(url, data: data, options: Options(headers: headers));
      log(response.data.toString());

      return response.statusCode == 200 ? true : false;
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  Future<bool?> login(
      BuildContext context, String user, String password) async {
    String url = '$baseUrl/cuentas/login';

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': ''
    };

    Map<String, dynamic> data = {
      'user': user,
      'password': password,
    };

    try {
      final response =
          await Dio().post(url, data: data, options: Options(headers: headers));
      log(response.data.toString());

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
}
