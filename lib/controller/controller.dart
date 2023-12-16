// ignore_for_file: camel_case_types, avoid_print, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/service_locator.dart';
import 'package:todo_app/model/Spflite_helper/sqflite_helper.dart';
import 'package:todo_app/model/Task_Model/task_model.dart';

class task_control extends GetxController {
  @override
  void onInit() {
    //  bool istheme = sl<sharedpref_helper>().getdata(key: 'Theme_Mode') ?? false;

    super.onInit();
  }

  TextEditingController titlecont = TextEditingController();

  TextEditingController notecont = TextEditingController();

  TextEditingController datecont = TextEditingController();
  TextEditingController startcontrol = TextEditingController();
  TextEditingController endcontrol = TextEditingController();
  var selecttime;
  var selectdaily;
  int selectcolor = 0;
  int select = 0;
  bool isdark = false;

  DateTime Date = DateTime.now();
  TimeOfDay Time = TimeOfDay.now();
  void selected(value) {
    select = value;
    update();
  }

  void selectedcolor(index) {
    selectcolor = index;
    update();
  }

  void selectedtime(vale) {
    selecttime = vale;
    update();
  }

  void selecteddaily(val) {
    selectdaily = val;
    update();
  }

  void switchtheme() {
    isdark = !isdark;
    update();
  }

  RxList<dynamic> newtask = [].obs;
  RxList<dynamic> donetask = [].obs;

  Future<void> addtask({required TaskModel taskModel}) async {
    await sl<SqlDb>().insertdata(taskModel: taskModel).then((value) {
      sl<SqlDb>().readdata(sl<SqlDb>().database);
    });
  }

  Future<void> delettask({required int id}) async {
    await sl<SqlDb>().deletdata(Id: id).then((value) {
      sl<SqlDb>().readdata(sl<SqlDb>().database);
    });
  }

  Future<void> updatetask({required int Id}) async {
    await sl<SqlDb>().updatedata(Id: Id).then((value) {
      sl<SqlDb>().readdata(sl<SqlDb>().database);
    });
  }

  Future<void> unupdatedata({required int Id}) async {
    await sl<SqlDb>().unupdatedata(Id: Id).then((value) {
      sl<SqlDb>().readdata(sl<SqlDb>().database);
    });
  }

  Future<void> DeleteAllData() async {
    await sl<SqlDb>().deleteAllData().then((value) {
      newtask.clear();
      donetask.clear();
    });
  }
}
