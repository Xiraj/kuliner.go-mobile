import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class cardPopular extends StatelessWidget {
  final String? imagePopular;
  final String restoName;
  final String distance;
  final String time;
  const cardPopular(
      {required this.imagePopular,
      required this.restoName,
      required this.distance,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 290,
        width: 250,
        color: const Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                imagePopular != null && imagePopular!.isNotEmpty
            ? Image.network(imagePopular!, width: 250,
                  height: 185,fit: BoxFit.cover,)
            : Image.asset("assets/emptyresto.png", width: 250,
                  height: 185,fit: BoxFit.cover,),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                        )),
                    child: Center(
                        child: Image.asset(
                      'assets/star.png',
                      width: 22,
                      height: 22,
                    )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restoName,
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/locations.png'),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            distance,
                            style: greyTextStyle,
                          ),
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
                            time,
                            style: greyTextStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
