// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/veiw/widget/component/done_task.component.dart';
import 'package:todo_app/veiw/widget/component/no_task_component.dart';

// ignore: must_be_immutable
class Donetaskpage extends StatelessWidget {
  Donetaskpage({super.key});
  task_control ctrl = Get.put(task_control());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Obx(() {
            return ctrl.donetask.isNotEmpty
                ? donetaskcomponent(
                    ctrl: ctrl,
                  )
                : const Center(child: Notask());
          }),
        ],
      ),
    );
  }
}
