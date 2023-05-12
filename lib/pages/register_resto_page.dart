import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuliner_go_mobile/pages/login_resto_page.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/components/rounded_password_field.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String username;
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<void> registerAsRestaurant(
      String username, String email, String password) async {
    try {
      var bytes = utf8.encode(password);
      var digest = sha256.convert(bytes);
      String hashedPassword = digest.toString();
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: hashedPassword,
      );

      User? user = userCredential.user;
      user?.updateDisplayName(username);
      String id = user?.uid ?? '';
      await firestore.collection('Restoran').doc(user?.uid).set(
        {
          'id': id,
          'username': username,
          'email': email,
          'password': hashedPassword,
          'imageUrl' : '',
          'detailRestoran': '',
          'jamBuka': '',
          'alamatRestoran': '',
          'kisaranHarga': '',
          'fasilitasRestoran': '',
        },
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoginResto()),
          (route) => false);
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message.toString(), gravity: ToastGravity.TOP);
    }
  }

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
                  Container(
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
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Silahkan isi kelengkapan akunmu di bawah ini',
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
                                key: formKey,
                                child: Column(
                                  children: [
                                    RoundedInputField(
                                      hintText: "Masukkan nama restoranmu",
                                      icon: Icons.person_2_rounded,
                                      onChanged: (value) {
                                        username = value.trim();
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a username';
                                        } else if (value.length < 3) {
                                          return 'Username must be at least 3 characters long';
                                        }
                                        return null; // input is valid
                                      },
                                    ),
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
                                    RoundedPasswordField(
                                      hintText: "Gunakan 6 karakter atau lebih",
                                      onChanged: (value) {
                                        password = value.trim();
                                      },
                                    ),
                                    RoundedButton(
                                      text: "Daftar",
                                      press: () {
                                        if (formKey.currentState!.validate()) {
                                          registerAsRestaurant(
                                              username, email, password);
                                        }
                                      },
                                      height: screenHeight * 0.07,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text("Sudah punya akun?"),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginResto()));
                                            },
                                            child: const Text("Masuk disini")),
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
