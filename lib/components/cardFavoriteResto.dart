import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardFavoriteResto extends StatelessWidget {
  final String imageUrl;
  final String restoName;
  final String rate;
  final String distance;
  final String place;

  const CardFavoriteResto(
      {required this.imageUrl,
      required this.restoName,
      required this.rate,
      required this.distance,
      required this.place});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imageUrl),
        SizedBox(
          width: 14,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restoName,
              style: blackTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
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
                SizedBox(
                  width: 20,
                ),
                Text(rate),
                SizedBox(
                  width: 20,
                ),
                Image.asset('assets/price.png'),
                SizedBox(
                  width: 60,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset('assets/locations.png'),
                    Text(distance),
                    SizedBox(
                      width: 10,
                    ),
                    Text(place),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
