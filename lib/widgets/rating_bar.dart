import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.star_fill,
          size: 15,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '4.0',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
