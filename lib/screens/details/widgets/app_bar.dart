import 'package:carejar/widgets/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorAppBar extends StatelessWidget {
  const DoctorAppBar({
    super.key,
    required this.index,
    required this.doctorName,
    required this.rating,
  });
  final String doctorName;
  final String rating;
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
        Text(
          doctorName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        RatingBar(rating: double.parse(rating))
      ],
    );
  }
}
