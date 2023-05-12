import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuliner_go_mobile/theme.dart';

class UpdateMenu extends StatefulWidget {
  final String menuId;
  final String menuName;
  final String description;
  final String price;
  final String imageUrl;

  UpdateMenu({
    required this.menuId,
    required this.menuName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<UpdateMenu> createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  final formKey = GlobalKey<FormState>();
  String selectedImagePath = '';
  late String menuName;
  late String description;
  late String price;
  late String imageUrl;
  bool showProgressIndicator = false;
  @override
  void initState() {
    menuName = widget.menuName;
    description = widget.description;
    price = widget.price;
    imageUrl = widget.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Menu'),
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
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
                      Text(
                        'Select Image',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          selectImage();
                          setState(() {});
                        },
                        child: const Text(
                          'Select',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(350, 60),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                        ),
                      ),
                      SizedBox(
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
                          decoration: InputDecoration(
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
                      SizedBox(height: 20),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: InputDecoration(
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
                      SizedBox(height: 20),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Harga Menu'),
                          keyboardType: TextInputType.number,
                          initialValue: price.toString(),
                          onChanged: (value) {
                            price = value.trim();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harga tidak boleh kosong';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () async {
                          setState(() {});
                          if (menuName.isEmpty ||
                              description.isEmpty ||
                              price.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Fill in all fields')));
                          } else {
                            //reference to document
                            final dbmenu = FirebaseFirestore.instance
                                .collection('Menu')
                                .doc(widget.menuId.isNotEmpty
                                    ? widget.menuId
                                    : null);
                            String docID = '';
                            if (widget.menuId.isNotEmpty) {
                              docID = widget.menuId;
                            } else {
                              docID = dbmenu.id;
                            }
                            final ref = FirebaseStorage.instance
                                .ref()
                                .child('menu_images')
                                .child(docID);
                            if (widget.menuId.isNotEmpty) {
                              final oldImageUrl = await dbmenu
                                  .get()
                                  .then((doc) => doc.data()!['imageUrl']);
                              final oldFile = File(oldImageUrl);
                              if (oldFile.existsSync()) {
                                await oldFile.delete();
                              }
                            }

                            final uploadTask =
                                ref.putFile(File(selectedImagePath));
                            final snapshot =
                                await uploadTask.whenComplete(() => null);
                            final newImageUrl =
                                await snapshot.ref.getDownloadURL();

                            final jsonData = {
                              'namaMenu': menuName,
                              'deskripsi': description,
                              'harga': price,
                              'imageUrl': newImageUrl,
                              'menuid': docID
                            };

                            showProgressIndicator = true;
                            if (widget.menuId.isEmpty) {
                              //create document and write data to firebase
                              await dbmenu.set(jsonData).then(
                                (value) {
                                  menuName = '';
                                  description = '';
                                  price = '';
                                  imageUrl = '';
                                  showProgressIndicator = false;
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                              );
                            } else {
                              await dbmenu.update(jsonData).then(
                                (value) {
                                  menuName = '';
                                  description = '';
                                  price = '';
                                  imageUrl = '';
                                  showProgressIndicator = false;
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                              );
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Update successful')));
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minWidth: 330,
                        height: 50,
                        color: blueColor,
                        child: showProgressIndicator
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                      ),
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
          child: Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
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
                          print('Image_Path:-');
                          print(selectedImagePath);
                          if (selectedImagePath != '') {
                            Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                                  Text('Gallery'),
                                ],
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () async {
                          selectedImagePath = await selectImageFromCamera();
                          print('Image_Path:-');
                          print(selectedImagePath);

                          if (selectedImagePath != '') {
                            Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                                Text('Camera'),
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
