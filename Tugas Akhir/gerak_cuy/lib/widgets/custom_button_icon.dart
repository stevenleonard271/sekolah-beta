import 'package:flutter/material.dart';
import 'package:gerak_cuy/shared/theme.dart';

class CustomButtonwithIcon extends StatelessWidget {
  const CustomButtonwithIcon(
      {super.key,
      required this.title,
      this.titleStyle,
      required this.icon,
      this.width = double.infinity,
      required this.onPressed,
      required this.margin});

  final String title;
  final TextStyle? titleStyle;
  final Icon icon;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: margin,
        width: width,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 10),
              Text(
                title,
                style: titleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
