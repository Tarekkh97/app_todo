// ignore_for_file: must_be_immutable, camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/controller/notificationservice.dart';
import 'package:todo_app/controller/service_locator.dart';
import 'package:todo_app/model/Model_on_boarding/model_on_boarding.dart';
import 'package:todo_app/model/sharedpref_helper/sharedpref_helper.dart';
import 'package:todo_app/veiw/layout/Home_layout_page/Home_page.dart';
import 'package:todo_app/veiw/style/manager_colors/manager_colors.dart';
import 'package:todo_app/veiw/widget/bigtext.dart';
import 'package:todo_app/veiw/widget/default_elevatedbutton.dart';
import 'package:todo_app/veiw/widget/smalltext.dart';

class On_boarding_screen extends StatefulWidget {
  const On_boarding_screen({super.key});

  @override
  State<On_boarding_screen> createState() => _On_boarding_screenState();
}

class _On_boarding_screenState extends State<On_boarding_screen> {
  PageController pc = PageController();

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorstyle.primary.withOpacity(0.5),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentindex != 2
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                            onPressed: () {
                              pc.jumpToPage(2);
                            },
                            child: Smalltext(
                              text: "Skip",
                            )),
                      )
                    : Container(
                        height: 45.h,
                      ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                      controller: pc,
                      itemCount: onboarding.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(
                              onboarding[index].img,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SmoothPageIndicator(
                              controller: pc,
                              count: onboarding.length,
                              effect: CustomizableEffect(
                                dotDecoration: DotDecoration(
                                  height: 10,
                                  width: 10,
                                  color: colorstyle.white,
                                ),
                                activeDotDecoration: DotDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    rotationAngle: 25,
                                    verticalOffset: 5,
                                    color: colorstyle.primary,
                                    height: 20.h,
                                    width: 25.w),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Bigtext(
                              text: onboarding[index].title,
                              size: 32.sp,
                            ),
                            SizedBox(
                              height: 42.h,
                            ),
                            Smalltext(
                              textAlign: TextAlign.center,
                              text: onboarding[index].subtitle,
                            ),
                          ],
                        );
                      }),
                ),
                Row(
                  children: [
                    currentindex == 0
                        ? Container()
                        : TextButton(
                            onPressed: () {
                              pc.previousPage(
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.bounceOut);
                            },
                            child: Smalltext(
                              text: "Back",
                            )),
                    const Spacer(),
                    currentindex != 2
                        ? defult_elvatedbutton(
                            onpressed: () {
                              pc.nextPage(
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.bounceOut);
                            },
                            text: "Next")
                        : defult_elvatedbutton(
                            onpressed: () async {
                              await sl<sharedpref_helper>()
                                  .savedata(key: 'onboarding', value: true)
                                  .then((value) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home_page_layout(),
                                    ));
                                sl<NotificationService>().sendNotification(
                                    title: "wellcom",
                                    body: "Are You Ready start This App");
                              }).catchError((e) {
                                print("=========");
                                print(e.toString());
                                print("=========");
                              });
                            },
                            text: "Get Started")
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
