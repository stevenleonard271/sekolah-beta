import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.margin,
      this.obscureText = false,
      required this.controller})
      : super(key: key);

  // final String title;
  final String hintText;
  final bool obscureText;
  final EdgeInsets margin;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: const BorderSide(color: Colors.black)),
            ),
          )
        ],
      ),
    );
  }
}
