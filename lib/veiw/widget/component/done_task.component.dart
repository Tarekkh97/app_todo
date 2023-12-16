// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/veiw/style/manager_colors/manager_colors.dart';
import 'package:todo_app/veiw/widget/bigtext.dart';
import 'package:todo_app/veiw/widget/smalltext.dart';
import 'package:todo_app/controller/service_locator.dart';
import 'package:todo_app/controller/notificationservice.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: camel_case_types
class donetaskcomponent extends StatelessWidget {
  const donetaskcomponent({
    super.key,
    required this.ctrl,
  });

  final task_control ctrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: ctrl.donetask.length,
        itemBuilder: (context, i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 1300),
            child: SlideAnimation(
              verticalOffset: 300,
              child: FadeInAnimation(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        BottomSheet(
                          backgroundColor: Get.isDarkMode
                              ? colorstyle.black.withOpacity(0.8)
                              : colorstyle.white.withOpacity(0.8),
                          onClosing: () {},
                          builder: (context) {
                            return SizedBox(
                              height: 200.h,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 48.h,
                                      width: double.infinity.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                colorstyle.primary),
                                        onPressed: () async {
                                          await ctrl
                                              .unupdatedata(
                                                  Id: ctrl.donetask[i]['id'])
                                              .then((value) {
                                            sl<NotificationService>()
                                                .sendNotification(
                                                    title: "Todo Task",
                                                    body: 'status: TODO');
                                          }).catchError((e) {
                                            print(e);
                                          });

                                          Get.back();
                                        },
                                        child: Smalltext(
                                          text: "Todo Task",
                                          coltext: colorstyle.darkgrey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    SizedBox(
                                      height: 48.h,
                                      width: double.infinity.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: colorstyle.pink
                                                .withOpacity(0.8)),
                                        onPressed: () async {
                                          await ctrl
                                              .delettask(
                                                  id: ctrl.donetask[i]['id'])
                                              .then((value) {
                                            sl<NotificationService>()
                                                .sendNotification(
                                                    title: "Delet Task",
                                                    body:
                                                        'status: Delete Successful ');
                                          }).catchError((e) {
                                            print(e);
                                          });
                                          Get.back();
                                        },
                                        child: Smalltext(
                                          text: "Delete Task",
                                          coltext: colorstyle.darkgrey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    SizedBox(
                                      height: 48.h,
                                      width: double.infinity.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                colorstyle.primary),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Smalltext(
                                          text: "Cancel",
                                          coltext: colorstyle.darkgrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      height: 130.h,
                      width: double.infinity.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 8),
                              color: colorstyle.darkheader.withOpacity(0.4),
                              blurRadius: 6)
                        ],
                        color: ctrl.donetask[i]['color'] == 0
                            ? colorstyle.primary
                            : ctrl.donetask[i]['color'] == 1
                                ? colorstyle.pink
                                : ctrl.donetask[i]['color'] == 2
                                    ? colorstyle.yellow
                                    : colorstyle.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Bigtext(
                                  text: "${ctrl.donetask[i]['title']}",
                                  size: 20.sp,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Wrap(
                                  children: [
                                    Icon(
                                      Icons.access_alarm_outlined,
                                      size: 18.sp,
                                      color: colorstyle.white,
                                    ),
                                    Smalltext(
                                      text: ctrl.donetask[i]['starttime'] == ""
                                          ? " ${DateFormat('hh:mm a').format(DateTime.now())} - "
                                          : " ${ctrl.donetask[i]['starttime']} - ",
                                      size: 15.sp,
                                    ),
                                    Smalltext(
                                      text: ctrl.donetask[i]['endtime'] == ""
                                          ? DateFormat('hh:mm a').format(
                                              DateTime.now().add(
                                                  const Duration(minutes: 45)))
                                          : "${ctrl.donetask[i]['endtime']}",
                                      size: 15.sp,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Smalltext(
                                  text: "${ctrl.donetask[i]['note']}",
                                  size: 15.sp,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            width: 1.5.w,
                            height: 100.h,
                            color: colorstyle.white.withOpacity(0.5),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Smalltext(
                              text: ctrl.donetask[i]['iscomplet'] == 0
                                  ? "TODO"
                                  : "COMPLET",
                              size: 16.sp,
                              space: 2.sp,
                              coltext: colorstyle.white.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
