import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/rounded_google_button.dart';
import 'package:kuliner_go_mobile/pages/forgotpass_page.dart';
import 'package:kuliner_go_mobile/pages/home_bottomnav.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/pages/register_user_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/components/rounded_password_field.dart';

class loginUser extends StatefulWidget {
  const loginUser({super.key});

  @override
  State<loginUser> createState() => _loginUserState();
}

class _loginUserState extends State<loginUser> {
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
              Container(
                height: screenHeight * 0.816,
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
                            "Masuk",
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
                            'Masukkan email dan kata sandi akunmu disini',
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
                          RoundedPasswordField(
                            hintText: "Gunakan 6 karakter atau lebih",
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(left: 220.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const forgotPass()));
                              },
                              child: const Text(
                                'Lupa kata sandi?',
                                style:
                                    TextStyle(color: blueColor, fontSize: 14),
                              ),
                            ),
                          ))
                        ],
                      ),
                      RoundedButton(
                        text: "Masuk",
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const homeBottomNav()));
                        },
                        height: screenHeight * 0.07,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: new Container(
                              margin: EdgeInsets.only(left: 10.0, right: 20.0),
                              child: Divider(
                                color: greyColor,
                                height: 36,
                              ),
                            ),
                          ),
                          Text(
                            "Masuk dengan",
                            style: TextStyle(
                              color: greyColor,
                            ),
                          ),
                          Expanded(
                            child: new Container(
                              margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              child: Divider(
                                color: greyColor,
                                height: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GoogleButton(text: 'Google Account', press: () {}),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Tidak punya akun?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const registerUser()));
                              },
                              child: const Text("Daftar disini")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
