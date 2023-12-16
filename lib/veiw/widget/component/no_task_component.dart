import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/veiw/style/manager_colors/manager_colors.dart';
import 'package:todo_app/veiw/widget/bigtext.dart';
import 'package:todo_app/veiw/widget/smalltext.dart';

class Notask extends StatelessWidget {
  const Notask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Image.asset("images/task.jpg"),
          SizedBox(
            height: 6.h,
          ),
          Bigtext(
            text: "What do you want to do today?",
            coltext: Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
            size: 23.sp,
          ),
          SizedBox(
            height: 12.h,
          ),
          Smalltext(
            text: "Tap + to add your tasks",
            coltext: Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
          ),
        ],
      ),
    );
  }
}
