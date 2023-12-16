import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/controller/notificationservice.dart';
import 'package:todo_app/controller/service_locator.dart';
import 'package:todo_app/model/Spflite_helper/sqflite_helper.dart';
import 'package:todo_app/model/sharedpref_helper/sharedpref_helper.dart';
import 'package:todo_app/veiw/pages/splash_screen_page/splash_screen.dart';
import 'package:todo_app/veiw/style/manager_theme/manager_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await sl<SqlDb>().creatdatabase();
  await sl<sharedpref_helper>().init();
  await sl<NotificationService>().initialNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    task_control c = Get.put(task_control());
    return ScreenUtilInit(
      designSize: Size(Get.width, Get.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<task_control>(
            init: task_control(),
            builder: (_) {
              return GetMaterialApp(
                theme: apptheme.ligththeme,
                darkTheme: apptheme.darktheme,
                themeMode: c.isdark ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: const Splashscreen(),
              );
            });
      },
    );
  }
}
