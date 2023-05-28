import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/onboarding_page.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/pages/resto_bottomnav_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_bottomnav.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool isCustomer = prefs.getBool('isCustomer') ?? false;
    bool isRestoran = prefs.getBool('isRestoran') ?? false;
    var durasiSplash = const Duration(seconds: 2);
    return Timer(durasiSplash, () {
      if (mounted) {
        if (isLoggedIn) {
          if (isCustomer) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const homeBottomNav()),
            );
          } else if (isRestoran) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const RestoNav()),
            );
          }
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return introduction == 0
                ? const OnboardingPage(title: 'Introduction')
                : const OptionLoginPage();
          }));
        }
      }
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
