import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardReview extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String comments;
  const CardReview(
      {required this.imageUrl, required this.username, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(imageUrl, width: 70, height: 70),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    username,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  RatingBar.builder(
                    initialRating: 4.5,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (double
                        value) {}, // Set ignoreGestures to true to make the widget non-clickable
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            comments,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
