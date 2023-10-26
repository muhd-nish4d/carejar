import 'dart:convert';

import 'package:carejar/apis/api_endpoints.dart';
import 'package:carejar/models/doctor_model/doctors_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Doctors {
  Future<List<DoctorModel>> getDoctorModels() async {
    final Uri uri = Uri.parse(ApiEndPoints.api + ApiEndPoints.userEndPoint);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<DoctorModel> models = [];
      final doctorBox = await Hive.openBox<DoctorModel>('doctor_box');

      for (final json in jsonDecode(response.body)) {
        final doctor = DoctorModel.fromJson(json);
        doctorBox.put(doctor.id, doctor);
      }
      models.clear();
      models.addAll(doctorBox.values);
      return models;
    } else {
      throw Exception('Failed to get DoctorModels');
    }
  }
}
