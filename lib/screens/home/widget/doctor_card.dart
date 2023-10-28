import 'package:carejar/models/doctor_model/doctors_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//This is a card for show the doctor name and his profile
//on home screen

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.index,
    required this.doctorDetails,
  });
  final int index;
  final DoctorModel doctorDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: index,
              child: const CircleAvatar(
                radius: 40,
                child: Icon(
                  CupertinoIcons.person_alt,
                  size: 40,
                ),
              ),
            ),
            Text(doctorDetails.name)
          ],
        ),
      ),
    );
  }
}
