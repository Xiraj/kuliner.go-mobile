import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/pages/home_bottomnav.dart';

// ignore: camel_case_types
class formDateTimePage extends StatefulWidget {
  const formDateTimePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _formDateTimePageState createState() => _formDateTimePageState();
}

// ignore: camel_case_types
class _formDateTimePageState extends State<formDateTimePage> {
  late String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 12, right: 20),
          child: RoundedInputField(
            hintText: "Tanggal",
            icon: Icons.calendar_month_outlined,
            onChanged: (value) {},
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 12, right: 20),
          child: RoundedInputField(
            hintText: "Jam booking",
            icon: Icons.av_timer_outlined,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
