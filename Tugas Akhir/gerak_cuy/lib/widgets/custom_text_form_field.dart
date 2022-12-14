import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.title,
      required this.margin,
      this.prefix,
      this.validator,
      this.allowInput,
      this.textInputType,
      this.initialvalue,
      this.onTap,
      this.readOnly = false,
      this.obscureText = false,
      required this.controller})
      : super(key: key);

  final String title;
  final TextInputType? textInputType;
  final String hintText;
  final bool obscureText;
  final EdgeInsets margin;
  final bool readOnly;
  final Icon? prefix;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextEditingController controller;
  List<TextInputFormatter>? allowInput;
  final String? initialvalue;

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
            readOnly: readOnly,
            onTap: onTap,
            initialValue: initialvalue,
            validator: validator,
            inputFormatters: allowInput,
            style: blackTextStyle.copyWith(fontSize: 13),
            keyboardType: textInputType,
            controller: controller,
            cursorColor: Colors.black,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: prefix,
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
