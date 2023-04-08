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
                Text(rate),
                SizedBox(
                  width: 20,
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
                Row(
                  children: [
                    Image.asset('assets/location.png'),
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
        Icon(
          Icons.favorite,
          color: Colors.red,
        )
      ],
    );
  }
}
