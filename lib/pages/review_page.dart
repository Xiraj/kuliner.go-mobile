import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';

class reviewPage extends StatefulWidget {
  final DocumentSnapshot resto;
  const reviewPage({super.key, required this.resto});

  @override
  State<reviewPage> createState() => _reviewPageState();
}

class _reviewPageState extends State<reviewPage> {
  late String commentText = '';
  late double rate = 0;
  late TextEditingController commentController = TextEditingController();
  Future<void> submitReview() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String? userId = user?.uid;
      String? username = user?.displayName;

      await FirebaseFirestore.instance.collection('Review').add({
        'restoId': widget.resto.id,
        'userId': userId,
        'username': username,
        'commentText': commentText,
        'rate': rate,
        'timestamp': FieldValue.serverTimestamp(),
      });
      FocusScope.of(context).unfocus();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Review submitted successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    rate = 0;
                    commentController.text = '';
                  });
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to submit review.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          'Tambah Ulasan',
          style: blackTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
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
                                  fontSize: 18, fontWeight: FontWeight.w700),
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
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                            const Text(
                              '1.5 Km ',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              '| ${widget.resto['alamatRestoran']}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 50.0),
                const Text(
                  'Berikan penilaian untuk restoran ini',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 30.0),
                RatingBar.builder(
                  initialRating: rate,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 50,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      rate = rating;
                    });
                  },
                  unratedColor: const Color.fromARGB(255, 219, 216, 216),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Ringkasan Ulasan',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    maxLength: 2500,
                    decoration: const InputDecoration(
                      hintText: 'Coba ceritain pengalamanmu',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    controller: commentController,
                    onChanged: (value) {
                      commentText = value.trim();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ulasan tidak boleh kosong';
                      }
                      return null;
                    },
                    maxLines: 5,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 80.0),
                RoundedButton(
                  text: 'Submit',
                  press: () {
                    submitReview();
                  },
                  height: 70,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
