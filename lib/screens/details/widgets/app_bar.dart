import 'package:carejar/widgets/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorAppBar extends StatelessWidget {
  const DoctorAppBar({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: index,
          child: const CircleAvatar(
            child: Icon(CupertinoIcons.person_alt),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Doctor name',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.green),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: RatingBar(),
          ),
        ),
      ],
    );
  }
}
