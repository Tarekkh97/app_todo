// ignore_for_file: unused_local_variable, avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/model/Task_Model/task_model.dart';

task_control ctrl = Get.put(task_control());

class SqlDb {
  int version = 1;
  Database? database;
  creatdatabase() async {
    database = await openDatabase(
      "todo-app.db",
      version: version,
      onCreate: (database, version) async {
        print("create data===========");

        await database.execute('''
CREATE TABLE Notes (
  id INTEGER PRIMARY KEY,
  title TEXT,
  note TEXT,
  date TEXT,
  starttime TEXT,
  endtime TEXT,
  remind TEXT,
  repeat TEXT,
  color INTEGER,
  iscomplet INTEGER
)
''').then((value) {
          print("table created===========");
        }).catchError((e) {
          print("the Erorr:$e");
        });
      },
      onOpen: (database) async {
        print("database open==========");
        readdata(database).then((value) {});
      },
    );
  }

  Future insertdata({
    required TaskModel taskModel,
  }) async {
    await database!.transaction((txn) async {
      return await txn.rawInsert('''
INSERT INTO Notes(
title, 
note,
date,
starttime,
endtime,
remind,
repeat,
color,
iscomplet)
 VALUES(
  "${taskModel.title}",
  "${taskModel.note}",
  "${taskModel.date}",
  "${taskModel.starttime}",
  "${taskModel.endtime}",
  "${taskModel.remind}",
  "${taskModel.repeat}",
  ${taskModel.color},
  ${taskModel.iscomplet})
''').then((value) {
        print("insert row is done $value");
      }).catchError((e) {
        print("the erorr is $e");
      });
    });
  }

  Future<void> readdata(database) async {
    ctrl.newtask.value = [];
    ctrl.donetask.value = [];
    await database!.rawQuery("SELECT * FROM 'Notes'").then((value) {
      print(ctrl.newtask);
      value.forEach((e) {
        print(e['iscomplet']);
        if (e['iscomplet'] == 0) {
          ctrl.newtask.add(e);
        } else if (e['iscomplet'] == 1) {
          ctrl.donetask.add(e);
        }
      });
    });
  }

  Future updatedata({required int Id}) async {
    await database!.rawUpdate('''
UPDATE Notes
SET iscomplet=?
WHERE id=?
''', [1, Id]).then((value) {
      print("update row number is $value");
    }).catchError((e) {
      print("erorr is $e");
    });
  }

  Future unupdatedata({required int Id}) async {
    await database!.rawUpdate('''
UPDATE Notes
SET iscomplet=?
WHERE id=?
''', [0, Id]).then((value) {
      print("Unupdate row number is $value");
    }).catchError((e) {
      print("erorr is $e");
    });
  }

  Future deletdata({required int Id}) async {
    await database!
        .rawDelete("DELETE FROM 'Notes' WHERE id=?", [Id]).then((value) {
      print("delete row number is $value");
    }).catchError((e) {
      print("erorr is $e");
    });
  }

  Future<int> deleteAllData() async {
    return await database!.delete('Notes');
  }
}
