import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cartAppBar.dart';
import 'package:kuliner_go_mobile/components/cartItemSample.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                CartItemSample(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
