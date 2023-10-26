import 'package:carejar/provider/doctors_provider.dart';
import 'package:carejar/screens/home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Provider.of<DoctorsProvider>(context, listen: false)
                  .getDoctorModels();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenHome(),
                  ));
            },
            child: const Text('Book your doctor')),
      ),
    );
  }
}
