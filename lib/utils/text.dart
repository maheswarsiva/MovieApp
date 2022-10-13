import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  const ModifiedText({
    Key? key,
    required this.text,
    this.color,
    this.size,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'Poppins',
        ));
  }
}
