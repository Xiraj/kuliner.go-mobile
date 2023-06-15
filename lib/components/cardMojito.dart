// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/aneka_minuman_page.dart';

class cardMojito extends StatelessWidget {
  const cardMojito({super.key});

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
                  'Es Mojito',
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
            child: Image.asset('assets/minum_page/3.png'),
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
                    'Mojito',
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
                    'Minuman Khas Kuba',
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
                    child: Image.asset('assets/mexico.png'),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: const <Widget>[
              ExpansionTile(
                title: Text('Detail Mojito'),
                leading: Icon(Icons.description_outlined),
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      'Mojito adalah minuman (biasa nya) beralkohol yang berasal dari Kuba dan telah menjadi populer di seluruh dunia.',
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
                title: const Text('Bahan - Bahan Mojito'),
                leading: const Icon(Icons.food_bank),
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bahan-bahan: \n• Daun Mint \n• Air Berkarbonasi/ (Alkohol) Secukupnya \n• Es Batu \n• Gula Secukupnya (Opsional) \n• Jus Lemon / Lime. ',
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
                title: const Text('Langkah Pembuatan Mojito'),
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
                          'Cara membuat: \n• Siapkan Daun Mint Secukupnya \n• Tuangkan 2 Sdm Gula Pasir (Opsional) \n• Tambahkan 250ml air berkarbonasi / (Alkohol) \n• Beri Jus Lemon / Lime \n• Tambahkan Es Batu.',
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
                title: const Text('Sejarah Mojito'),
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
                          'Sejarah asal-usul mojito masih diperdebatkan dan tidak ada konsensus yang pasti. Namun, minuman ini memiliki sejarah yang kaya dan terkait dengan budaya Kuba.',
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
