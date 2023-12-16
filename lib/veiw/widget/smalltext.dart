import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Smalltext extends StatelessWidget {
  Smalltext(
      {super.key,
      required this.text,
      this.size = 18,
      this.weight = FontWeight.normal,
      this.coltext = Colors.white,
      this.heitext = 1.0,
      this.space,
      this.textAlign});

  final String text;
  TextAlign? textAlign;
  double size;
  FontWeight weight;
  Color coltext;
  double heitext;
  double? space;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      maxLines: 3,
      text,
      style: GoogleFonts.lato(
          fontSize: size.sp,
          fontWeight: weight,
          color: coltext,
          height: heitext.sp,
          letterSpacing: space),
    );
  }
}
