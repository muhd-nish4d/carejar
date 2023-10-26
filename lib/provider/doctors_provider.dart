import 'dart:developer';

import 'package:carejar/apis/services/doctors.dart';
import 'package:carejar/models/doctor_model/doctors_model.dart';
import 'package:carejar/models/loading_status_enum.dart';
import 'package:flutter/material.dart';

class DoctorsProvider extends ChangeNotifier {
  FetchStatus fetchStatus = FetchStatus.loading;
  List<DoctorModel> doctors = [];
  Future<void> getDoctorModels() async {
    try {
      final models = await Doctors().getDoctorModels();
      

      doctors = models;
      notifyListeners();
      fetchStatus = FetchStatus.success;
      notifyListeners();
    } catch (e) {
      fetchStatus = FetchStatus.failed;
      notifyListeners();
      log(e.toString());
    }
  }
}
