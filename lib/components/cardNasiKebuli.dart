// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/aneka_nasi_page.dart';

class cardNasiKebuli extends StatelessWidget {
  const cardNasiKebuli({super.key});

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
                  'Nasi Kebuli',
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
            child: Image.asset('assets/nasi_page/3.png'),
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
                    'Nasi Kebuli',
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
                    'Makanan Khas Timur',
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
                    child: Image.asset('assets/united-arab-emirates.png'),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: const <Widget>[
              ExpansionTile(
                title: Text('Detail Nasi Kebuli'),
                leading: Icon(Icons.description_outlined),
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      'Nasi Kebuli adalah hidangan nasi yang khas dari Timur Tengah, terutama populer di negara-negara seperti Arab Saudi, Yordania, Suriah, dan Lebanon. Hidangan ini juga dikenal di Indonesia, terutama di daerah Aceh dan Sumatera Barat yang memiliki pengaruh Arab dan India dalam budaya kuliner.',
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
                title: const Text('Bahan - Bahan Nasi Kebuli'),
                leading: const Icon(Icons.food_bank),
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bahan-bahan: \n• 700gram Daging Sapi \n• 2 Gelas beras basmati \n• 2 Gelas air \n• 2 Gelas Santan Kelapa \n• 1 Sdm Jintan Bubuk \n• 1 Sdm Pala Bubuk \n• 1 Sdt Kayu Manis Bubuk \n• 6 Butir Kapulaga \n• 2 Sdt Royco Kaldu Sapi \n• 1 Sdt Cengkih Bubuk \n• 3 Sdm Minyak Samin \n• 100gram Kismis \n• 1 Batang Serai',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Bahan Bumbu Halus: \n• 10 Bawang Merah \n• 10 Bawang Putih \n• 3 Cm Jahe Geprek \n• 2 Sdt Minyak Samin',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 12,
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
                title: const Text('Langkah Pembuatan Nasi Kebuli'),
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
                          'Cara membuat: \n• Rendam beras: Rendam beras kebuli atau beras basmati dalam air selama 30 menit. Setelah itu, tiriskan airnya. \n• Tumis bumbu: Panaskan minyak atau mentega dalam wajan besar. Tumis bawang bombay hingga harum dan keemasan. Tambahkan bawang putih, jahe, dan rempah-rempah seperti kayu manis, cengkeh, kapulaga, jintan, dan merica. Tumis bumbu hingga terasa harum. \n• Masak daging: Tambahkan potongan daging ke dalam tumisan bumbu. Masak hingga daging berubah warna dan matang secara merata. Anda juga dapat menambahkan sedikit garam dan rempah lainnya sesuai selera. \n• Masak nasi: Masukkan beras yang telah direndam ke dalam wajan dengan daging dan bumbu. Aduk rata hingga beras tercampur dengan bumbu dan daging. Tuangkan santan kelapa ke dalam wajan. Tambahkan air secukupnya, sesuai dengan takaran memasak nasi yang biasa Anda gunakan. Biarkan nasi mendidih. \n• Reduksi panas dan tutup: Setelah nasi mendidih, reduksi panas dan tutup wajan dengan rapat. Biarkan nasi kebuli matang dengan menggunakan panas rendah selama sekitar 15-20 menit atau hingga nasi benar-benar matang dan lembut. Jika diperlukan, periksa kelembaban nasi dan tambahkan sedikit air jika nasi masih belum matang. \n• Fluff dan hias: Setelah nasi matang, gunakan garpu untuk mengudak nasi agar terpisah dan lembut. Hias nasi kebuli dengan kismis, almond panggang, atau kacang mete sesuai selera. \n• Sajikan: Nasi kebuli siap disajikan! Hidangkan dalam piring besar atau tray dan nikmati dengan pelengkap seperti daging kambing atau ayam, acar timun, dan saus sambal pedas.',
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
                title: const Text('Sejarah Nasi Kebuli'),
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
                          'Nasi Kebuli memiliki asal-usulnya di Timur Tengah, terutama di daerah Arab Saudi, Yordania, Suriah, dan Lebanon. Sejarah Nasi Kebuli berkaitan erat dengan perkembangan budaya dan perdagangan di wilayah tersebut.\n\n Nasi Kebuli telah ada sejak berabad-abad yang lalu, dan resepnya telah berkembang seiring dengan perjalanan waktu dan interaksi budaya antara bangsa-bangsa di Timur Tengah. Hidangan ini memiliki pengaruh dari berbagai budaya dan masakan, termasuk Arab, Persia, Turki, dan India..',
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
