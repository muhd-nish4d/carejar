import 'dart:developer';

import 'package:carejar/models/loading_status_enum.dart';
import 'package:carejar/provider/details_provider.dart';
import 'package:carejar/provider/doctors_provider.dart';
import 'package:carejar/screens/details/screen_details.dart';
import 'package:carejar/screens/home/widget/doctor_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: Consumer<DoctorsProvider>(builder: (context, value, child) {
              log(value.doctors.length.toString());
              return value.fetchStatus == FetchStatus.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        Column(
                          children: [
                            Visibility(
                                visible: value.isApiCalled,
                                child: const LinearProgressIndicator()),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Provider.of<DetailsProvider>(context,
                                            listen: false)
                                        .getDetailsFromFireStore(
                                            value.doctors[index].id.toString());

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ScreenDetails(index: index),
                                        ));
                                  },
                                  child: DoctorCard(
                                      index: index,
                                      doctorDetails: value.doctors[index]),
                                ),
                                itemCount: value.doctors.length,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                            visible: value.fetchStatus == FetchStatus.failed
                                ? true
                                : false,
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              color: Colors.black.withOpacity(.5),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.signal_wifi_bad_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Check your internet connection',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    );
            }),
          ),
        ],
      ),
    ));
  }
}
