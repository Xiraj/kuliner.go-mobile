import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:kuliner_go_mobile/pages/home_bottomnav.dart';

class PaymentSucces extends StatefulWidget {
  const PaymentSucces({super.key});

  @override
  State<PaymentSucces> createState() => _PaymentSuccesState();
}

class _PaymentSuccesState extends State<PaymentSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/terompet.png',
                  width: 169,
                  height: 245,
                ),
                const Text(
                  'Yeay!!! Kamu berhasil pesan\ntempat dan makanan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Silahkan periksa kembali detail\npesananmu di riwayat',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 40,
                ),
                RoundedButton(
                  text: 'Kembali ke Beranda',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const homeBottomNav(),
                      ),
                    );
                  },
                  height: 60,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
