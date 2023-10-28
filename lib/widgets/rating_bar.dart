import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Rating widget using for show the rating bar its including
//a star icon and the rating

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.rating,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.green),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.star_fill,
                size: 15,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                rating.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
