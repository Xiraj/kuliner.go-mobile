import 'package:flutter/material.dart';

class ButtonProfile extends StatelessWidget {
  final String icon;
  final String title;
  final List<Widget>? children;

  const ButtonProfile({super.key, required this.icon, required this.title, this.children});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      leading: Image.asset(
        icon,
        height: 24,
        width: 24,
      ),
      title: Text(title),
      children: children ?? [],
    );
  }
}
