import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/login_resto_page.dart';
import 'package:kuliner_go_mobile/pages/login_user_page.dart';
import 'package:kuliner_go_mobile/theme.dart';

// ignore: camel_case_types
class OptionLoginPage extends StatefulWidget {
  const OptionLoginPage({super.key});

  @override
  State<OptionLoginPage> createState() => _OptionLoginPageState();
}

// ignore: camel_case_types
class _OptionLoginPageState extends State<OptionLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 200.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        width: 238,
                        height: 58,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Text(
                        'Cari tempat makan\ndan booking darimanapun',
                        style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginUser()));
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(340, 50),
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          'Masuk Sebagai Pelanggan',
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginResto()));
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(340, 50),
                            backgroundColor: whiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                // ignore: prefer_const_constructors
                                side: BorderSide(color: blueColor))),
                        child: const Text(
                          'Masuk Sebagai Restoran',
                          style: TextStyle(
                            color: blueColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
