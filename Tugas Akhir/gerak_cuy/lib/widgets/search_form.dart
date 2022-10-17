import 'package:flutter/material.dart';

import '../shared/theme.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: blackTextStyle.copyWith(fontSize: 13),
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        hintText: hintText,
        hintStyle: blackTextStyle.copyWith(
          fontSize: 12,
          fontWeight: medium,
        ),
        // prefix: const Icon(Icons.search_outlined),
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
    );
  }
}
