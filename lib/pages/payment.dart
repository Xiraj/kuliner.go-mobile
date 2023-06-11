import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/home_bottomnav.dart';

import '../components/rounded_input_field.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  get formKey => null;

  @override
  Widget build(BuildContext context) {
    var currentUser;
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                  padding: const EdgeInsets.only(top: 24, left: 110),
                  child: const Text(
                    'Card',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: Text(
                        'Virtual Card',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(Icons.account_balance_wallet_rounded)
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 260,
                  height: 150,
                  child: Image.asset('assets/card.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'CARDHOLDER NAME',
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 24),
                                child: RoundedInputField(
                                  hintText: "Masukkan nama lengkapmu",
                                  icon: Icons.person_2_rounded,
                                  onChanged: (value) {
                                    var name = value.trim();
                                  },
                                  initialValue: currentUser?.displayName,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'CARD NUMBER',
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 24),
                                child: RoundedInputField(
                                  hintText: "Masukkan nomor kartu",
                                  icon: Icons.wallet_sharp,
                                  onChanged: (value) {
                                    var name = value.trim();
                                  },
                                  initialValue: currentUser?.displayName,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
