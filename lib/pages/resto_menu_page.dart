import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardMenuResto.dart';

import 'package:kuliner_go_mobile/theme.dart';

class RestoMenu extends StatelessWidget {
  const RestoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> addData() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Tambah Data'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nama menu',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Harga menu',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Tambah',
                  style: TextStyle(color: Color.fromARGB(255, 2, 189, 98)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName ?? "User";
    // if currentUser is null, use "User" as the default username
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Lokasi terkini',
                style: whiteTextStyle.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: whiteColor,
                    size: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Bojongsoang",
                      style: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Halo $username",
                    style: whiteTextStyle.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tambahkan data menu restoranmu yuk!",
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Daftar Menu",
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Column(
                    children: [
                      CardMenu(
                        imageUrl: 'assets/menu1.png',
                        menuName: 'Panas 1 Spicy, Large',
                        harga: 'Rp. 52.000',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardMenu(
                        imageUrl: 'assets/menu1.png',
                        menuName: 'Panas 1 Original, Large',
                        harga: 'Rp. 52.000',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardMenu(
                        imageUrl: 'assets/menu1.png',
                        menuName: 'Panas 1 Original, Medium',
                        harga: 'Rp. 52.000',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardMenu(
                        imageUrl: 'assets/menu2.png',
                        menuName: 'Mixed Berries McFlurry with OREO',
                        harga: 'Rp. 17.000',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardMenu(
                        imageUrl: 'assets/menu2.png',
                        menuName: 'Mixed Berries McFlurry with Choco',
                        harga: 'Rp. 17.000',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addData();
        },
        label: Text('Tambah Menu'),
        icon: Icon(Icons.add_rounded),
        backgroundColor: blueColor,
      ),
    );
  }
}
