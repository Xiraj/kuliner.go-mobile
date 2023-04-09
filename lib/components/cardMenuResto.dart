import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardMenu extends StatelessWidget {
  final String imageUrl;
  final String menuName;
  final String harga;
  const CardMenu(
      {required this.imageUrl, required this.menuName, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imageUrl, width: 90, height: 90),
        SizedBox(
          width: 14,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              menuName,
              style: blackTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  harga,
                  style: blackTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Edit',
                        style:
                            TextStyle(color: Color.fromARGB(255, 2, 189, 98)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
