import 'package:flutter/material.dart';

class cardCategory extends StatelessWidget {
  final String imageCategory;
  final String title;

  const cardCategory({super.key, required this.imageCategory, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Image.asset(imageCategory),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(title)
          ],
        ),
      ],
    );
  }
}
