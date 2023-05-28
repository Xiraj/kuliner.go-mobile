import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kuliner_go_mobile/components/buttonProfile.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
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
        MaterialPageRoute(builder: (BuildContext context) => const OptionLoginPage()),
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
                          '$username',
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
                            const ButtonProfile(
                              icon: 'assets/ulasan.png',
                              title: 'Ulasan Saya',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const ButtonProfile(
                              icon: 'assets/wallet.png',
                              title: 'Kartu / Rekening Bank',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const ButtonProfile(
                              icon: 'assets/notification.png',
                              title: 'Notifikasi',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const ButtonProfile(
                              icon: 'assets/language.png',
                              title: 'Pilihan Bahasa',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const ButtonProfile(
                              icon: 'assets/rating.png',
                              title: 'Beri Rating',
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
