import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/text_field_container.dart';
import 'package:kuliner_go_mobile/theme.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final double ratioWidth;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.ratioWidth = 0.9,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      ratioWidth: ratioWidth,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: altColor,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          icon: Icon(
            icon,
            color: blackColor,
          ),
          hintStyle: const TextStyle(
            color: greyColor,
          ),
          hintText: hintText,
        ),
        style: const TextStyle(
          fontSize: 12.0,
        ),
      )
    );
  }
}
