import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardMenuResto.dart';
import 'package:kuliner_go_mobile/pages/form_add_menu.dart';
import 'package:kuliner_go_mobile/pages/form_update_menu.dart';

import 'package:kuliner_go_mobile/theme.dart';

class RestoMenu extends StatelessWidget {
  const RestoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName ?? "User";
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
              height: MediaQuery.of(context).size.height - 160,
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
                    height: 20,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Menu')
                        .where('restaurantId',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final docs = snapshot.data!.docs;
                      if (docs.isEmpty) {
                        return Center(
                            child: Text('Tidak ada data menu yang ditemukan'));
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 270,
                        child: ListView.builder(
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            final menu = docs[index];
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CardMenu(
                                      imageUrl: menu['imageUrl'],
                                      desc: menu['deskripsi'],
                                      menuName: menu['namaMenu'],
                                      harga: 'Rp. ${menu['harga']}',
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateMenu(
                                                  imageUrl: snapshot.data!
                                                      .docs[index]['imageUrl'],
                                                  description: snapshot.data!
                                                      .docs[index]['deskripsi'],
                                                  menuName: snapshot.data!
                                                      .docs[index]['namaMenu'],
                                                  price: snapshot.data!
                                                      .docs[index]['harga'],
                                                  menuId: snapshot.data!
                                                      .docs[index]['menuid'],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                            size: 21,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            final confirmed = await showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text('Hapus Menu'),
                                                content: Text(
                                                    'Apakah Anda yakin ingin menghapus menu ini?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(false),
                                                    child: Text('Batal'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(true),
                                                    child: Text('Hapus'),
                                                  ),
                                                ],
                                              ),
                                            );
                                            if (confirmed) {
                                              final menuId = snapshot
                                                  .data!.docs[index]['menuid'];
                                              final docData = FirebaseFirestore
                                                  .instance
                                                  .collection('Menu')
                                                  .doc(menuId);
                                              final imageFileName =
                                                  snapshot.data!.docs[index]
                                                      ['image_filename'];
                                              await FirebaseStorage.instance
                                                  .ref()
                                                  .child(
                                                      'menu_images/$imageFileName')
                                                  .delete();
                                              // Delete the menu item document from Firestore
                                              await docData.delete();
                                            }
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red.shade900,
                                            size: 21,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0, // atur jarak antara setiap item
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormAddMenu()));
        },
        label: Text('Tambah Menu'),
        icon: Icon(Icons.add_rounded),
        backgroundColor: blueColor,
      ),
    );
  }
}
