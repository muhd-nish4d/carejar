import 'dart:developer';

import 'package:carejar/models/loading_status_enum.dart';
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(),
          ),
          Expanded(
            child: Consumer<DoctorsProvider>(builder: (context, value, child) {
              log(value.doctors.length.toString());
              return value.fetchStatus == FetchStatus.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : value.fetchStatus == FetchStatus.success
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ScreenDetails(index: index),
                                )),
                            child: DoctorCard(
                                index: index,
                                doctorDetails: value.doctors[index]),
                          ),
                          itemCount: value.doctors.length,
                        )
                      : const Center(
                          child: Icon(CupertinoIcons.wifi_slash),
                        );
            }),
          ),
        ],
      ),
    ));
  }
}
