import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

int introduction = 0;

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key, required this.title});
  final String title;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

Future initIntroduction() async {
  final prefs = await SharedPreferences.getInstance();

  int? intro = prefs.getInt('introduction');
  // ignore: avoid_print
  print('intro : $intro');
  if (intro != null && intro == 1) {
    return introduction = 1;
  }
  prefs.setInt('introduction', 1);
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: <Widget>[
                // Halaman pertama onboarding
                ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/logo.png',
                                            width: 200)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OptionLoginPage()));
                                          },
                                          child: Text(
                                            'Lewati',
                                            style: TextStyle(
                                                color: greyColor,
                                                fontSize: 16.0,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/vector.png',
                                    color: blueColor,
                                  ),
                                  Center(
                                    child: Image.asset(
                                      'assets/inrestaurant.png',
                                      width: 350,
                                      height: 320,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Pilih restoran\nfavoritemu',
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Bingung mau makan dimana? Kuliner.Go\nnyediain banyak resto terkenal',
                                    style: TextStyle(color: blackColor),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DotsIndicator(
                                              dotsCount: 3,
                                              position: currentPage.toDouble(),
                                              decorator: DotsDecorator(
                                                color: greyColor,
                                                activeColor: blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  controller.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: Size(167, 66),
                                                    backgroundColor: blueColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
                                                child: Text('Selanjutnya')),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Halaman kedua onboarding
                ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/logo.png',
                                            width: 200)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Lewati',
                                            style: TextStyle(
                                                color: greyColor,
                                                fontSize: 16.0,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/vector.png',
                                    color: blueColor,
                                  ),
                                  Center(
                                    child: Image.asset(
                                      'assets/reviews.png',
                                      width: 350,
                                      height: 274,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Temukan harga\ndan review terbaik',
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Bingung mau makan dimana? Kuliner.Go\nnyediain banyak resto terkenal',
                                    style: TextStyle(color: blackColor),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DotsIndicator(
                                              dotsCount: 3,
                                              position: currentPage.toDouble(),
                                              decorator: DotsDecorator(
                                                color: greyColor,
                                                activeColor: blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  controller.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: Size(167, 66),
                                                    backgroundColor: blueColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
                                                child: Text('Selanjutnya')),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // Halaman ketiga onboarding
                ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/logo.png',
                                            width: 200)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Lewati',
                                            style: TextStyle(
                                                color: greyColor,
                                                fontSize: 16.0,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/vector.png',
                                    color: blueColor,
                                  ),
                                  Center(
                                    child: Image.asset(
                                      'assets/payprocessed.png',
                                      width: 350,
                                      height: 274,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Reservasi tempat\ndan pesan makanan',
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 26),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Ga perlu dateng ke restoran buat reservasi\ntempat dan pesan makanannya',
                                    style: TextStyle(color: blackColor),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DotsIndicator(
                                              dotsCount: 3,
                                              position: currentPage.toDouble(),
                                              decorator: DotsDecorator(
                                                color: greyColor,
                                                activeColor: blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            OptionLoginPage()));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(167, 66),
                                                  backgroundColor: blueColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30))),
                                              child: Text('Mari Jelajahi!'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
