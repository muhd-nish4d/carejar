import 'dart:developer';

import 'package:carejar/models/details_model/detials_model.dart';
import 'package:carejar/models/loading_status_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  FetchStatus? status;
  late DetailsModel details;
  FetchStatus? buttonStatus = FetchStatus.success;
  final fireStore = FirebaseFirestore.instance;
  Future<void> getDetailsFromFireStore(String userId) async {
    status = FetchStatus.loading;
    notifyListeners();

    try {
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
      final detailsCollection = await fireStore
          .collection('details')
          .where('id', isEqualTo: userId)
          .get()
          .then((value) => value.docs.first);

      fireStore
          .collection('details')
          .doc(detailsCollection.id)
          .update({'isBooked': !isBooked});
      details.isBooked = !isBooked;

      buttonStatus = FetchStatus.success;
      notifyListeners();
    } catch (e) {
      buttonStatus = FetchStatus.failed;
      notifyListeners();
      log(e.toString());
    }
  }
}
