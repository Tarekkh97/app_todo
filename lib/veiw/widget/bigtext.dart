import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Bigtext extends StatelessWidget {
  Bigtext({
    super.key,
    required this.text,
    this.size = 25,
    this.weight = FontWeight.bold,
    this.coltext = Colors.white,
  });

  final String text;

  double size;
  FontWeight weight;
  Color coltext;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontSize: size.sp, fontWeight: weight, color: coltext),
    );
  }
}
