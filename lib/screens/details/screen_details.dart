import 'package:carejar/screens/details/widgets/app_bar.dart';
import 'package:carejar/screens/details/widgets/doctor_details.dart';
import 'package:flutter/material.dart';

class ScreenDetails extends StatelessWidget {
  const ScreenDetails({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DoctorAppBar(index: index),
            ),
            const WidgetDoctorDetail(
              detailKey: 'Specialty',
              detail: 'Family medicine',
            ),
            const WidgetDoctorDetail(
              detailKey: 'Education and training',
              detail:
                  'Yale University School of Medicine, University of California, San Francisco',
            ),
            const WidgetDoctorDetail(
              detailKey: 'Board certification',
              detail: ' American Board of Family Medicine',
            ),
            const WidgetDoctorDetail(
              detailKey: 'Hospital affiliations',
              detail:
                  'Stanford Hospital & Clinics, Palo Alto VA Medical Center',
            ),
            const WidgetDoctorDetail(
              detailKey: 'Experience',
              detail: '15 years',
            ),
            const WidgetDoctorDetail(
              detailKey: 'Languages spoken',
              detail: 'English, Chinese',
            ),
            const WidgetDoctorDetail(
              detailKey: 'Professional associations',
              detail:
                  'American Academy of Family Physicians, California Medical Association',
            ),
            const ExpansionTile(
              title: Text(
                'Patient reviews',
              ),
              children: [
                Text(
                    'Dr. Jones is a wonderful doctor. She is very knowledgeable and takes the time to listen to her patients. I highly recommend her.')
              ],
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, elevation: 0),
        child: const Text(
          'Book',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
