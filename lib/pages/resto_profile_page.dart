import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/buttonProfile.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/pages/update_info_resto.dart';
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ButtonProfile(
                                        icon: 'assets/document.png',
                                        title: 'Detail Restoran',
                                        children: [
                                          data['detailRestoran'].isEmpty
                                              ? Text('Data belum tersedia')
                                              : Text(
                                                  '${data['detailRestoran']}')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ButtonProfile(
                                        icon: 'assets/time.png',
                                        title: 'Jam Buka',
                                        children: [
                                          data['jamBuka'].isEmpty
                                              ? Text('Data belum tersedia')
                                              : Text('${data['jamBuka']}')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ButtonProfile(
                                        icon: 'assets/dollar_square.png',
                                        title: 'Kisaran Harga',
                                        children: [
                                          data['kisaranHarga'].isEmpty
                                              ? Text('Data belum tersedia')
                                              : Text('${data['kisaranHarga']}')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ButtonProfile(
                                        icon: 'assets/location.png',
                                        title: 'Alamat Restoran',
                                        children: [
                                          data['alamatRestoran'].isEmpty
                                              ? Text('Data belum tersedia')
                                              : Text(
                                                  '${data['alamatRestoran']}')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ButtonProfile(
                                        icon: 'assets/facility.png',
                                        title: 'Fasilitas Restoran',
                                        children: [
                                          data['fasilitasRestoran'].isEmpty
                                              ? Text('Data belum tersedia')
                                              : Text(
                                                  '${data['fasilitasRestoran']}')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      RoundedButton(
                                        text: 'Edit Informasi Restoran',
                                        press: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => UpdateInfo(
                                                id: '${data['id']}',
                                                email: '${data['email']}',
                                                username: '${data['username']}',
                                                detailRestoran:
                                                    '${data['detailRestoran']}',
                                                jamBuka: '${data['jamBuka']}',
                                                alamatRestoran:
                                                    '${data['alamatRestoran']}',
                                                fasilitas:
                                                    '${data['fasilitasRestoran']}',
                                                kisaranHarga:
                                                    '${data['kisaranHarga']}',
                                                imageUrl: '${data['imageUrl']}',
                                              ),
                                            ),
                                          );
                                        },
                                        height: 54,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
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
