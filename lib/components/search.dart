import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - (2 * 30),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          hintText: 'Cari restoran atau lokasi',
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Image.asset('assets/search.png'),
          ),
          iconColor: blackColor,
        ),
      ),
    );
  }
}
