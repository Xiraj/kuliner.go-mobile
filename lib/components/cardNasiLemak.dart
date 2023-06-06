// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/aneka_nasi_page.dart';

class cardNasi extends StatelessWidget {
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
                        builder: (context) => const AnekaNasiPage(),
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
                  'Nasi Lemak',
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
            child: Image.asset('assets/nasi_page/1.png'),
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
                    'Nasi Lemak',
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
                    'Makanan Khas Malaysia',
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
                    child: Image.asset('assets/malaysia.png'),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: const <Widget>[
              ExpansionTile(
                title: Text('Detail Nasi Lemak'),
                leading: Icon(Icons.description_outlined),
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      'Nasi lemak adalah salah satu makanan khas Malaysia yang terkenal dan sangat populer di negara itu. Makanan ini terdiri dari nasi yang dimasak dengan santan, sehingga memberikan cita rasa kaya dan lezat. Nasi lemak biasanya disajikan dengan lauk-pauk dan bumbu khas yang membuatnya menjadi hidangan yang menggugah selera.',
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
                title: const Text('Bahan - Bahan Nasi Lemak'),
                leading: const Icon(Icons.food_bank),
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bahan-bahan: \n• 2 Gelas beras \n• 2 Gelas air \n• 1 Lembar daun pandan \n• 1 Garam dapur \n• 1 Sendok makan minyak kelapa / minyak sayur',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Bahan untuk sambal: \n• 10 Cabai merah keriting \n• 5 Cabai rawit (sesuai selera pedas) \n• 5 Bawang merah \n• 3 Siung bawang putih \n• 2 Lembar daun jeruk \n• 1 Sendok teh terasi (udang rebon) \n• Gula dan Garam \n• 2 Sendok makan minyak sayur ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Bahan untuk sambal: \n• 10 Cabai merah keriting \n• 5 Cabai rawit (sesuai selera pedas) \n• 5 Bawang merah \n• 3 Siung bawang putih \n• 2 Lembar daun jeruk \n• 1 Sendok teh terasi (udang rebon) \n• Gula dan Garam \n• 2 Sendok makan minyak sayur ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Bahan untuk lauk:  \n• 4 Buah telur \n• 200 Gram ikan teri / ikan bilis \n• Minyak goreng',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Bahan untuk lauk:  \n• Daun pandan potong kecil-kecil \n• Timur iris tipis \n• Kacang tanah panggang',
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
                title: const Text('Langkah Pembuatan Nasi Lemak'),
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
                          'Cara membuat: \n• Cuci beras hingga bersih, kemudian tambahkan air dan daun pandan. Masak beras dengan menggunakan rice cooker atau panci hingga matang dan beraroma harum. \n• Sementara itu, panaskan minyak kelapa atau minyak sayur dalam wajan. Tumis bawang merah, bawang putih, dan terasi hingga harum. \n• Masukkan cabai merah keriting dan cabai rawit, tumis hingga cabai layu dan matang. Kemudian tambahkan daun jeruk, gula, dan garam. Aduk rata dan masak hingga bumbu tercampur sempurna. Angkat dan sisihkan. \n• Panaskan minyak dalam wajan untuk menggoreng telur dan ikan teri. Goreng telur hingga matang sesuai selera (boleh digoreng dadar atau rebus). Goreng ikan teri hingga kering dan renyah. Tiriskan di atas kertas minyak. \n• Panaskan kacang tanah panggang dalam wajan kering, aduk hingga kacang tanah berwarna kecokelatan dan harum. Angkat dan dinginkan, lalu kupas kulitnya. \n• Setelah nasi matang, tambahkan santan dan garam secukupnya ke dalam nasi panas. Aduk rata hingga santan tercampur merata. Tutup nasi dan biarkan selama beberapa menit agar nasi lemak menjadi lezat. \n• Sajikan nasi lemak dengan menempatkan nasi dalam piring atau daun pisang. Tambahkan sambal, telur, ikan teri, kacang tanah panggang, irisan timun, dan daun pandan sebagai hiasan di atas nasi.',
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
                title: const Text('Komposisi Nasi Lemak'),
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
                          'Cara membuat: \n• Cuci beras hingga bersih, kemudian tambahkan air dan daun pandan. Masak beras dengan menggunakan rice cooker atau panci hingga matang dan beraroma harum. \n• Sementara itu, panaskan minyak kelapa atau minyak sayur dalam wajan. Tumis bawang merah, bawang putih, dan terasi hingga harum. \n• Masukkan cabai merah keriting dan cabai rawit, tumis hingga cabai layu dan matang. Kemudian tambahkan daun jeruk, gula, dan garam. Aduk rata dan masak hingga bumbu tercampur sempurna. Angkat dan sisihkan. \n• Panaskan minyak dalam wajan untuk menggoreng telur dan ikan teri. Goreng telur hingga matang sesuai selera (boleh digoreng dadar atau rebus). Goreng ikan teri hingga kering dan renyah. Tiriskan di atas kertas minyak. \n• Panaskan kacang tanah panggang dalam wajan kering, aduk hingga kacang tanah berwarna kecokelatan dan harum. Angkat dan dinginkan, lalu kupas kulitnya. \n• Setelah nasi matang, tambahkan santan dan garam secukupnya ke dalam nasi panas. Aduk rata hingga santan tercampur merata. Tutup nasi dan biarkan selama beberapa menit agar nasi lemak menjadi lezat. \n• Sajikan nasi lemak dengan menempatkan nasi dalam piring atau daun pisang. Tambahkan sambal, telur, ikan teri, kacang tanah panggang, irisan timun, dan daun pandan sebagai hiasan di atas nasi.',
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
