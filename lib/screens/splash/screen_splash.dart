import 'dart:async';

import 'package:carejar/provider/doctors_provider.dart';
import 'package:carejar/screens/home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    //This provider call the doctors from given api then list
    //in home screen

    Provider.of<DoctorsProvider>(context, listen: false).getDoctorModels();

    //After 3 seconds this spalsh automatically navigate to
    //Home screen with the help "Timer"

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ScreenHome(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Care Jar',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30),
      )),
    );
  }
}
