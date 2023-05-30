import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuliner_go_mobile/theme.dart';

class UpdateInfo extends StatefulWidget {
  final String id;
  final String tipeRestoran;
  final String detailRestoran;
  final String jamBuka;
  final String kisaranHarga;
  final String alamatRestoran;
  final String urlRestoran;
  final String imageUrl;
  final String fasilitas;

  UpdateInfo({
    super.key,
    required this.id,
    required this.detailRestoran,
    required this.kisaranHarga,
    required this.alamatRestoran,
    required this.imageUrl,
    required this.fasilitas,
    required this.jamBuka,
    required this.tipeRestoran,
    required this.urlRestoran,
  });

  @override
  State<UpdateInfo> createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
  final formKey = GlobalKey<FormState>();
  String selectedImagePath = '';
  late String tipeRestoran;
  late String detailRestoran;
  late String jamBuka;
  String kisaranHarga = '';
  late String alamatRestoran;
  late String urlRestoran;
  late String fasilitas;
  late String imageUrl;
  bool showProgressIndicator = false;
  @override
  void initState() {
    tipeRestoran = widget.tipeRestoran;
    detailRestoran = widget.detailRestoran;
    jamBuka = widget.jamBuka;
    kisaranHarga = widget.kisaranHarga;
    alamatRestoran = widget.alamatRestoran;
    urlRestoran = widget.urlRestoran;
    fasilitas = widget.fasilitas;
    imageUrl = widget.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Informasi Restoran'),
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
                              height: 100,
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
                              : Image.asset(
                                  'assets/image_placeholder.png',
                                  height: 180,
                                  width: 180,
                                  fit: BoxFit.fill,
                                ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Select Image',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          selectImage();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(330, 50),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                        ),
                        child: const Text(
                          'Select',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tipe Restoran'),
                          initialValue: tipeRestoran,
                          onChanged: (value) {
                            tipeRestoran = value.trim();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tipe restoran tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Detail Restoran'),
                          initialValue: detailRestoran,
                          onChanged: (value) {
                            detailRestoran = value.trim();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Detail Restoran tidak boleh kosong';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Jam Buka'),
                          initialValue: jamBuka,
                          onChanged: (value) {
                            jamBuka = value.trim();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jam Buka tidak boleh kosong';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kisaran Harga',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Column(
                              children: [
                                RadioListTile<String>(
                                  title: const Text('Rp 5.000 - 50.000'),
                                  value: 'Rp 5.000 - 50.000',
                                  groupValue: kisaranHarga,
                                  onChanged: (value) {
                                    setState(() {
                                      kisaranHarga = value!;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: const Text('Rp 50.000 - 100.000'),
                                  value: 'Rp 50.000 - 100.000',
                                  groupValue: kisaranHarga,
                                  onChanged: (value) {
                                    setState(() {
                                      kisaranHarga = value!;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: const Text('Lebih dari Rp 100.000'),
                                  value: 'Lebih dari Rp 100.000',
                                  groupValue: kisaranHarga,
                                  onChanged: (value) {
                                    setState(() {
                                      kisaranHarga = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            if (kisaranHarga.isEmpty)
                              const Text(
                                'Pilih satu pilihan',
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Alamat Restoran'),
                          initialValue: alamatRestoran,
                          onChanged: (value) {
                            alamatRestoran = value.trim();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Alamat Restoran tidak boleh kosong';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'URL Restoran',
                          ),
                          initialValue: urlRestoran,
                          onChanged: (value) {
                            urlRestoran = value.trim();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'URL Restoran tidak boleh kosong';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.url,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Fasilitas'),
                          initialValue: fasilitas,
                          onChanged: (value) {
                            fasilitas = value.trim();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Fasilitas Restoran tidak boleh kosong';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () async {
                          setState(() {});
                          if (tipeRestoran.isEmpty ||
                              detailRestoran.isEmpty ||
                              jamBuka.isEmpty ||
                              kisaranHarga.isEmpty ||
                              urlRestoran.isEmpty ||
                              alamatRestoran.isEmpty ||
                              fasilitas.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Fill in all fields')));
                          } else {
                            //reference to document
                            final dbmenu = FirebaseFirestore.instance
                                .collection('Restoran')
                                .doc(widget.id.isNotEmpty ? widget.id : null);
                            String docID = '';
                            if (widget.id.isNotEmpty) {
                              docID = widget.id;
                            } else {
                              docID = dbmenu.id;
                            }
                            final ref = FirebaseStorage.instance
                                .ref()
                                .child('restoran_images')
                                .child(docID);
                            if (widget.id.isNotEmpty) {
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
                              'tipeRestoran': tipeRestoran,
                              'detailRestoran': detailRestoran,
                              'jamBuka': jamBuka,
                              'alamatRestoran': alamatRestoran,
                              'urlRestoran': urlRestoran,
                              'kisaranHarga': kisaranHarga,
                              'fasilitasRestoran': fasilitas,
                              'imageUrl': newImageUrl,
                              'id': docID
                            };

                            showProgressIndicator = true;
                            if (widget.id.isEmpty) {
                              await dbmenu.set(jsonData).then(
                                (value) {
                                  tipeRestoran = '';
                                  detailRestoran = '';
                                  jamBuka = '';
                                  alamatRestoran = '';
                                  urlRestoran = '';
                                  kisaranHarga = '';
                                  fasilitas = '';
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
                                  tipeRestoran = '';
                                  detailRestoran = '';
                                  jamBuka = '';
                                  alamatRestoran = '';
                                  urlRestoran = '';
                                  kisaranHarga = '';
                                  fasilitas = '';
                                  imageUrl = '';
                                  showProgressIndicator = false;
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                              );
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Update successful')));
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        minWidth: 360,
                        height: 70,
                        color: blueColor,
                        child: showProgressIndicator
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                      ),
                      const SizedBox(height: 20)
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
                          print('Image_Path:-');
                          print(selectedImagePath);
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
                          print('Image_Path:-');
                          print(selectedImagePath);
                          if (selectedImagePath != '') {
                            Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No Image Captured !"),
                              ),
                            );
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
                  ),
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
