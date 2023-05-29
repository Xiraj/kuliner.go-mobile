import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/pages/menu_resto.dart';
import 'package:kuliner_go_mobile/theme.dart';

import 'home_bottomnav.dart';

class bookingPage extends StatefulWidget {
  final DocumentSnapshot resto;
  const bookingPage({super.key, required this.resto});

  @override
  State<bookingPage> createState() => _bookingPageState();
}

class _bookingPageState extends State<bookingPage> {
  final formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late String name;
  late String phone;
  late String email;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<void> saveBookingData() async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        print('User not logged in.');
        return;
      }

      final DocumentReference bookingRef =
          FirebaseFirestore.instance.collection('Booking').doc();

      final String formattedTime =
          selectedTime != null ? selectedTime!.format(context) : '';

      final DateTime? selectedDateOnly = selectedDate != null
          ? DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day)
          : null;

      final Map<String, dynamic> bookingData = {
        'restoId': widget.resto.id,
        'userId': currentUser.uid,
        'name': name,
        'phone': phone,
        'email': email,
        'selectedDate': selectedDateOnly != null
            ? selectedDateOnly.toIso8601String().split('T')[0]
            : null,
        'selectedTime': formattedTime,
        'people': counter,
      };

      await bookingRef.set(bookingData);

      setState(() {
        name = '';
        phone = '';
        email = '';
        selectedDate = null;
        selectedTime = null;
        counter = 0;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Pesan Tempat Berhasil!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      print('Failed to save booking data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 24, left: 8),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const homeBottomNav(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 24, left: 64),
                  child: const Text(
                    'Pesan Tempat',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(left: 25, top: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.resto['imageUrl'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${widget.resto['username']}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.verified,
                              color: Colors.blue,
                            )
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            const Text(
                              '4.7 \t | \t',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            const Image(image: AssetImage('assets/dollar.png')),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                            const Text(
                              '1.5 Km ',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '| ${widget.resto['alamatRestoran']}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 215, top: 16),
                  child: const Text(
                    'Data Pemesan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 8),
                  width: 600,
                  child: const Text(
                    "Pastikan nomor telepon dan email sudah benar",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 2),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 12, right: 20),
                                child: RoundedInputField(
                                  hintText: "Masukkan nama lengkapmu",
                                  icon: Icons.person_2_rounded,
                                  onChanged: (value) {
                                    name = value.trim();
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 12, right: 20),
                                child: RoundedInputField(
                                  hintText: "Masukkan nomor telepon",
                                  icon: Icons.call,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    phone = value.trim();
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 12, right: 20),
                                child: RoundedInputField(
                                  hintText: "Masukkan alamat email",
                                  icon: Icons.email_rounded,
                                  onChanged: (value) {
                                    email = value.trim();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 155, top: 16),
                  child: const Text(
                    "Pilih Tanggal dan Jam",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 8),
                  width: 600,
                  child: const Text(
                    "Tentuin kapan kamu mau pesan tempatnya",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 2),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 12, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  selectDate(context);
                                },
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: altColor,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 12),
                                      const Icon(Icons.calendar_month_rounded),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          selectedDate != null
                                              ? selectedDate
                                                  .toString()
                                                  .split(" ")[0]
                                              : "Tanggal",
                                          style: const TextStyle(
                                              fontSize: 12.0, color: greyColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  selectTime(context);
                                },
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: altColor,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      const Icon(Icons.av_timer_rounded),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          selectedTime != null
                                              ? selectedTime!.format(context)
                                              : "Jam",
                                          style: const TextStyle(
                                              fontSize: 12.0, color: greyColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 220, top: 16),
                  child: const Text(
                    "Jumlah Orang",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 8),
                  width: 600,
                  child: const Text(
                    "Ada berapa banyak orang yang mau ikut makan?",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 110,
                          width: 350,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[250],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 5, top: 40),
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: decrement,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 110, bottom: 15),
                                child: Column(
                                  children: [
                                    Image.asset('assets/user.png'),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      counter.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff0190ff),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 100, top: 40),
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: increment,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                const SizedBox(height: 20),
                RoundedButton(
                  text: 'Pesan Tempat',
                  press: () {
                    saveBookingData();
                    formKey.currentState?.reset();
                    setState(() {
                      name = '';
                      phone = '';
                      email = '';
                    });
                  },
                  height: 60,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
