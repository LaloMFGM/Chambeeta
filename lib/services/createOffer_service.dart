import 'dart:convert';

import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/models/interfaces/createOffer.dart';
import 'package:chambeeta/models/interfaces/getJobs.dart';
import 'package:chambeeta/models/interfaces/getOffers.dart';
import 'package:chambeeta/models/interfaces/login.dart';
import 'package:chambeeta/models/shared_preference.dart';
import 'package:dio/dio.dart';

class CreateOfferService {
  
  Future<List<GetOffer?>> getAllOffers() async {
    Login? user = await UserSharedPreferences().loadUserInfo();

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json-patch+json',
      'Accept': 'text/plain',
      'Authorization': 'Bearer ${user?.token}'
    };

    String url = '$baseUrl/chambas/ChambasDisponibles';

    try {
      final response = await Dio().get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        List<GetOffer> offers = getOfferFromJson(jsonEncode(response.data));
        return offers;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<GetOffer>> getMyOffers() async{
    Login? user = await UserSharedPreferences().loadUserInfo();

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json-patch+json',
      'Accept': 'text/plain',
      'Authorization': 'Bearer ${user?.token}'
    };

    String url = '$baseUrl/chambas/obtenerChambasCreadas';


    try {
      final response = await Dio().get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        List<GetOffer> offers = getOfferFromJson(jsonEncode(response.data));
        return offers;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }


  }



  Future<List<GetOffer>> searchOffers(String job) async {
    Login? user = await UserSharedPreferences().loadUserInfo();

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json-patch+json',
      'Accept': 'text/plain',
      'Authorization': 'Bearer ${user?.token}'
    };

    String url = '$baseUrl/chambas/$job';

    try {
      final response = await Dio().get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        List<GetOffer> offers = getOfferFromJson(jsonEncode(response.data));
        return offers;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }


  Future<List<GetJobs>> getJobs() async {
    Login? user = await UserSharedPreferences().loadUserInfo();

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json-patch+json',
      'Accept': 'text/plain',
      'Authorization': 'Bearer ${user?.token}'
    };

    String url = '$baseUrl/chambas/MisChambas';

    try {
      final response = await Dio().get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        List<GetJobs> jobs = getJobsFromJson(jsonEncode(response.data));
        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> postulateOffer() async{
    Login? user = await UserSharedPreferences().loadUserInfo();

    


  }


  Future<bool> createOffer(CreateOffers offer) async {
    Login? user = await UserSharedPreferences().loadUserInfo();

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json-patch+json',
      'Accept': '*/*',
      'Authorization': 'Bearer ${user?.token}'
    };

    String url = '$baseUrl/CrearChamba';

    try {
      final response = await Dio()
          .post(url, data: offer.toJson(), options: Options(headers: headers));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
