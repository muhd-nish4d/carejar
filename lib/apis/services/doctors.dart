import 'dart:convert';
import 'dart:developer';

import 'package:carejar/apis/api_endpoints.dart';
import 'package:carejar/models/doctor_model/doctors_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Doctors {
  Future<List<DoctorModel>> getDoctorModels() async {
    //get the user names for show as doctor name
    final Uri uri = Uri.parse(ApiEndPoints.api + ApiEndPoints.userEndPoint);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<DoctorModel> models = [];
      //Store the doctor names and ID in local storage --Hive
      final doctorBox = await Hive.openBox<DoctorModel>('doctor_box');

      for (final json in jsonDecode(response.body)) {
        final doctor = DoctorModel.fromJson(json);
        doctorBox.put(doctor.id, doctor);
      }
      models.clear();
      models.addAll(doctorBox.values);
      return models;
    } else {
      log('something fisshi');
      throw Exception('Failed to get DoctorModels');
    }
  }
}
