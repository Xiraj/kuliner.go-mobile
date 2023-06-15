import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardBooking extends StatelessWidget {
  final String imageUrl;
  final String bookingCode;
  final String username;
  final String date;
  final String time;
  final int people;

  const CardBooking({
    super.key,
    required this.imageUrl,
    required this.bookingCode,
    required this.username,
    required this.date,
    required this.people,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageUrl,
          height: 70,
          width: 70,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bookingCode,
              style: blackTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(username),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(date),
                const SizedBox(
                  width: 4,
                ),
                const Text(','),
                const SizedBox(
                  width: 4,
                ),
                Text(time),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '$people Orang',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
