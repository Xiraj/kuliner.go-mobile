import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuliner_go_mobile/pages/login_resto_page.dart';import 'package:kuliner_go_mobile/pages/login_user_page.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/components/rounded_password_field.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  late String email;
  late String password;
  late String username;
  final FirebaseAuth auth = FirebaseAuth.instance;

  _signup(String username, String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      user?.updateDisplayName(username);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginResto()));
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
      resizeToAvoidBottomInset: false,
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
                  height: screenHeight * 0.096,
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
                            RoundedInputField(
                              hintText: "Masukkan nama restoranmu",
                              icon: Icons.person_2_rounded,
                              onChanged: (value) {
                                username = value.trim();
                              },
                            ),
                            RoundedInputField(
                              hintText: "alamat@gmail.com",
                              icon: Icons.email_rounded,
                              onChanged: (value) {
                                email = value.trim();
                              },
                            ),
                            RoundedPasswordField(
                              hintText: "Gunakan 6 karakter atau lebih",
                              onChanged: (value) {
                                password = value.trim();
                              },
                            ),
                          ],
                        ),
                        RoundedButton(
                          text: "Daftar",
                          press: () {
                            _signup(username, email, password);
                          },
                          height: screenHeight * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
