import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/pages/forgotpass_page.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class verifPage extends StatefulWidget {
  const verifPage({super.key});

  @override
  State<verifPage> createState() => _verifPageState();
}

class _verifPageState extends State<verifPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blueColor,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/vector.png'), fit: BoxFit.fill),
              color: blueColor),
          child: Column(
            children: <Widget>[
              Container(
                height: screenHeight * 0.14,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const optionLoginPage()));
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_left,
                        color: whiteColor,
                        size: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.816,
                width: screenWidth * 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "Verifikasi Akun",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Silahkan masukkan kode OTP kamu di bawah ini',
                              style: TextStyle(
                                color: greyColor,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/logo.png',
                          width: 270,
                        ),
                        Column(
                          children: <Widget>[
                            OtpTextField(
                              numberOfFields: 6,
                              borderColor: greyColor,
                              focusedBorderColor: blackColor,
                              showFieldAsBox: false,
                              borderWidth: 4.0,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here if necessary
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {},
                            ),
                          ],
                        ),
                        Container(
                          alignment: const Alignment(0.7, 0.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const forgotPass()));
                            },
                            child: const Text(
                              'Kirim ulang kode OTP?',
                              style: TextStyle(color: blueColor, fontSize: 14),
                            ),
                          ),
                        ),
                        RoundedButton(
                          text: "Verifikasi OTP",
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const optionLoginPage()));
                          },
                          height: screenHeight * 0.07,
                        ),
                        Text(
                          'Kode OTP akan terkirim ke akun email-mu',
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
