import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardMenu extends StatelessWidget {
  final String imageUrl;
  final String menuName;
  final String desc;
  final int harga;
  final int quantity;

  const CardMenu(
      {super.key, required this.imageUrl,
      required this.menuName,
      required this.desc,
      required this.harga,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(imageUrl, width: 100, height: 100),
        const SizedBox(
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
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Text(
                  desc,
                  overflow: TextOverflow.clip,
                  style: blackTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
              ],
            ),
            Row(
              children: [
                Text(
                  'Rp $harga',
                  style: blackTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Quantity: $quantity',
                  style: blackTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
