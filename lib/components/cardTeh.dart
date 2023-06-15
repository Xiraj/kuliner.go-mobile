// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/aneka_minuman_page.dart';

class cardTeh extends StatelessWidget {
  const cardTeh({super.key});

  @override
  Widget build(BuildContext context) {
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
                        builder: (context) => const AnekaMinumanPage(),
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
                  'Es Teh Manis',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 320,
            height: 320,
            child: Image.asset('assets/minum_page/1.png'),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Text(
                    'Es Teh Manis',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Text(
                    'Minuman Khas Indonesia',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w200,
                        color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/indonesia.png'),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: const <Widget>[
              ExpansionTile(
                title: Text('Detail Es Teh Manis'),
                leading: Icon(Icons.description_outlined),
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      'Es teh manis adalah minuman yang menyegarkan dan manis yang menjadi favorit di Indonesia. Rasanya yang lezat dan mudah disajikan membuatnya menjadi minuman yang populer di berbagai kesempatan. Namun, penting untuk mengonsumsinya dengan bijak dan tidak berlebihan mengingat kandungan gula yang tinggi.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              ExpansionTile(
                title: const Text('Bahan - Bahan Es Teh Manis'),
                leading: const Icon(Icons.food_bank),
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bahan-bahan: \n• 1 Buah Teh Celup \n• 2 Sendok Makan Gula Pasir \n• 250ml Air Mineral \n• Es Batu Secukupnya. ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              ExpansionTile(
                title: const Text('Langkah Pembuatan Es Teh Manis'),
                leading: const Icon(Icons.local_restaurant_rounded),
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 360,
                        child: Text(
                          'Cara membuat: \n• Siapkan Teh Celup \n• Tuangkan 2 Sdm Gula Pasir \n• Tambahkan 250ml air hangat \n• Aduk hingga larut merata \n• Tambahkan Es Batu.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              ExpansionTile(
                title: const Text('Sejarah Es Teh Manis'),
                leading: const Icon(Icons.more_horiz),
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 360,
                        child: Text(
                          'Sejarah es teh manis berasal dari negara yang memiliki budaya minum teh yang kaya, yaitu Tiongkok. Teh sendiri telah dikonsumsi di Tiongkok selama ribuan tahun sebagai minuman yang menyegarkan dan memiliki banyak manfaat bagi kesehatan. Namun, penggunaan gula dalam minuman teh mulai menjadi populer pada abad ke-7.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
