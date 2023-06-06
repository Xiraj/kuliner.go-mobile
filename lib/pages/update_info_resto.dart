import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:day_picker/day_picker.dart';

class UpdateInfo extends StatefulWidget {
  final String id;
  final String tipeRestoran;
  final String detailRestoran;
  final List<String> hariBuka;
  final String jamBuka;
  final String jamTutup;
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
    required this.hariBuka,
    required this.jamTutup,
  });

  @override
  State<UpdateInfo> createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
  final formKey = GlobalKey<FormState>();
  String selectedImagePath = '';
  String? tipeRestoran;
  late List<String> hariBuka;
  late String jamTutup;
  late String detailRestoran;
  String jamBuka = '';
  TimeOfDay? selectedTimeTutup;
  TimeOfDay? selectedTimeBuka;
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
    hariBuka = widget.hariBuka;
    jamTutup = widget.jamTutup;
    kisaranHarga = widget.kisaranHarga;
    alamatRestoran = widget.alamatRestoran;
    urlRestoran = widget.urlRestoran;
    fasilitas = widget.fasilitas;
    imageUrl = widget.imageUrl;
    super.initState();
  }

  void selectTime(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTimeBuka = pickedTime;
      });
    }
  }

  Future<void> selectTimeClose(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTimeTutup = pickedTime;
      });
    }
  }

  Future<void> tambahRestoran() async {
    try {
      final String jamBuka =
          selectedTimeBuka != null ? selectedTimeBuka!.format(context) : '';
      final String jamTutup =
          selectedTimeBuka != null ? selectedTimeTutup!.format(context) : '';
      final newMenuDoc =
          await FirebaseFirestore.instance.collection('Restoran').add({
        'tipeRestoran': tipeRestoran,
        'detailRestoran': detailRestoran,
        'hariBuka': hariBuka,
        'jamBuka': jamBuka,
        'jamTutup': jamTutup,
        'kisaranHarga': kisaranHarga,
        'alamatRestoran': alamatRestoran,
        'urlRestoran': urlRestoran,
        'fasilitasRestoran': fasilitas,
        'imageUrl': '',
      });
      final String id = newMenuDoc.id;
      final ref = FirebaseStorage.instance
          .ref()
          .child('restoran_images')
          .child('$id.jpg');
      final uploadTask = ref.putFile(File(selectedImagePath));
      final snapshot = await uploadTask.whenComplete(() => null);
      final imageUrl = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('Restoran').doc(id).update({
        'id': id,
        'imageUrl': imageUrl,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data restoran berhasil ditambahkan')),
      );
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $error')),
      );
    }
  }

  Future<void> updateRestoran() async {
    try {
      final String jamBuka =
          selectedTimeBuka != null ? selectedTimeBuka!.format(context) : '';
      final String jamTutup =
          selectedTimeTutup != null ? selectedTimeTutup!.format(context) : '';
      final docRef =
          FirebaseFirestore.instance.collection('Restoran').doc(widget.id);

      Map<String, dynamic> dataToUpdate = {
        'tipeRestoran': tipeRestoran,
        'detailRestoran': detailRestoran,
        'kisaranHarga': kisaranHarga,
        'alamatRestoran': alamatRestoran,
        'urlRestoran': urlRestoran,
        'fasilitasRestoran': fasilitas,
      };

      if (selectedImagePath != '') {
        final ref = FirebaseStorage.instance
            .ref()
            .child('restoran_images')
            .child('${widget.id}.jpg');
        final uploadTask = ref.putFile(File(selectedImagePath));
        final snapshot = await uploadTask.whenComplete(() => null);
        final imageUrl = await snapshot.ref.getDownloadURL();

        dataToUpdate['imageUrl'] = imageUrl;
      }

      if (jamBuka.isNotEmpty) {
        dataToUpdate['jamBuka'] = jamBuka;
      }

      if (jamTutup.isNotEmpty) {
        dataToUpdate['jamTutup'] = jamTutup;
      }

      if (hariBuka.isNotEmpty) {
        dataToUpdate['hariBuka'] = hariBuka;
      }

      await docRef.update(dataToUpdate);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data restoran berhasil diperbarui')),
      );

      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $error')),
      );
    }
  }

  String? validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'Waktu tidak boleh kosong';
    }
    return null;
  }

  final List<DayInWeek> days = [
    DayInWeek("S", dayKey: "Senin"),
    DayInWeek("S", dayKey: "Selasa"),
    DayInWeek("R", dayKey: "Rabu"),
    DayInWeek("K", dayKey: "Kamis"),
    DayInWeek("J", dayKey: "Jumat"),
    DayInWeek("S", dayKey: "Sabtu"),
    DayInWeek("M", dayKey: "Minggu"),
  ];

  List<String> tipeItems = [
    'Pilih tipe restoran',
    'Kafe',
    'Kaki lima',
    'Bar & Lounge',
    'Kedai',
    'Food Court'
  ];

  @override
  Widget build(BuildContext context) {
    if (tipeRestoran == null || !tipeItems.contains(tipeRestoran)) {
      tipeRestoran = tipeItems[0];
    }
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
                      ElevatedButton(
                        onPressed: () async {
                          selectImage();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(330, 50),
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
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Tipe Restoran',
                          ),
                          value: tipeRestoran,
                          onChanged: (value) {
                            setState(() {
                              tipeRestoran = value;
                            });
                          },
                          items: tipeItems.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value == 'Pilih tipe restoran') {
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
                      const SizedBox(height: 30),
                      const Text(
                        'Jam Buka Restoran',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 360,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectWeekDays(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            days: days,
                            border: true,
                            selectedDayTextColor: Colors.blue,
                            unSelectedDayTextColor: Colors.grey,
                            backgroundColor: Colors.transparent,
                            daysBorderColor: Colors.grey,
                            onSelect: (value) {
                              widget.hariBuka;
                              setState(
                                () {
                                  hariBuka = value;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                selectTime(context);
                              },
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Jam Buka',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  errorText: validateTime(
                                      selectedTimeBuka != null
                                          ? selectedTimeBuka!.format(context)
                                          : widget.jamBuka),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        selectedTimeBuka != null
                                            ? selectedTimeBuka!.format(context)
                                            : widget.jamBuka,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                selectTimeClose(context);
                              },
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Jam Tutup',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  errorText: validateTime(
                                      selectedTimeTutup != null
                                          ? selectedTimeTutup!.format(context)
                                          : widget.jamTutup),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        selectedTimeTutup != null
                                            ? selectedTimeTutup!.format(context)
                                            : widget.jamTutup,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 30),
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
                                  title: const Text('Dibawah Rp75.000'),
                                  value: 'Dibawah Rp75.000',
                                  groupValue: kisaranHarga,
                                  onChanged: (value) {
                                    setState(() {
                                      kisaranHarga = value!;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: const Text('Rp200.000 - Rp325.000'),
                                  value: 'Rp200.000 - Rp325.000',
                                  groupValue: kisaranHarga,
                                  onChanged: (value) {
                                    setState(() {
                                      kisaranHarga = value!;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: const Text('Rp325.000 - Rp450.000'),
                                  value: 'Rp325.000 - Rp450.000',
                                  groupValue: kisaranHarga,
                                  onChanged: (value) {
                                    setState(() {
                                      kisaranHarga = value!;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: const Text('Diatas Rp450.000'),
                                  value: 'Diatas Rp450.000',
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
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (widget.id.isNotEmpty) {
                              await updateRestoran();
                            } else {
                              await tambahRestoran();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(330, 50),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 14, color: Colors.white),
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
