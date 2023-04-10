import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardBooking extends StatelessWidget {
  final String imageUrl;
  final String bookingCode;
  final String username;
  final String date;
  final String status;
  final Color textColor;
  const CardBooking(
      {required this.imageUrl,
      required this.bookingCode,
      required this.username,
      required this.date,
      required this.status,
      required this.textColor});

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
              bookingCode,
              style: blackTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(username),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                Text(date),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                Text(
                  status,
                  style: TextStyle(color: textColor),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
