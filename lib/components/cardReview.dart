import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardReview extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String comments;
  final dynamic timeUpload;
  final double rating;
  const CardReview({super.key, 
    required this.imageUrl,
    required this.username,
    required this.comments,
    required this.timeUpload,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedTime =
        (timeUpload is String) ? timeUpload : getTimeAgo(timeUpload);
    return Column(
      children: [
        Row(
          children: [
            Image.asset(imageUrl, width: 50, height: 50),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        username,
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        formattedTime,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  RatingBar.builder(
                    initialRating: rating,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (double value) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          comments,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }

  String getTimeAgo(dynamic timestamp) {
    if (timestamp == null) {
      return 'Unknown time';
    }

    DateTime currentTime = DateTime.now();
    DateTime uploadTime = (timestamp as Timestamp).toDate();

    Duration difference = currentTime.difference(uploadTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      int minutes = difference.inMinutes;
      return '$minutes minute${minutes > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 1) {
      int hours = difference.inHours;
      return '$hours hour${hours > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 7) {
      int days = difference.inDays;
      return '$days day${days > 1 ? 's' : ''} ago';
    } else {
      return uploadTime.toString();
    }
  }
}
