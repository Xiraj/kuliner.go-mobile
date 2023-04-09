import 'package:flutter/material.dart';
import './formBooking.dart';
import './restaurant_page.dart';

// ignore: camel_case_types
class bookingPage extends StatefulWidget {
  const bookingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _bookingPageState createState() => _bookingPageState();
}

// ignore: camel_case_types
class _bookingPageState extends State<bookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 24, left: 25),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => restaurantPage()));
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(top: 24, left: 45),
                child: Text(
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
                    margin: EdgeInsets.only(left: 25, top: 30),
                    child:
                        Image(image: AssetImage('assets/McDonalds_Logo.jpeg')),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 18),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 99, top: 14),
                          child: Row(
                            children: [
                              Text(
                                'McDonalds',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    Icons.verified,
                                    color: Colors.blue,
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 134, top: 14),
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                    '4.7 \t | \t',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )),
                                  Container(
                                    child: Image(
                                        image: AssetImage('assets/dollar.png')),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 55, top: 14),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text('1.5 Km',
                                    style: TextStyle(fontSize: 12)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  '| Podomoro Park',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30, right: 215),
                child: formBookingPage(),
              )
            ],
          ),
        ],
      )),
    );
  }
}
