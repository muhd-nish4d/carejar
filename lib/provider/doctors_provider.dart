import 'dart:developer';

import 'package:carejar/apis/services/doctors.dart';
import 'package:carejar/models/doctor_model/doctors_model.dart';
import 'package:carejar/models/loading_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DoctorsProvider extends ChangeNotifier {
  FetchStatus? fetchStatus;
  List<DoctorModel> doctors = [];
  bool isApiCalled = false;
  TextEditingController doctorSearch = TextEditingController();
  Future<void> getDoctorModels() async {
    final doctorBox = await Hive.openBox<DoctorModel>('doctor_box');
    doctors.addAll(doctorBox.values);
    doctors.isEmpty
        ? fetchStatus = FetchStatus.loading
        : fetchStatus = FetchStatus.success;
    notifyListeners();
    try {
      isApiCalled = true;
      notifyListeners();
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
    isApiCalled = false;
    notifyListeners();
  }
}
