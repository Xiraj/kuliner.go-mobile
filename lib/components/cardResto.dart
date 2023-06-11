import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class CardResto extends StatelessWidget {
  final String? imageUrl;
  final String restoName;
  final String rate;
  final String distance;
  final Map<String, dynamic> resto;

  CardResto({
    super.key,
    required this.imageUrl,
    required this.restoName,
    required this.rate,
    required this.distance,
    required this.resto,
  });
  DateTime currentTime = DateTime.now();
  late TimeOfDay jamBuka;
  late TimeOfDay jamTutup;

  bool isOpen() {
  if (resto['jamBuka'] == null || resto['jamTutup'] == null) {
    return true;
  }

  try {
    List<String> jamBukaParts = resto['jamBuka'].split(':');
    List<String> jamTutupParts = resto['jamTutup'].split(':');

    int jamBukaHour = int.parse(jamBukaParts[0]);
    int jamBukaMinute = int.parse(jamBukaParts[1]);
    int jamTutupHour = int.parse(jamTutupParts[0]);
    int jamTutupMinute = int.parse(jamTutupParts[1]);

    final currentTime = DateTime.now();
    final current = TimeOfDay.fromDateTime(currentTime);

    DateTime currentDateTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      current.hour,
      current.minute,
    );

    DateTime jamBukaDateTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      jamBukaHour,
      jamBukaMinute,
    );

    DateTime jamTutupDateTime;
    if (jamTutupHour < jamBukaHour) {
      jamTutupDateTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day + 1,
        jamTutupHour,
        jamTutupMinute,
      );
    } else {
      jamTutupDateTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        jamTutupHour,
        jamTutupMinute,
      );
    }

    if (jamTutupHour < jamBukaHour) {
      if (currentDateTime.isBefore(jamBukaDateTime)) {
        currentDateTime = currentDateTime.subtract(const Duration(days: 1));
      }
    }

    return currentDateTime.isAfter(jamBukaDateTime) &&
        currentDateTime.isBefore(jamTutupDateTime);
  } catch (e) {
    print('Error parsing opening and closing times: $e');
    return false;
  }
}


  @override
  Widget build(BuildContext context) {
    bool restaurantOpen = isOpen();
    return Row(
      children: [
        imageUrl!.isNotEmpty
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
                  restaurantOpen ? 'Buka Sekarang' : 'Tutup',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: restaurantOpen ? Colors.blue : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
