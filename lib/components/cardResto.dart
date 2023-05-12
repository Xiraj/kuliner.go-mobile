import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardResto extends StatelessWidget {
  final String imageUrl;
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
        Image.network(imageUrl, width: 140, height: 120),
        SizedBox(
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(rate),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Image.asset('assets/locations.png'),
                    Text(distance),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset('assets/price.png')
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset('assets/time_circle.png'),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Buka Sekarang",
                  style: blueTextStyle,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
