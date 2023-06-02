import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/buttonProfile.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/pages/update_info_resto.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
    FirebaseAuth auth = FirebaseAuth.instance;

    Future<void> setLoggedIn(
        bool isLoggedIn, bool isCustomer, bool isRestoran) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', isLoggedIn);
      prefs.setBool('isCustomer', isCustomer);
      prefs.setBool('isRestoran', isRestoran);
    }

    logout() async {
      await setLoggedIn(false, false, false);
      await auth.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const OptionLoginPage()),
        (route) => false,
      );
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
                      height: MediaQuery.of(context).size.height - 160,
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(35),
                        ),
                        color: whiteColor,
                      ),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 40,
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
                                  StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('Restoran')
                                        .where('id',
                                            isEqualTo: FirebaseAuth
                                                .instance.currentUser!.uid)
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasData) {
                                        var data = snapshot.data!.docs[0];
                                        return Column(
                                          children: [
                                            Text(
                                              data['tipeRestoran'].isEmpty
                                                  ? 'Data belum tersedia'
                                                  : data['tipeRestoran'],
                                              style: greyTextStyle,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ButtonProfile(
                                              icon: 'assets/document.png',
                                              title: 'Detail Restoran',
                                              children: [
                                                data['detailRestoran'].isEmpty
                                                    ? const Text(
                                                        'Data belum tersedia')
                                                    : Text(
                                                        '${data['detailRestoran']}')
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ButtonProfile(
                                              icon: 'assets/time.png',
                                              title: 'Jam Buka',
                                              children: [
                                                if (data['hariBuka'].isEmpty ||
                                                    data['jamBuka'].isEmpty ||
                                                    data['jamTutup'].isEmpty)
                                                  const Text(
                                                      'Data belum tersedia')
                                                else
                                                  ListView.separated(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        data['hariBuka'].length,
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            const Divider(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      String day =
                                                          data['hariBuka']
                                                              [index];
                                                      String openingTime =
                                                          data['jamBuka'];
                                                      String closingTime =
                                                          data['jamTutup'];
                                                      return Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              day,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            '$openingTime - $closingTime',
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ButtonProfile(
                                              icon: 'assets/dollar_square.png',
                                              title: 'Kisaran Harga',
                                              children: [
                                                data['kisaranHarga'].isEmpty
                                                    ? const Text(
                                                        'Data belum tersedia')
                                                    : Text(
                                                        '${data['kisaranHarga']}')
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ButtonProfile(
                                              icon: 'assets/location.png',
                                              title: 'Alamat Restoran',
                                              children: [
                                                data['alamatRestoran'].isEmpty
                                                    ? const Text(
                                                        'Data belum tersedia')
                                                    : Text(
                                                        '${data['alamatRestoran']}',
                                                      ),
                                                if (data['urlRestoran']
                                                    .isNotEmpty)
                                                  TextButton(
                                                    onPressed: () async {
                                                      final url = Uri.parse(
                                                          data['urlRestoran']);
                                                      await launchUrl(url);
                                                    },
                                                    child: SelectableText(
                                                      '${data['urlRestoran']}',
                                                      enableInteractiveSelection:
                                                          true,
                                                      style: const TextStyle(
                                                        color: Colors.blue,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ButtonProfile(
                                              icon: 'assets/facility.png',
                                              title: 'Fasilitas Restoran',
                                              children: [
                                                data['fasilitasRestoran']
                                                        .isEmpty
                                                    ? const Text(
                                                        'Data belum tersedia')
                                                    : Text(
                                                        '${data['fasilitasRestoran']}')
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            RoundedButton(
                                              text: 'Edit Informasi Restoran',
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateInfo(
                                                      id: '${data['id']}',
                                                      tipeRestoran:
                                                          '${data['tipeRestoran']}',
                                                      detailRestoran:
                                                          '${data['detailRestoran']}',
                                                      hariBuka:
                                                          '${data['hariBuka']}'
                                                              .split(', '),
                                                      jamBuka:
                                                          '${data['jamBuka']}',
                                                      jamTutup:
                                                          '${data['jamTutup']}',
                                                      alamatRestoran:
                                                          '${data['alamatRestoran']}',
                                                      fasilitas:
                                                          '${data['fasilitasRestoran']}',
                                                      kisaranHarga:
                                                          '${data['kisaranHarga']}',
                                                      imageUrl:
                                                          '${data['imageUrl']}',
                                                      urlRestoran:
                                                          '${data['urlRestoran']}',
                                                    ),
                                                  ),
                                                );
                                              },
                                              height: 54,
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 12),
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
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 60,
                  left: 148,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Restoran')
                        .where('id',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!.docs[0];
                        String imageUrl = data['imageUrl'];
                        if (imageUrl.isNotEmpty) {
                          return CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(imageUrl),
                          );
                        }
                      }
                      return const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/users_init.png'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
