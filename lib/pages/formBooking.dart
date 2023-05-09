import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/pages/home_bottomnav.dart';

// ignore: camel_case_types
class formBookingPage extends StatefulWidget {
  const formBookingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _formBookingPageState createState() => _formBookingPageState();
}

// ignore: camel_case_types
class _formBookingPageState extends State<formBookingPage> {
  late String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 12, right: 20),
                child: RoundedInputField(
                  hintText: "Masukkan nama lengkapmu",
                  icon: Icons.person_2_rounded,
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 12, right: 20),
                child: RoundedInputField(
                  hintText: "Masukkan nomor telepon",
                  icon: Icons.call,
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 12, right: 20),
                child: RoundedInputField(
                  hintText: "Masukkan alamat email",
                  icon: Icons.email_rounded,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
        // const formUserPage()
      ],
    );
  }
}
