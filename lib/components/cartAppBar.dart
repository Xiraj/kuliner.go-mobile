import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/menu_resto.dart';

class CartAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 85),
            child: Text(
              'Keranjangku',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Spacer(),
          Icon(Icons.more_vert_rounded)
        ],
      ),
    );
  }
}
