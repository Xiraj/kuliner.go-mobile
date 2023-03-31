import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/pages/verif_page.dart';
import 'package:kuliner_go_mobile/theme.dart';

class forgotPass extends StatefulWidget {
  const forgotPass({super.key});

  @override
  State<forgotPass> createState() => _forgotPassState();
}

class _forgotPassState extends State<forgotPass> {
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
                              "Lupa Kata Sandi",
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
                              'Masukkan email akunmu yang sudah terdaftar',
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
                            RoundedInputField(
                              hintText: "alamat@gmail.com",
                              icon: Icons.email_rounded,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        RoundedButton(
                          text: "Kirim",
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const verifPage()));
                          },
                          height: screenHeight * 0.07,
                        ),
                        Text(
                          'Kamu akan menerima pesan di email-mu',
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
