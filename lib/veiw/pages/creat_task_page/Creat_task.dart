// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/controller/notificationservice.dart';
import 'package:todo_app/controller/service_locator.dart';
import 'package:todo_app/model/Task_Model/task_model.dart';
import 'package:todo_app/veiw/style/manager_colors/manager_colors.dart';
import 'package:todo_app/veiw/widget/bigtext.dart';
import 'package:todo_app/veiw/widget/default_textfrom.dart';
import 'package:todo_app/veiw/widget/smalltext.dart';

class creattaskpage extends StatelessWidget {
  creattaskpage({super.key});
  task_control ctrl = Get.put(task_control());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<task_control>(
        init: task_control(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                title: Bigtext(text: "Creat Task", coltext: colorstyle.white),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: const AssetImage("images/1.jpg"),
                    ),
                  ),
                ]),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(children: [
                Bigtext(
                  text: 'Add Task',
                  coltext:
                      Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Smalltext(
                  text: "Title",
                  weight: FontWeight.bold,
                  coltext:
                      Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
                ),
                SizedBox(
                  height: 5.h,
                ),
                default_text_from(
                    hintext: "Programming", control: ctrl.titlecont),
                SizedBox(
                  height: 10.h,
                ),
                Smalltext(
                  text: "Note",
                  weight: FontWeight.bold,
                  coltext:
                      Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
                ),
                SizedBox(
                  height: 5.h,
                ),
                default_text_from(
                  hintext: "Learn flutter every time",
                  control: ctrl.notecont,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Smalltext(
                  text: "Date",
                  coltext:
                      Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
                  weight: FontWeight.bold,
                ),
                default_text_from(
                    readonly: true,
                    hintext: DateFormat.yMd().format(ctrl.Date),
                    suficon: IconButton(
                        onPressed: () async {
                          await showDatePicker(
                            context: context,
                            initialDate: ctrl.Date,
                            firstDate: ctrl.Date,
                            lastDate: DateTime(2035),
                          ).then((value) {
                            if (value != null) {
                              ctrl.Date = value;
                              ctrl.datecont.text =
                                  DateFormat.yMd().format(ctrl.Date);
                            } else {
                              print("value ======== $value");
                            }
                          });
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          size: 30.sp,
                        )),
                    keyType: TextInputType.none,
                    control: ctrl.datecont),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Smalltext(
                            text: "Start Time",
                            coltext: Get.isDarkMode
                                ? colorstyle.white
                                : colorstyle.darkgrey,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          default_text_from(
                            readonly: true,
                            keyType: TextInputType.none,
                            control: ctrl.startcontrol,
                            hintext: ctrl.Time.format(context).toString(),
                            suficon: IconButton(
                                onPressed: () async {
                                  await showTimePicker(
                                          context: context,
                                          initialTime: ctrl.Time)
                                      .then((value) {
                                    if (value != null) {
                                      ctrl.Time = value;
                                      ctrl.startcontrol.text =
                                          ctrl.Time.format(context).toString();
                                    } else {
                                      print("value ==== $value");
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.access_time,
                                  size: 30.sp,
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Smalltext(
                            text: "End Time",
                            coltext: Get.isDarkMode
                                ? colorstyle.white
                                : colorstyle.darkgrey,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          default_text_from(
                            readonly: true,
                            control: ctrl.endcontrol,
                            hintext: DateFormat('hh:mm a').format(DateTime.now()
                                .add(const Duration(minutes: 45))),
                            suficon: IconButton(
                                onPressed: () {
                                  showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then((value) {
                                    if (value != null) {
                                      ctrl.Time = value;
                                      ctrl.endcontrol.text =
                                          ctrl.Time.format(context).toString();
                                    } else {
                                      print("value =========$value");
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.access_time,
                                  size: 30.sp,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Smalltext(
                  text: "Remind",
                  coltext:
                      Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Get.isDarkMode
                            ? colorstyle.white
                            : colorstyle.darkgrey.withOpacity(0.4),
                        width: 1.5.w),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      hint: Smalltext(
                        text: "Choose time",
                        size: 15.sp,
                        coltext: Get.isDarkMode
                            ? colorstyle.white
                            : Colors.grey.shade800,
                      ),
                      items: [
                        "5 minutes early",
                        "10 minutes early",
                        "15 minutes early",
                        "30 minutes early",
                        "2 hours early"
                      ]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (vale) {
                        ctrl.selectedtime(vale);
                      },
                      value: ctrl.selecttime),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Smalltext(
                  text: "Repeat",
                  coltext:
                      Get.isDarkMode ? colorstyle.white : colorstyle.darkgrey,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Get.isDarkMode
                            ? colorstyle.white
                            : colorstyle.darkgrey.withOpacity(0.4),
                        width: 1.5.w),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      hint: Smalltext(
                        text: "Choose Repeat",
                        size: 15.sp,
                        coltext: Get.isDarkMode
                            ? colorstyle.white
                            : Colors.grey.shade800,
                      ),
                      items: [
                        "None",
                        "Daily",
                        "Weekly",
                        "Monthly",
                      ]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (val) {
                        ctrl.selecteddaily(val);
                      },
                      value: ctrl.selectdaily),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Smalltext(
                          text: "Color",
                          weight: FontWeight.bold,
                          coltext: Get.isDarkMode
                              ? colorstyle.white
                              : colorstyle.darkgrey,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Wrap(
                            children: List.generate(
                          4,
                          (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1.5),
                              child: InkWell(
                                onTap: () {
                                  ctrl.selectedcolor(index);
                                },
                                child: CircleAvatar(
                                    radius: 15.r,
                                    backgroundColor: index == 0
                                        ? colorstyle.primary
                                        : index == 1
                                            ? colorstyle.pink
                                            : index == 2
                                                ? colorstyle.yellow
                                                : colorstyle.green,
                                    child: ctrl.selectcolor == index
                                        ? Icon(
                                            Icons.done,
                                            color: Get.isDarkMode
                                                ? colorstyle.white
                                                : colorstyle.darkgrey,
                                          )
                                        : Container()),
                              ),
                            );
                          },
                        )),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (ctrl.titlecont.text.isNotEmpty &&
                            ctrl.notecont.text.isNotEmpty) {
                          ctrl
                              .addtask(
                            taskModel: TaskModel(
                                title: ctrl.titlecont.text,
                                note: ctrl.notecont.text,
                                date: ctrl.datecont.text,
                                starttime: ctrl.startcontrol.text,
                                endtime: ctrl.endcontrol.text,
                                remind: ctrl.selecttime,
                                repeat: ctrl.selectdaily,
                                color: ctrl.selectcolor,
                                iscomplet: 0),
                          )
                              .then((value) async {
                            await sl<NotificationService>().sendNotification(
                              title: "New Task: ${ctrl.titlecont.text}",
                              body: ctrl.notecont.text.toString(),
                            );
                          });
                          Navigator.pop(context);
                        } else if (ctrl.titlecont.text.isEmpty ||
                            ctrl.notecont.text.isEmpty) {
                          Get.snackbar(
                              'Required', 'Please enter all data in all forms',
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.blue[900],
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              borderRadius: 15.r,
                              icon: Icon(
                                Icons.nearby_error_rounded,
                                size: 30.r,
                                color: Colors.white,
                              ));
                        }
                      },
                      color: colorstyle.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(15),
                      child: Smalltext(text: "Creat Task"),
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
  }
}
