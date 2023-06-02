import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardResto extends StatelessWidget {
  final String? imageUrl;
  final String restoName;
  final String rate;
  final String distance;

  const CardResto(
      {required this.imageUrl,
      required this.restoName,
      required this.rate,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(imageUrl!, width: 140, height: 120)
            : Image.asset("assets/emptyresto.png", width: 140, height: 120),
        const SizedBox(
          width: 14,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restoName,
              style: blackTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(rate),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Image.asset('assets/locations.png'),
                    Text(distance),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset('assets/price.png')
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset('assets/time_circle.png'),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Buka Sekarang",
                  style: blueTextStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
