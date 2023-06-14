import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/theme.dart';

class FormAddMenu extends StatefulWidget {
  const FormAddMenu({super.key});

  @override
  State<FormAddMenu> createState() => _FormAddMenuState();
}

class _FormAddMenuState extends State<FormAddMenu> {
  final formKey = GlobalKey<FormState>();
  String selectedImagePath = '';
  late String name;
  late String desc;
  late int price;
  int quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  Future<void> tambahMenu() async {
  try {
    final newMenuDoc =
        await FirebaseFirestore.instance.collection('Menu').add({
      'namaMenu': name,
      'deskripsi': desc,
      'harga': price,
      'quantity': quantity,
      'restaurantId': FirebaseAuth.instance.currentUser!.uid,
      'imageUrl': '',
      'image_filename': '',
    });

    final String menuId = newMenuDoc.id;
    final ref = FirebaseStorage.instance
        .ref()
        .child('menu_images')
        .child('$menuId.jpg');
    final uploadTask = ref.putFile(File(selectedImagePath));
    final snapshot = await uploadTask.whenComplete(() => null);
    final imageUrl = await snapshot.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('Menu').doc(menuId).update({
      'menuid': menuId,
      'imageUrl': imageUrl,
      'image_filename': '$menuId.jpg',
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data menu berhasil ditambahkan')),
    );
    Navigator.pop(context);
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Terjadi kesalahan: $error')),
    );
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Menu'),
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  child: Column(
                    children: [
                      selectedImagePath == ''
                          ? Image.asset(
                              'assets/image_placeholder.png',
                              height: 180,
                              width: 180,
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              File(selectedImagePath),
                              height: 180,
                              width: 180,
                              fit: BoxFit.fill,
                            ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          selectImage();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(350, 60),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                        ),
                        child: Text(
                          'Select Image',
                          style: whiteTextStyle,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nama Menu'),
                          onChanged: (value) {
                            name = value.trim();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama menu tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Deskripsi Menu'),
                          onChanged: (value) {
                            desc = value.trim();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Deskripsi menu tidak boleh kosong';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Quantity',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 330,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: decrementQuantity,
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(8),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            ElevatedButton(
                              onPressed: incrementQuantity,
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(8),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Harga Menu'),
                          onChanged: (value) {
                            price = int.parse(value.trim());
                          },
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harga tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      RoundedButton(
                        text: 'Tambah',
                        press: () async {
                          if (selectedImagePath.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Upload gambar terlebih dahulu'),
                              ),
                            );
                            return;
                          }
                          if (formKey.currentState!.validate()) {
                            await tambahMenu();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Isi field yang kosong')),
                            );
                          }
                        },
                        height: 60,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const Text(
                    'Select Image From !',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          selectedImagePath = await selectImageFromGallery();
                          if (selectedImagePath != '') {
                            Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("No Image Selected !"),
                            ));
                          }
                        },
                        child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/gallery.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                  const Text('Gallery'),
                                ],
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () async {
                          selectedImagePath = await selectImageFromCamera();

                          if (selectedImagePath != '') {
                            Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("No Image Captured !"),
                            ));
                          }
                        },
                        child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/camera.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                  const Text('Camera'),
                                ],
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
