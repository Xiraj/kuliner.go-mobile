import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kuliner_go_mobile/components/rounded_google_button.dart';
import 'package:kuliner_go_mobile/pages/forgotpass_page.dart';
import 'package:kuliner_go_mobile/pages/home_bottomnav.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/pages/register_user_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  Future<void> setLoggedIn(
      bool isLoggedIn, bool isCustomer, bool isRestoran) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
    prefs.setBool('isCustomer', isCustomer);
    prefs.setBool('isRestoran', isRestoran);
  }

  signin(String email, String password) async {
    try {
      setState(() {
        isLoading = true;
      });

      await auth.signInWithEmailAndPassword(email: email, password: password);
      await setLoggedIn(true, true, false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const homeBottomNav()),
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message.toString(),
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<UserCredential?> signInWithGoogle(bool isCustomer) async {
    try {
      setState(() {
        isLoading = true;
      });

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await setLoggedIn(true, true, false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const homeBottomNav()),
        (route) => false,
      );

      setState(() {
        isLoading = false;
      });

      return userCredential;
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      return null;
    }
  }

  checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const homeBottomNav()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenHeight = mediaQueryData.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: blueColor,
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: isLoading ? 0.5 : 1.0,
              child: AbsorbPointer(
                absorbing: isLoading,
                child: ListView(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/vector.png'),
                              fit: BoxFit.fill),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Form(
                                        key: formKey,
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
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter an email';
                                                } else if (!emailRegex
                                                    .hasMatch(value)) {
                                                  return 'Please enter a valid email';
                                                }
                                                return null; // input is valid
                                              },
                                            ),
                                            RoundedPasswordField(
                                              hintText:
                                                  "Gunakan 6 karakter atau lebih",
                                              onChanged: (value) {
                                                password = value.trim();
                                              },
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 220.0),
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
                                                          color: blueColor,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ))
                                              ],
                                            ),
                                            RoundedButton(
                                              text: "Masuk",
                                              press: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  signin(email, password);
                                                }
                                              },
                                              height: screenHeight * 0.07,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: new Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 20.0),
                                                    child: const Divider(
                                                      color: greyColor,
                                                      height: 36,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "Masuk dengan",
                                                  style: TextStyle(
                                                    color: greyColor,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 10.0),
                                                    child: const Divider(
                                                      color: greyColor,
                                                      height: 36,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GoogleButton(
                                              text: 'Google Account',
                                              press: () {
                                                signInWithGoogle(true);
                                              },
                                              height: screenHeight * 0.07,
                                            ),
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
                                                                  const RegisterUser()));
                                                    },
                                                    child: const Text(
                                                        "Daftar disini")),
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
            ),
            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(
                  child: SpinKitWave(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
