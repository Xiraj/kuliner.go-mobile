// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/aneka_nasi_page.dart';

class cardNasiRissoto extends StatelessWidget {
  const cardNasiRissoto({super.key});

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
                  'Nasi Rissoto',
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
            child: Image.asset('assets/nasi_page/6.png'),
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
                    'Nasi Rissoto',
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
                    'Makanan Khas Italia',
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
                    child: Image.asset('assets/italy.png'),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: const <Widget>[
              ExpansionTile(
                title: Text('Detail Nasi Rissoto'),
                leading: Icon(Icons.description_outlined),
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      'Nasi risotto adalah hidangan nasi yang berasal dari Italia. Ini adalah hidangan khas dari daerah Lombardy di Italia utara. Risotto biasanya terbuat dari nasi Arborio, Carnaroli, atau Vialone Nano yang memiliki kandungan pati yang tinggi, yang memberikan tekstur krimi dan konsistensi khas pada hidangan ini.',
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
                title: const Text('Bahan - Bahan Nasi Rissoto'),
                leading: const Icon(Icons.food_bank),
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bahan-bahan: \n• Nasi Arborio \n• Bawang dan Bawang Putih \n• Kaldu: Kaldu ayam, kaldu sayuran, atau kaldu daging \n• Minyak Zaitun dan Mentega \n• Anggur Putih atau Anggur Marsala \n• Keju Parmesan \n• jamur Swiss brown atau jamur porcini \n• asparagus, bayam, atau zucchini \n• daging ayam',
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
                title: const Text('Langkah Pembuatan Nasi Rissoto'),
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
                          'Cara membuat: \n• Panaskan Kaldu: Panaskan kaldu (kaldu ayam, sayuran, atau daging) dalam panci kecil dan biarkan mendidih. Setelah mendidih, kecilkan api agar kaldu tetap hangat. \n• Tumis Bawang dan Bawang Putih: Panaskan sedikit minyak zaitun dan mentega dalam panci besar di atas api sedang. Tumis bawang bombay atau bawang merah yang telah diiris halus hingga lunak dan transparan. Tambahkan bawang putih yang dihaluskan dan tumis sebentar hingga harum. \n• Tambahkan Nasi: Tambahkan nasi Arborio, Carnaroli, atau Vialone Nano ke dalam panci dengan bawang yang ditumis. Aduk rata sehingga nasi terbalut dengan minyak dan mentega. \n• Tambahkan Anggur: Tuangkan anggur putih atau anggur Marsala ke dalam panci dengan nasi. Biarkan anggur mendidih dan biarkan cairannya menguap. Ini akan memberikan rasa yang khas pada risotto. \n• Mulai Menambahkan Kaldu: Tuangkan sekitar setengah cangkir kaldu yang telah dipanaskan ke dalam panci dengan nasi. Aduk secara teratur dengan spatula kayu atau sendok kayu hingga kaldu diserap oleh nasi. Teruskan proses ini dan tambahkan kaldu perlahan-lahan, sekitar setengah cangkir setiap kali, sambil terus mengaduk dan membiarkan nasi menyerap kaldu sebelum menambahkan lagi. Ini memakan waktu sekitar 18-20 menit. \n• Masak Risotto: Lanjutkan proses menambahkan kaldu dan mengaduk hingga nasi mencapai tekstur yang al dente, dengan sedikit gigitan di tengah butiran nasi. Pastikan untuk terus mengaduk risotto selama proses ini untuk memastikan nasi matang merata dan mengeluarkan pati yang memberikan kekentalan pada risotto. \n• Tambahkan Bahan Tambahan: Pada tahap ini, Anda dapat menambahkan bahan tambahan seperti jamur, sayuran, atau daging yang telah dimasak sebelumnya. Aduk rata dengan risotto dan lanjutkan memasak beberapa menit lagi hingga bahan tambahan matang dan terintegrasi dengan baik dalam risotto \n• Tambahkan Keju: Setelah risotto matang, tambahkan keju Parmesan parut dan aduk rata hingga keju meleleh dan menyatu dengan risotto. Keju akan memberikan kelezatan dan konsistensi yang khas pada hidangan \n• Sajikan: Sajikan nasi risotto dalam piring saji atau mangkuk. Anda dapat menambahkan sedikit keju Parmesan parut tambahan di atasnya sebagai hiasan. Risotto paling baik disajikan langsung setelah dimasak, ketika masih panas dan creamy.',
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
                title: const Text('Sejarah Nasi Rissoto'),
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
                          'Nasi risotto memiliki sejarah panjang yang berasal dari Italia, khususnya dari daerah Lombardy di utara Italia. Hidangan ini telah ada selama berabad-abad dan menjadi salah satu hidangan klasik yang terkenal dari masakan Italia. \n\n Asal mula risotto dapat ditelusuri kembali ke masa Romawi kuno, di mana masyarakat menggunakan nasi yang dicampur dengan berbagai bahan seperti daging, sayuran, rempah-rempah, dan makanan laut. Namun, risotto seperti yang kita kenal sekarang baru menjadi populer pada abad ke-19. \n\n Risotto dikembangkan menjadi hidangan khas daerah Lombardy di Italia utara. Daerah ini kaya akan ladang padi yang menghasilkan jenis nasi khusus dengan kandungan pati yang tinggi, seperti nasi Arborio, Carnaroli, atau Vialone Nano. Kandungan pati yang tinggi inilah yang memberikan tekstur krimi dan kekentalan pada risotto. \n\n Pada awalnya, risotto merupakan hidangan masyarakat kelas pekerja dan petani di Lombardy. Hidangan ini terutama dimakan sebagai makanan yang mengenyangkan dan bernutrisi. Risotto menjadi hidangan yang populer karena bahan utamanya yang terjangkau seperti nasi, kaldu, dan bahan tambahan seperti sayuran dan daging..',
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
