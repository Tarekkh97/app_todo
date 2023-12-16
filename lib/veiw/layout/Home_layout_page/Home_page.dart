// ignore_for_file: must_be_immutable, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/controller/notificationservice.dart';
import 'package:todo_app/controller/service_locator.dart';
import 'package:todo_app/model/sharedpref_helper/sharedpref_helper.dart';
import 'package:todo_app/veiw/pages/done_task_page/Done_task.dart';
import 'package:todo_app/veiw/pages/new_task_page/New_task.dart';
import 'package:todo_app/veiw/style/manager_colors/manager_colors.dart';
import 'package:todo_app/veiw/widget/bigtext.dart';

class Home_page_layout extends StatelessWidget {
  Home_page_layout({super.key});
  List<Widget> pagelay = [
    Newtaskpage(),
    Donetaskpage(),
  ];
  task_control c = Get.put(task_control());
  List<String> titlepsge = ["New Task", "Done Task"];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              await sl<sharedpref_helper>()
                  .savedata(key: "istheme", value: true)
                  .then((value) async {
                c.switchtheme();
                await sl<NotificationService>().sendNotification(
                    title: "Change App Theme",
                    body: c.isdark
                        ? "Dark Mode \u{1F311}"
                        : "Light Mode \u{2600}");
              });
            },
            icon: c.isdark
                ? const Icon(
                    Icons.light_mode_outlined,
                    size: 30,
                  )
                : const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                  ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  c.newtask.isNotEmpty || c.donetask.isNotEmpty
                      ? await c.DeleteAllData().then((value) {
                          sl<NotificationService>().sendNotification(
                              title: "Tasks is Deleted",
                              body: 'No any task now ...');
                        }).catchError((e) {
                          print(e);
                        })
                      : Get.snackbar('Required', 'Operation is falied',
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
                },
                icon: Icon(
                  Icons.delete,
                  size: 30,
                  color: c.newtask.isNotEmpty || c.donetask.isNotEmpty
                      ? Colors.red
                      : Colors.white,
                )),
            SizedBox(
              width: 5.w,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {},
                child: const CircleAvatar(),
              ),
            ),
          ],
          title: Bigtext(text: titlepsge[c.select], coltext: colorstyle.white),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            c.selected(value);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.task_outlined), label: "New Task"),
            BottomNavigationBarItem(
                icon: Icon(Icons.done_outline), label: "Done Task"),
          ],
          currentIndex: c.select,
        ),
        body: pagelay[c.select],
      );
    });
  }
}
