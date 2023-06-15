import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardNasiKebuli.dart';
import 'package:kuliner_go_mobile/components/cardNasiLemak.dart';
import 'package:kuliner_go_mobile/components/cardNasiKuning.dart';
import 'package:kuliner_go_mobile/components/cardNasiBibimbap.dart';
import 'package:kuliner_go_mobile/components/cardNasiRissoto.dart';
import 'package:kuliner_go_mobile/pages/home_bottomnav.dart';

class AnekaNasiPage extends StatefulWidget {
  const AnekaNasiPage({Key? key}) : super(key: key);

  @override
  _AnekaNasiPageState createState() => _AnekaNasiPageState();
}

class _AnekaNasiPageState extends State<AnekaNasiPage> {
  @override
  Widget build(BuildContext context) {
    var i;
    return Scaffold(
      body: ListView(
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
                padding: const EdgeInsets.only(top: 24, left: 84),
                child: const Text(
                  'Aneka Nasi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.only(left: 24),
            child: const Text(
              'Kami memiliki',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.only(left: 24),
            child: const Text(
              'Aneka Nasi Untuk Kamu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),

              Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xfff19A7CE),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                    width: 0,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/nasi_page/1.png'),
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Nasi Lemak',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Makanan Khas Malaysia',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const cardNasi(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 90),
                            child: Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0xfffF6F1F1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),

// //////

              Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xfff19A7CE),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                    width: 0,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/nasi_page/2.png'),
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Nasi Kuning',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Makanan Khas Indonesia',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const cardNasiKuning(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 90),
                            child: Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0xfffF6F1F1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

// NASI KEBULI
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xfff19A7CE),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                    width: 0,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/nasi_page/3.png'),
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Nasi Kebuli',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Makanan Khas Timur',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const cardNasiKebuli(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 120),
                            child: Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0xfffF6F1F1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xfff19A7CE),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                    width: 0,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/nasi_page/5.png'),
                    ),
                    Row(
                      children: const[
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Nasi Bibimbap',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Makanan Khas Korea',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const cardNasiBibimbap(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 120),
                            child: Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0xfffF6F1F1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Container(
                width: 350,
                height: 310,
                decoration: BoxDecoration(
                  color: const Color(0xfff19A7CE),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                    width: 0,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 320,
                      height: 210,
                      child: Image.asset('assets/nasi_page/6.png'),
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Nasi Rissoto',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Makanan Khas Italia',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Color(0xfffF6F1F1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const cardNasiRissoto(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 125),
                            child: Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0xfffF6F1F1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
