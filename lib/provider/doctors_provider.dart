import 'dart:developer';

import 'package:carejar/apis/services/doctors.dart';
import 'package:carejar/models/doctor_model/doctors_model.dart';
import 'package:carejar/models/loading_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DoctorsProvider extends ChangeNotifier {
  //"fetchStatus" => using for update the UI as per the status of API call
  //"doctors" => store all doctor names and ID build the UI with these data
  //"isApiCalled" => this also using for know the API call status if this true
  //the UI will show a linear loading widget
  //"doctorSearch" => store the query for search the doctor
  FetchStatus? fetchStatus;
  List<DoctorModel> doctors = [];
  bool isApiCalled = false;
  TextEditingController doctorSearch = TextEditingController();
  Future<void> getDoctorModels() async {
    //taking the already stored data from local storage
    //if that is empty show loading then call API
    final doctorBox = await Hive.openBox<DoctorModel>('doctor_box');
    doctors.addAll(doctorBox.values);
    doctors.isEmpty
        ? fetchStatus = FetchStatus.loading
        : fetchStatus = FetchStatus.success;
    notifyListeners();
    try {
      isApiCalled = true;
      notifyListeners();

      //Calling API
      final models = await Doctors().getDoctorModels();

      //Filtering the doctors list with the search query
      doctors = models
          .where((element) => element.name
              .toLowerCase()
              .contains(doctorSearch.text.toLowerCase()))
          .toList();
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
