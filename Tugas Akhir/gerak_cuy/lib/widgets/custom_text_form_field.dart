import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.title,
      required this.margin,
      this.obscureText = false,
      required this.controller})
      : super(key: key);

  final String title;
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
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            style: blackTextStyle.copyWith(fontSize: 13),
            controller: controller,
            cursorColor: Colors.black,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                  borderSide: const BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                  borderSide: BorderSide(color: Colors.blue.shade100)),
            ),
          )
        ],
      ),
    );
  }
}
