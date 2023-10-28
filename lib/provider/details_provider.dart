import 'dart:developer';

import 'package:carejar/models/details_model/detials_model.dart';
import 'package:carejar/models/loading_status_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  //"status" => using for update the UI as per the status fireStore data
  //"details" => store all doctor's details for build the UI with these data
  //"isApiCalled" => this also using for know the API call status if this true
  //the UI will show a linear loading widget
  //"buttonStatus" => using for update the UI as per the status of on click function
  FetchStatus? status;
  late DetailsModel details;
  FetchStatus? buttonStatus = FetchStatus.success;
  final fireStore = FirebaseFirestore.instance;
  Future<void> getDetailsFromFireStore(String userId) async {
    status = FetchStatus.loading;
    notifyListeners();

    try {
      //Taking a specific doctor data with the help of doctor's ID
      //if the fireStor collection have a doc with the same ID
      //that will get and store the first doc to detailsCollection
      final detailsCollection = await fireStore
          .collection('details')
          .where('id', isEqualTo: userId)
          .get()
          .then((value) => value.docs.first);

      var data = DetailsModel.fromJson(detailsCollection.data());
      details = data;
      notifyListeners();
      status = FetchStatus.success;
      notifyListeners();
    } catch (e) {
      status = FetchStatus.failed;
      notifyListeners();
      log(e.toString());
    }
  }

  Future<void> bookUnbook(final bool isBooked, final String userId) async {
    buttonStatus = FetchStatus.loading;
    notifyListeners();
    try {
      //Taking a specific doctor data with the help of doctor's ID
      //if the fireStor collection have a doc with the same ID
      //that will get and store the first doc to detailsCollection
      final detailsCollection = await fireStore
          .collection('details')
          .where('id', isEqualTo: userId)
          .get()
          .then((value) => value.docs.first);
      
      //Update the specific doctor's "isBooked" as per the status of button click
      fireStore
          .collection('details')
          .doc(detailsCollection.id)
          .update({'isBooked': !isBooked}).then((value) {
        buttonStatus = FetchStatus.success;
        details.isBooked = !isBooked;
        notifyListeners();
      });
    } catch (e) {
      buttonStatus = FetchStatus.failed;
      notifyListeners();
      log(e.toString());
    }
  }
}
