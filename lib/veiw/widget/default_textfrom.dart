// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/veiw/style/manager_colors/manager_colors.dart';

// ignore: must_be_immutable
class default_text_from extends StatelessWidget {
  default_text_from({
    super.key,
    required this.hintext,
    this.suficon,
    this.preicon,
    this.label,
    this.control,
    this.keyType,
    this.readonly = false,
  });

  final String hintext;
  String? label;
  IconButton? suficon, preicon;
  TextEditingController? control;
  TextInputType? keyType;
  bool readonly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      autocorrect: false,
      autofocus: false,
      keyboardType: keyType,
      controller: control,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: Get.isDarkMode
                    ? colorstyle.white
                    : colorstyle.darkgrey.withOpacity(0.4),
                width: 1.5.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: Get.isDarkMode
                    ? colorstyle.white
                    : colorstyle.darkgrey.withOpacity(0.4),
                width: 1.5.w),
          ),
          hintText: hintext,
          hintStyle: TextStyle(
              color: Get.isDarkMode ? colorstyle.white : Colors.grey.shade800,
              fontSize: 15.sp),
          suffixIcon: suficon,
          prefixIcon: preicon,
          labelText: label),
    );
  }
}
