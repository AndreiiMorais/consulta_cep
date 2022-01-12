import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  const CustomText({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 20),
    );
  }
}
