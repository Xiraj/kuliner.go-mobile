// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/aneka_nasi_page.dart';

class cardNasiBibimbap extends StatelessWidget {
  const cardNasiBibimbap({super.key});

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
                  'Nasi Bibimbap',
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
            child: Image.asset('assets/nasi_page/5.png'),
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
                    'Nasi Bibimbap',
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
                    'Makanan Khas Korea Selatan',
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
                    child: Image.asset('assets/korean.png'),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: const <Widget>[
              ExpansionTile(
                title: Text('Detail Nasi Bibimbap'),
                leading: Icon(Icons.description_outlined),
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      'Nasi Bibimbap adalah hidangan populer Korea yang terdiri dari nasi putih yang diaduk dengan berbagai sayuran, daging, telur, dan saus pedas. "Bibimbap" secara harfiah berarti "nasi campur" dalam bahasa Korea, mengacu pada cara hidangan ini disajikan dengan berbagai bahan yang diatur di atas nasi.',
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
                title: const Text('Bahan - Bahan Nasi Bibimbap'),
                leading: const Icon(Icons.food_bank),
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bahan-bahan: \n• 2 Gelas beras \n• 2 Gelas air \n• 1 Butir Telur Ayam \n• lobak \n• bayam \n• wortel \n• brokoli \n• jamur  \n• daging sapi \n• Minyak Wijen \n• kacang kedelai \n• Gochujang \n• Bawang Putih dan Bawang Merah',
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
                title: const Text('Langkah Pembuatan Nasi Bibimbap'),
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
                          'Cara membuat: \n• Persiapkan semua bahan: Cuci bersih dan potong sayuran seperti lobak, bayam, wortel, zucchini, brokoli, dan jamur sesuai dengan preferensi Anda. Potong daging sapi, ayam, atau babi menjadi irisan tipis. Siapkan juga telur mentah atau telur setengah matang sesuai selera. \n\n• Persiapan bumbu: Haluskan bawang merah, bawang putih, dan kunyit (jika menggunakan kunyit segar). Anda juga dapat menggunakan bubuk kunyit jika lebih praktis. \n\n• Masak nasi: Masak nasi putih seperti biasa sesuai petunjuk pada kemasan. Pastikan nasi matang dengan tekstur yang lembut namun tetap renyah. Setelah matang, sisihkan nasi dan biarkan dingin sejenak agar lebih mudah diaduk dengan bumbu. \n\n• Tumis daging: Panaskan sedikit minyak dalam wajan. Tumis daging yang telah dipotong dengan bawang putih halus dan sedikit kecap manis atau saus kedelai hingga matang dan beraroma sedap. Sisihkan daging yang sudah matang. \n\n• Tumis sayuran: Dalam wajan yang sama, tambahkan sedikit minyak dan tumis sayuran seperti lobak, bayam, wortel, zucchini, brokoli, dan jamur secara terpisah agar tetap renyah. Anda dapat menambahkan sedikit garam atau saus kedelai untuk memberikan rasa pada sayuran. \n\n• Siapkan telur: Jika menggunakan telur mentah, letakkan kuning telur mentah di atas nasi yang sudah dimasak dalam mangkuk. Jika menggunakan telur setengah matang, goreng telur hingga kuning telur agak setengah matang, dengan kuning telur tetap lembut. \n\n• Susun hidangan: Ambil sebuah mangkuk besar atau wadah saji. Letakkan nasi di dasar mangkuk. Susun sayuran tumis dan daging di atas nasi secara terpisah agar terlihat menarik. Tempatkan telur di tengah hidangan. Anda juga dapat menambahkan bahan tambahan seperti kimchi atau acar sayuran di sampingnya. \n\n• Tambahkan saus: Tuangkan gochujang di atas hidangan atau sajikan terpisah agar setiap orang dapat menyesuaikan tingkat kepedasan sesuai selera. Juga, tambahkan sedikit minyak wijen untuk memberikan aroma khas. \n\n• Aduk dan nikmati: Saat siap disajikan, aduk semua bahan dalam mangkuk secara merata untuk mencampurkan rasa dan tekstur. Pastikan semua bahan tercampur dengan baik dengan nasi dan saus.',
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
                title: const Text('Sejarah Nasi Bibimbap'),
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
                          'Sejarah nasi Bibimbap dapat ditelusuri kembali ke zaman kuno di Korea. Meskipun tidak ada catatan pasti tentang asal-usulnya, hidangan ini telah ada selama berabad-abad dan berkembang menjadi hidangan populer yang disukai oleh masyarakat Korea. \n\n Asal kata "bibimbap" berasal dari bahasa Korea, di mana "bibim" berarti "campur" dan "bap" berarti "nasi". Dalam arti harfiah, Bibimbap berarti "nasi yang dicampur". Hidangan ini mendapatkan namanya karena cara penyajiannya, di mana berbagai bahan diatur di atas nasi dan kemudian diaduk bersama sebelum disantap. \n\n Nasi Bibimbap telah menjadi hidangan yang populer dalam budaya makan Korea. Selama berabad-abad, hidangan ini menjadi pilihan yang umum untuk menyajikan sisa makanan. Dalam tradisi Korea, Bibimbap sering dibuat dengan menggunakan sisa sayuran, daging, atau lauk-pauk lainnya, yang kemudian diolah dan dijadikan hidangan yang enak..',
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
