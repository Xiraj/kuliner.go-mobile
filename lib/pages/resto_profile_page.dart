import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/buttonProfile.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/theme.dart';

class RestoProfile extends StatefulWidget {
  const RestoProfile({super.key});

  @override
  State<RestoProfile> createState() => _RestoProfileState();
}

class _RestoProfileState extends State<RestoProfile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName ?? "User";
    final email = user?.email;
    final FirebaseAuth auth = FirebaseAuth.instance;

    logout() async {
      await auth.signOut();
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
                  SizedBox(
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
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35),
                      ),
                      color: whiteColor,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          '$username',
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          '$email',
                          style: greyTextStyle,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            buttonProfile(
                              icon: 'assets/ulasan.png',
                              title: 'Ulasan Saya',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            buttonProfile(
                              icon: 'assets/wallet.png',
                              title: 'Kartu / Rekening Bank',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            buttonProfile(
                              icon: 'assets/notification.png',
                              title: 'Notifikasi',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            buttonProfile(
                              icon: 'assets/language.png',
                              title: 'Pilihan Bahasa',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            buttonProfile(
                              icon: 'assets/rating.png',
                              title: 'Beri Rating',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            await logout();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OptionLoginPage()));
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
                        SizedBox(
                          height: 62,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 60,
                left: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/mcd.png'),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
