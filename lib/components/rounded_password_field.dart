import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/text_field_container.dart';
import 'package:kuliner_go_mobile/theme.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final double ratioWidth;
  const RoundedPasswordField({
    required this.hintText,
    this.ratioWidth = 0.9,
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  // Define a validator function
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      ratioWidth: widget.ratioWidth,
      child: TextFormField(
        onChanged: widget.onChanged,
        obscureText: _obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: altColor,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          icon: const Icon(
            Icons.lock,
            color: blackColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: blackColor,
            ),
          ),
          hintStyle: const TextStyle(
            color: greyColor,
          ),
          hintText: widget.hintText,
        ),
        style: const TextStyle(
          fontSize: 12.0,
        ),

        // Assign the validator function to the validator property
        validator: _validatePassword,
      ),
    );
  }
}