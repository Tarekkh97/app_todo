// ignore_for_file: file_names

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/veiw/pages/creat_task_page/Creat_task.dart';
import 'package:todo_app/veiw/style/manager_colors/manager_colors.dart';
import 'package:todo_app/veiw/widget/bigtext.dart';
import 'package:todo_app/veiw/widget/component/no_task_component.dart';
import 'package:todo_app/veiw/widget/smalltext.dart';
import 'package:todo_app/veiw/widget/component/task_component.dart';

// ignore: must_be_immutable
class Newtaskpage extends StatefulWidget {
  const Newtaskpage({super.key});

  @override
  State<Newtaskpage> createState() => _NewtaskpageState();
}

class _NewtaskpageState extends State<Newtaskpage> {
  task_control ctrl = Get.put(task_control());

  DateTime selectdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Smalltext(
                    text: DateFormat.yMMMMd().format(DateTime.now()),
                    weight: FontWeight.bold,
                    coltext: Get.isDarkMode
                        ? colorstyle.white.withOpacity(0.6)
                        : colorstyle.darkheader.withOpacity(0.4)),
                SizedBox(
                  height: 5.h,
                ),
                Bigtext(
                  text: DateFormat.EEEE().format(DateTime.now()),
                  coltext:
                      Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
                )
              ],
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => creattaskpage(),
                    ));
              },
              color: colorstyle.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: colorstyle.white,
                    size: 15.sp,
                  ),
                  Smalltext(
                    size: 15.sp,
                    text: "Add Task",
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        DatePicker(
          DateTime.now(),
          height: 90.h,
          width: 65.w,
          initialSelectedDate: DateTime.now(),
          selectionColor:
              Get.isDarkMode ? colorstyle.black : colorstyle.primary,
          dayTextStyle: TextStyle(
            color: Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
          ),
          dateTextStyle: TextStyle(
            color: Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
          ),
          monthTextStyle: TextStyle(
            color: Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
          ),
          daysCount: 30,
          onDateChange: (date) {
            setState(() {
              selectdate = date;
              print(selectdate);
            });
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        Obx(() {
          return ctrl.newtask.isNotEmpty
              ? taskcomponent(
                  ctrl: ctrl,
                  selectDate: selectdate,
                )
              : const Notask();
        }),
      ]),
    );
  }
}
