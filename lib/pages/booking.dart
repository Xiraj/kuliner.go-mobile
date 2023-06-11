import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/product_list.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/components/rounded_input_field.dart';
import 'package:kuliner_go_mobile/pages/payment.dart';

import 'package:kuliner_go_mobile/pages/restaurant_page.dart';
import 'package:kuliner_go_mobile/theme.dart';

class bookingPage extends StatefulWidget {
  final DocumentSnapshot resto;
  final String email;
  final String username;
  const bookingPage(
      {super.key,
      required this.resto,
      required this.email,
      required this.username});

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
    final DateTime currentDate = DateTime.now();
    FocusScope.of(context).unfocus();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> selectTime(BuildContext context) async {
    FocusScope.of(context).unfocus();
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
      final String randomId = '#BOOKING${Random().nextInt(9999)}';
      final Map<String, dynamic> bookingData = {
        'restoId': widget.resto.id,
        'bookingId': randomId,
        'userId': currentUser.uid,
        'name': currentUser.displayName,
        'phone': phone,
        'email': currentUser.email,
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
    final User? currentUser = FirebaseAuth.instance.currentUser;
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
                          builder: (context) =>
                              restaurantPage(resto: widget.resto),
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
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              '4.7 \t | \t',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Image(image: AssetImage('assets/dollar.png')),
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
                                padding:
                                    const EdgeInsets.only(top: 12, right: 20),
                                child: RoundedInputField(
                                  hintText: "Masukkan nama lengkapmu",
                                  icon: Icons.person_2_rounded,
                                  onChanged: (value) {
                                    name = value.trim();
                                  },
                                  initialValue: currentUser?.displayName,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Nama lengkap harus diisi';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 12, right: 20),
                                child: RoundedInputField(
                                  hintText: "Masukkan nomor telepon",
                                  icon: Icons.call,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    phone = value.trim();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Nomor Telepon harus diisi';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 12, right: 20),
                                child: RoundedInputField(
                                  hintText: "Masukkan alamat email",
                                  icon: Icons.email_rounded,
                                  onChanged: (value) {
                                    email = value.trim();
                                  },
                                  initialValue: currentUser?.email,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Alamat harus diisi';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 155, top: 16),
                                child: const Text(
                                  "Pilih Tanggal dan Jam",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 8),
                                width: 600,
                                child: const Text(
                                  "Tentuin kapan kamu mau pesan tempatnya",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 2),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 12, right: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                selectDate(context);
                                              },
                                              child: InputDecorator(
                                                decoration:
                                                    const InputDecoration(
                                                  filled: true,
                                                  fillColor: altColor,
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () {
                                                          selectDate(context);
                                                        },
                                                        child: InputDecorator(
                                                          decoration:
                                                              const InputDecoration(
                                                            filled: true,
                                                            fillColor: altColor,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              const SizedBox(
                                                                  width: 12),
                                                              const Icon(Icons
                                                                  .calendar_month_rounded),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Expanded(
                                                                child: Text(
                                                                  selectedDate !=
                                                                          null
                                                                      ? selectedDate
                                                                          .toString()
                                                                          .split(
                                                                              " ")[0]
                                                                      : "Tanggal",
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12.0,
                                                                      color:
                                                                          greyColor),
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
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                selectTime(context);
                                              },
                                              child: InputDecorator(
                                                decoration:
                                                    const InputDecoration(
                                                  filled: true,
                                                  fillColor: altColor,
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(width: 20),
                                                    const Icon(
                                                        Icons.av_timer_rounded),
                                                    const SizedBox(width: 8),
                                                    Expanded(
                                                      child: Text(
                                                        selectedTime != null
                                                            ? selectedTime!
                                                                .format(context)
                                                            : "Jam",
                                                        style: const TextStyle(
                                                            fontSize: 12.0,
                                                            color: greyColor),
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
                                padding:
                                    const EdgeInsets.only(right: 220, top: 16),
                                child: const Text(
                                  "Jumlah Orang",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 8),
                                width: 600,
                                child: const Text(
                                  "Ada berapa banyak orang yang mau ikut makan?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(height: 28),
                              Container(
                                margin: const EdgeInsets.only(left: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 114,
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
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 40),
                                            child: IconButton(
                                              icon: const Icon(Icons.remove),
                                              onPressed: decrement,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 100),
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
                                                const Text(
                                                  'Orang',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 100, top: 40),
                                            child: IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: increment,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PaymentPage(),
                                    ),
                                  );
                                },
                                child: ExpansionTile(
                                  title: const Text('Kartu / Rekening Bank'),
                                  tilePadding: const EdgeInsets.symmetric(
                                      horizontal: 0.5, vertical: 0.5),
                                  childrenPadding:
                                      const EdgeInsets.only(left: 10),
                                  leading: const Icon(Icons.wallet_rounded),
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Container(
                                          width: 420,
                                          padding: const EdgeInsets.only(
                                              left: 40, right: 30),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 70,
                                                padding: const EdgeInsets.only(
                                                  right: 60,
                                                ),
                                                child: Image.asset(
                                                    'assets/Mandiri.png'),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    top: 16),
                                                child:
                                                    const Text('| \t Mandiri'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              RoundedButton(
                                text: 'Pesan Tempat',
                                press: () {
                                  if (formKey.currentState != null &&
                                      formKey.currentState!.validate()) {
                                    saveBookingData();
                                    formKey.currentState?.reset();
                                  }
                                },
                                height: 60,
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductListScreen(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.shopping_bag_sharp),
      ),
    );
  }
}
