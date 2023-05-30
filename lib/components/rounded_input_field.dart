import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/text_field_container.dart';
import 'package:kuliner_go_mobile/theme.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final double ratioWidth;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final int maxLines;
  final String? initialValue;
  final TextEditingController? controller;
  
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.ratioWidth = 0.9,
    this.icon = Icons.person,
    required this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.initialValue, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      ratioWidth: ratioWidth,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        initialValue: initialValue,
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
        maxLines: maxLines,
      ),
    );
  }
}
