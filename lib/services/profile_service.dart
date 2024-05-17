import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/models/interfaces/login.dart';
import 'package:chambeeta/models/interfaces/personalInfo.dart';
import 'package:chambeeta/models/shared_preference.dart';
import 'package:dio/dio.dart';

class ProfileService {
  Future<PersonalInfo?> getPersonalInfo() async {
    Login? user = await UserSharedPreferences().loadUserInfo();

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json-patch+json',
      'Accept': 'text/json',
      'Authorization': 'Bearer ${user?.token}'
    };

    String url = '$baseUrl/PersonalInfo';

    try {
      final response = await Dio().get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        PersonalInfo personalInfo = PersonalInfo.fromJson(response.data);
        return personalInfo;
      } else {
        return PersonalInfo(
            userAddress: "",
            phoneNumber: "",
            firstName: "",
            lasttName: "",
            dateOfBirth: DateTime.now(),
            skills: '');
      }
    } catch (e) {
      return PersonalInfo(
          userAddress: "",
          phoneNumber: "",
          firstName: "",
          lasttName: "",
          dateOfBirth: DateTime.now(),
          skills: '');
    }
  }

  Future<bool> updateProfile(PersonalInfo profile) async {

    Login? user = await UserSharedPreferences().loadUserInfo();
    
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json-patch+json',
      'Accept': 'text/json',
      'Authorization': 'Bearer ${user?.token}'
    };

    String url = '$baseUrl/PersonalInfo';

    try {
      final response = await Dio().put(url, data: profile.toJson(), options: Options(headers: headers));

      if (response.statusCode ==  200 || response.statusCode == 204) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }


  }
}
