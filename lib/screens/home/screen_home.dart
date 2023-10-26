import 'package:carejar/screens/details/screen_details.dart';
import 'package:carejar/screens/home/widget/doctor_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenDetails(index: index),
                    )),
                child: DoctorCard(index: index),
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    ));
  }
}
