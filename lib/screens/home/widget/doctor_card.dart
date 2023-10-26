import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.index,
  });
  final int index;

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
            const Text('User name')
          ],
        ),
      ),
    );
  }
}
