import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  void resetPassword(String email) async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showResetPasswordSuccessDialog();
    } catch (error) {
      showResetPasswordErrorDialog();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showResetPasswordSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Password'),
        content: const Text(
          'Tautan untuk reset password telah dikirimkan ke email Anda.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void showResetPasswordErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Password '),
        content: const Text(
          'Terjadi kesalahan saat mengirimkan email reset password. Mohon coba lagi nanti.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blueColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                                controller: emailController,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                          RoundedButton(
                            text: "Kirim",
                            press: () {
                              final email = emailController.text;
                              resetPassword(email);
                            },
                            height: screenHeight * 0.07,
                          ),
                          const Text(
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
      ),
    );
  }
}
