import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/onboarding_page.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    openSplashScreen();
    initIntroduction();
  }

  openSplashScreen() async {
    //bisa diganti beberapa detik sesuai keinginan
    var durasiSplash = const Duration(seconds: 2);
    return Timer(durasiSplash, () {
      //pindah ke halaman home
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return introduction == 0
            ? const OnboardingPage(title: 'Introduction')
            : const optionLoginPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 308.2,
          height: 411,
        ),
      ),
    );
  }
}
