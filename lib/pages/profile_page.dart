import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:kuliner_go_mobile/components/buttonProfile.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/pages/payment.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName ?? "User";
    final email = user?.email;
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();
    Future<void> setLoggedIn(
        bool isLoggedIn, bool isCustomer, bool isRestoran) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', isLoggedIn);
      prefs.setBool('isCustomer', isCustomer);
      prefs.setBool('isRestoran', isRestoran);
    }

    logout() async {
      await setLoggedIn(false, false, false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const OptionLoginPage()),
        (route) => false,
      );
      await auth.signOut();
      await googleSignIn.signOut();
    }

    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profil",
                          style: whiteTextStyle.copyWith(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35),
                      ),
                      color: whiteColor,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          username,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          '$email',
                          style: greyTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaymentPage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  ExpansionTile(
                                    title: const Text('Ulasan Saya'),
                                    tilePadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0, vertical: 1.0),
                                    childrenPadding:
                                        const EdgeInsets.only(left: 12),
                                    leading: const Icon(Icons.chat_outlined),
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                            width: 520,
                                            padding: const EdgeInsets.only(
                                                left: 40, right: 30),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  height: 70,
                                                  padding: const EdgeInsets.only(
                                                    right: 60,
                                                  ),
                                                  child: Image.asset(
                                                      'assets/Mandiri.png'),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(top: 16),
                                                  child: const Text('| \t Mandiri'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // PAYMENT
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaymentPage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  ExpansionTile(
                                    title: const Text('Kartu / Rekening Bank'),
                                    tilePadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0, vertical: 1.0),
                                    childrenPadding:
                                        const EdgeInsets.only(left: 12),
                                    leading: const Icon(Icons.wallet_rounded),
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                            width: 520,
                                            padding: const EdgeInsets.only(
                                                left: 40, right: 30),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  height: 70,
                                                  padding: const EdgeInsets.only(
                                                    right: 60,
                                                  ),
                                                  child: Image.asset(
                                                      'assets/Mandiri.png'),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(top: 16),
                                                  child: const Text('| \t Mandiri'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //  InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => const PaymentPage(),
                            //       ),
                            //     );
                            //   },
                            //   child: const ButtonProfile(
                            //     icon: 'assets/wallet.png',
                            //     title: 'Kartu / Rekening Bank',
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaymentPage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  ExpansionTile(
                                    title: const Text('Notifikasi'),
                                    tilePadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0, vertical: 1.0),
                                    childrenPadding:
                                        const EdgeInsets.only(left: 12),
                                    leading: const Icon(Icons.notifications),
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                            width: 520,
                                            padding: const EdgeInsets.only(
                                                left: 40, right: 30),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  height: 70,
                                                  padding: const EdgeInsets.only(
                                                    right: 60,
                                                  ),
                                                  child: Image.asset(
                                                      'assets/Mandiri.png'),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(top: 16),
                                                  child: const Text('| \t Mandiri'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaymentPage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  ExpansionTile(
                                    title: const Text('Pilihan Bahasa'),
                                    tilePadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0, vertical: 1.0),
                                    childrenPadding:
                                        const EdgeInsets.only(left: 12),
                                    leading:
                                        const Icon(Icons.g_translate_rounded),
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                            width: 520,
                                            padding: const EdgeInsets.only(
                                                left: 40, right: 30),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  height: 70,
                                                  padding: const EdgeInsets.only(
                                                    right: 60,
                                                  ),
                                                  child: Image.asset(
                                                      'assets/Mandiri.png'),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(top: 16),
                                                  child: const Text('| \t Mandiri'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaymentPage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  ExpansionTile(
                                    title: const Text('Beri Rating'),
                                    tilePadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0, vertical: 1.0),
                                    childrenPadding:
                                        const EdgeInsets.only(left: 12),
                                    leading: const Icon(Icons.star),
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                            width: 520,
                                            padding: const EdgeInsets.only(
                                                left: 40, right: 30),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  height: 70,
                                                  padding: const EdgeInsets.only(
                                                    right: 60,
                                                  ),
                                                  child: Image.asset(
                                                      'assets/Mandiri.png'),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(top: 16),
                                                  child: const Text('| \t Mandiri'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            logout();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(340, 50),
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Keluar',
                            style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 78,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 60,
                left: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/users_init.png',
                      width: 100, height: 100),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
