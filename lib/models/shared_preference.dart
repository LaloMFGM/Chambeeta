import 'dart:convert';
import 'package:chambeeta/models/interfaces/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  // ignore: unused_field
  static late SharedPreferences _preferences;

  static Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();



  Future<void> saveUserInfo(Login loginstorage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String json = jsonEncode(loginstorage);

    prefs.setString('UserInfo', json);
  }

  Future<void> removeUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('UserInfo');
  }



  Future<Login?> loadUserInfo() async {
 
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? json = prefs.getString('UserInfo');

    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);

      Login user = Login.fromJson(map);

      return user;
    } else {
      // Si no hay un objeto guardado, puedes devolver un objeto por defecto
      return null;
    }
  }


  Future<void> saveFinishingRecord(Map<String, dynamic> finishingRecord) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic>? list = await loadFinishingRecord();
    list.add(finishingRecord);
    String json = jsonEncode(list);
    prefs.setString('finishingRecords', json);
  }

  Future<List<dynamic>> loadFinishingRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString('finishingRecords');
    if (json != null) {
      List<dynamic> list = jsonDecode(json);
      return list;
    } else {
      // Si no hay un objeto guardado, puedes devolver un objeto por defecto
      return [];
    }
  }

}
