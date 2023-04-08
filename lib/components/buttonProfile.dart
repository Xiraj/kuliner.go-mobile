import 'package:flutter/material.dart';

class buttonProfile extends StatelessWidget {
  final String icon;
  final String title;
  const buttonProfile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 24,
          width: 24,
        ),
        SizedBox(
          width: 10,
        ),
        Text(title),
        Spacer(),
        Image.asset('assets/arrow_right.png')
      ],
    );
  }
}
