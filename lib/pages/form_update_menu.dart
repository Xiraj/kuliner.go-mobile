import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/theme.dart';

class UpdateMenu extends StatefulWidget {
  final String menuId;
  final String menuName;
  final String description;
  final int price;
  final int quantity;
  final String imageUrl;

  const UpdateMenu({super.key, 
    required this.menuId,
    required this.menuName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  @override
  State<UpdateMenu> createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  final formKey = GlobalKey<FormState>();
  String selectedImagePath = '';
  late String menuName;
  late String description;
  late int price;
  late String imageUrl;
  late int quantity;

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

  @override
  void initState() {
    menuName = widget.menuName;
    description = widget.description;
    price = widget.price;
    imageUrl = widget.imageUrl;
    quantity = widget.quantity;
    super.initState();
  }

  Future<void> updateMenu() async {
    try {
      final docRef =
          FirebaseFirestore.instance.collection('Menu').doc(widget.menuId);
      if (selectedImagePath != '') {
        final ref = FirebaseStorage.instance
            .ref()
            .child('menu_images')
            .child('${widget.menuId}.jpg');
        final uploadTask = ref.putFile(File(selectedImagePath));
        final snapshot = await uploadTask.whenComplete(() => null);
        final imageUrl = await snapshot.ref.getDownloadURL();

        await docRef.update({
          'namaMenu': menuName,
          'deskripsi': description,
          'harga': price,
          'quantity': quantity,
          'imageUrl': imageUrl,
          'image_filename': snapshot.ref.name,
        });
      } else {
        await docRef.update({
          'namaMenu': menuName,
          'deskripsi': description,
          'harga': price,
          'quantity': quantity,
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data menu berhasil diperbarui')),
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
        title: const Text('Update Menu'),
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
                      (selectedImagePath == '' && imageUrl != '')
                          ? Image.network(
                              imageUrl,
                              height: 180,
                              width: 180,
                              fit: BoxFit.fill,
                            )
                          : (selectedImagePath != '')
                              ? Image.file(
                                  File(selectedImagePath),
                                  height: 180,
                                  width: 180,
                                  fit: BoxFit.fill,
                                )
                              : Container(),
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
                      const SizedBox(
                        height: 10,
                      )
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
                          initialValue: menuName,
                          onChanged: (value) {
                            menuName = value.trim();
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
                          initialValue: description,
                          onChanged: (value) {
                            description = value.trim();
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
                      const SizedBox(height: 25),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          initialValue: price.toString(),
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
                        text: 'Submit',
                        press: () async {
                          if (formKey.currentState!.validate()) {
                            if (widget.menuId.isNotEmpty) {
                              await updateMenu();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Isi field yang kosong')),
                              );
                            }
                          }
                        },
                        height: 60,
                      )
                    ],
                  ),
                ),
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
          child: SizedBox(
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
                          ),
                        ),
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
