import 'package:flutter/material.dart';

//If the API call having any fail that time show
//this widget

class FetchFailedWidget extends StatelessWidget {
  const FetchFailedWidget({
    super.key,
    required this.isFailed,
  });
  final bool isFailed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isFailed,
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.black.withOpacity(.5),
          child: const Row(
            children: [
              Icon(
                Icons.signal_wifi_bad_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Check your internet connection',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
