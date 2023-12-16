import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo_app/controller/notificationservice.dart';
import 'package:todo_app/controller/service_locator.dart';
import 'package:todo_app/model/sharedpref_helper/sharedpref_helper.dart';
import 'package:todo_app/veiw/layout/Home_layout_page/Home_page.dart';
import 'package:todo_app/veiw/layout/On_boarding_screen/on_boarding_screen.dart';
import 'package:todo_app/veiw/style/manager_colors/manager_colors.dart';
import 'package:todo_app/veiw/widget/bigtext.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void navigat() {
    // bool istheme = sl<sharedpref_helper>().getdata(key: 'istheme') ?? false;
    bool isvisted = sl<sharedpref_helper>().getdata(key: 'onboarding') ?? false;
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  isvisted ? Home_page_layout() : const On_boarding_screen(),
            ));
      },
    );
  }

  @override
  void initState() {
    sl<NotificationService>().sendNotification(
      title: "wellcom",
      body: "Are You Ready start This App",
    );
    navigat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorstyle.primary.withOpacity(0.5),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/logo.jpg",
          ),
          SizedBox(
            height: 6.h,
          ),
          Bigtext(
            text: "UpTodo",
            size: 30.sp,
          ),
          SizedBox(
            height: 15.w,
          ),
          SpinKitHourGlass(
            color: colorstyle.white,
            size: 50.0.sp,
          )
        ],
      )),
    );
  }
}
