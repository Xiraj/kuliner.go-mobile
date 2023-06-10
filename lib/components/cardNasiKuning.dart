// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/aneka_nasi_page.dart';

class cardNasiKuning extends StatelessWidget {
  const cardNasiKuning({super.key});

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
                  'Nasi Kuning',
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
            child: Image.asset('assets/nasi_page/2.png'),
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
                    'Nasi Kuning',
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
                    'Makanan Khas Indonesia',
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
                title: Text('Detail Nasi Kuning'),
                leading: Icon(Icons.description_outlined),
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      'Nasi kuning adalah salah satu makanan khas Indonesia yang populer dan memiliki peran penting dalam berbagai acara dan perayaan, seperti ulang tahun, pernikahan, atau acara keluarga. Nasi kuning merupakan hidangan nasi yang berwarna kuning kemerahan dan memiliki aroma yang khas. Warna kuning pada nasi kuning biasanya dihasilkan dari bumbu kunyit yang digunakan dalam proses pengolahannya.',
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
                title: const Text('Bahan - Bahan Nasi Kuning'),
                leading: const Icon(Icons.food_bank),
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bahan-bahan: \n• 2 Gelas beras \n• 2 Gelas air \n• 2 Gelas Santan Kelapa \n• 3 Lembar Daun Salam \n• 2 Batang Serai \n• 2-3 Sendok Makan Bumbu Kunyit Halus \n• 3 Buah Bawang Putih dan Merah \n• 1 Sendok Makan Garam  \n• 1 Sendok makan minyak kelapa / minyak sayur',
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
                        'Bahan untuk sambal goreng kentang: \n• Potongan Kentang Kecil Kotak Secukupnya \n• 10 Cabai merah keriting \n• 5 Cabai rawit (sesuai selera pedas) \n• 5 Bawang merah \n• 3 Siung bawang putih \n• 2 Lembar daun jeruk \n• 1 Sendok teh terasi (udang rebon) \n• Gula dan Garam \n• 2 Sendok makan minyak sayur ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Bahan untuk lauk:  \n• 1 Sendok Makan Tempe Orek \n• Bihun Goreng Secukupnya \n• Telur Dadar Gulung Sesuai Selera \n• Mentimun (Jika dirasa perlu)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
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
                title: const Text('Langkah Pembuatan Nasi Kuning'),
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
                          'Cara membuat: \n• Cuci beras: Cuci beras dengan air bersih hingga air cucian menjadi jernih. Tiriskan beras. \n• Persiapan bumbu: Haluskan bawang merah, bawang putih, dan kunyit (jika menggunakan kunyit segar). Anda juga dapat menggunakan bubuk kunyit jika lebih praktis. \n• Tumis bumbu: Panaskan sedikit minyak dalam panci atau wajan, lalu tumis bumbu halus (bawang merah, bawang putih, dan kunyit) bersama dengan serai dan daun salam. Tumis hingga harum dan bumbu matang. \n• Masukkan beras: Setelah bumbu matang, masukkan beras yang telah dicuci ke dalam panci atau wajan. Aduk rata dengan bumbu tumis. \n• Tambahkan santan dan air: Tuangkan santan kelapa ke dalam panci atau wajan. Tambahkan air secukupnya, sesuai dengan takaran memasak nasi yang biasa Anda gunakan. \n• Masak nasi: Masak nasi dengan api sedang hingga air mendidih. Setelah itu, kecilkan api dan tutup panci dengan rapat. Biarkan nasi matang dengan proses pemasakan yang biasa Anda lakukan. \n• Biarkan nasi mengukus: Setelah nasi matang, biarkan nasi mengukus selama beberapa saat dengan panci tetap tertutup. Hal ini akan membantu nasi kuning menjadi lebih pulen dan meresap aroma bumbu. \n• Aduk dan hidangkan: Setelah nasi cukup mengukus, gunakan sendok atau garpu untuk mengaduk nasi kuning agar bumbu dan warna kuning merata. Angkat dan hidangkan nasi kuning dengan pelengkap seperti ayam goreng, telur dadar, tumpeng, serundeng, irisan mentimun, irisan tomat, dan kerupuk.',
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
                title: const Text('Sejarah Nasi Kuning'),
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
                          'Sejarah nasi kuning sebagai hidangan khas Indonesia tidak memiliki catatan yang pasti, tetapi hidangan ini telah menjadi bagian integral dari budaya makan di Indonesia selama berabad-abad. Nasi kuning memiliki akar dalam tradisi kuliner Nusantara yang kaya dan beragam.',
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
