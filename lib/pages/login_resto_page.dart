import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/forgotpass_page.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/pages/register_resto_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/components/rounded_password_field.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<loginPage> {
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
                            "Restoran",
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
                      Container(
                        alignment: const Alignment(0.7, 0.0),
                        child: TextButton(
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const forgotPass()));
                          },
                          child: const Text(
                            'Lupa kata sandi?',
                            style: TextStyle(color: blueColor, fontSize: 14),
                          ),
                        ),
                      ),
                      RoundedButton(
                        text: "Masuk",
                        press: () {},
                        height: screenHeight * 0.07,
                      ),
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
                                            const registerPage()));
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
