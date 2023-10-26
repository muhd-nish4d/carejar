import 'package:flutter/material.dart';

class WidgetDoctorDetail extends StatelessWidget {
  const WidgetDoctorDetail({
    super.key,
    required this.detailKey,
    required this.detail,
  });
  final String detailKey;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailKey,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              detail,
              style: const TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}