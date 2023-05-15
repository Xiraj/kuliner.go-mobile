import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuliner_go_mobile/pages/forgotpass_page.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/pages/register_resto_page.dart';
import 'package:kuliner_go_mobile/pages/resto_bottomnav_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/components/rounded_password_field.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class LoginResto extends StatefulWidget {
  const LoginResto({super.key});

  @override
  State<LoginResto> createState() => _LoginRestoState();
}

// ignore: camel_case_types
class _LoginRestoState extends State<LoginResto> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  final FirebaseAuth auth = FirebaseAuth.instance;

  _signin(String email, String password) async {
    try {
      var bytes = utf8.encode(password);
      var digest = sha256.convert(bytes);
      String hashedPassword = digest.toString();
      await auth.signInWithEmailAndPassword(
          email: email, password: hashedPassword);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => RestoNav()),
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message.toString(), gravity: ToastGravity.TOP);
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: blueColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/vector.png'), fit: BoxFit.fill),
                  color: blueColor),
              child: Column(
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.1,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OptionLoginPage()));
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
                    height: screenHeight * 0.86,
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
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    RoundedInputField(
                                      hintText: "alamat@gmail.com",
                                      icon: Icons.email_rounded,
                                      onChanged: (value) {
                                        email = value.trim();
                                      },
                                      validator: (value) {
                                        final emailRegex = RegExp(
                                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter an email';
                                        } else if (!emailRegex
                                            .hasMatch(value)) {
                                          return 'Please enter a valid email';
                                        }
                                        return null; // input is valid
                                      },
                                    ),
                                    SizedBox(height: 10.0),
                                    RoundedPasswordField(
                                      hintText: "Gunakan 6 karakter atau lebih",
                                      onChanged: (value) {
                                        password = value.trim();
                                      },
                                    ),
                                    SizedBox(height: 10.0),
                                    RoundedButton(
                                      text: "Masuk",
                                      press: () {
                                        if (_formKey.currentState!.validate()) {
                                          _signin(email, password);
                                        }
                                      },
                                      height: screenHeight * 0.07,
                                    ),
                                    SizedBox(height: 10.0),
                                    Container(
                                      margin: EdgeInsets.only(left: 220.0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ForgotPass()));
                                        },
                                        child: const Text(
                                          'Lupa kata sandi?',
                                          style: TextStyle(
                                              color: blueColor, fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text("Tidak punya akun?"),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const RegisterPage()));
                                            },
                                            child: const Text("Daftar disini")),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
