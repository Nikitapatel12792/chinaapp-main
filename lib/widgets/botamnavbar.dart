import 'dart:async';
import 'dart:convert';

import 'package:chet/Modal/MessageNotificationModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/19.dart';
import 'package:chet/screens/24.dart';
import 'package:chet/screens/4.dart';
import 'package:chet/screens/8.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

class Bottomnavbar extends StatefulWidget {
      int? sel;

  Bottomnavbar({super.key,this.sel});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}



class _BottomnavbarState extends State<Bottomnavbar> {
  StreamController<MessageNotificationModal?> _notificationStreamController = StreamController<MessageNotificationModal?>.broadcast();

  void startApiCallLoop() async {
    while (true) {
      await Future.delayed(Duration(seconds: 10)); // Adjust the delay as needed
      notificationList();
    }
  }



  @override
  void initState() {
    super.initState();
    startApiCallLoop();
selected =widget.sel;
    // Listen to the stream updates and update the UI
    _notificationStreamController.stream.listen((data) {
      setState(() {
        messagenotificationmodal = data;
      });
    });
  }

  @override
  void dispose() {
    _notificationStreamController.close();
    super.dispose();
  }
  int? selected;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: CircularNotchedRectangle(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {Get.to(Four());
                setState(() {
                  selected = 0;
                });

              },
              child: Container(
                width: 80.w,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),

                color: selected == 0 ? Colors.red.shade900 : Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.telegram,
                      color: selected == 0 ? Colors.white : Colors.red.shade900,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "探索",
                      style: TextStyle(
                          color: selected == 0
                              ? Colors.white
                              : Colors.red.shade900,
                          fontFamily: "Poppins",
                          fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(Eight());
                setState(() {
                  selected = 1;
                });

              },
              child: Container(
                width: 80.w,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),

                color: selected == 1 ? Colors.red.shade900 : Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.travel_explore,
                      color: selected == 1 ? Colors.white : Colors.red.shade900,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "地图",
                      style: TextStyle(
                          color: selected == 1
                              ? Colors.white
                              : Colors.red.shade900,
                          fontFamily: "Poppins",
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {Get.to(Nineteen(
                user: userdata?.userData ?.id ?? "",
              ));
                setState(() {
                  selected = 2;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: 40.h,
                width: 80.w,
                color: selected == 2 ? Colors.red.shade900 : Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.rocket_launch,
                      color: selected == 2 ? Colors.white : Colors.red.shade900,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "我的",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: selected == 2
                              ? Colors.white
                              : Colors.red.shade900,
                          fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {Get.to(TwentyFour());
                setState(() {
                  selected = 3;
                });
                print(selected);
              },
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 12.h),
                width: 80.w,
                color: selected == 3 ? Colors.red.shade900 : Colors.white,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.security_rounded,
                          color: selected == 3 ? Colors.white : Colors.red.shade900,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "账号",
                          style: TextStyle(
                              color: selected == 3
                                  ? Colors.white
                                  : Colors.red.shade900,
                              fontFamily: "Poppins",
                              fontSize: 12.sp),
                        ),


                        // SizedBox(
                        //   width: 10.w,
                        // ),
                      ],
                    ),

                    messagenotificationmodal?.data == 0 ?Container():Positioned(
                      top: 0.h,
                        left: 50.h,
                        child: Icon(Icons.circle,size: 10.sp,color:Color(0xffFFB600))),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void notificationList() {
    final Map<String, String> data = {};
    data['login_user_id'] = userdata?.userData?.id ?? "";

    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().notificationapi(data).then((response) async {
          messagenotificationmodal = MessageNotificationModal.fromJson(json.decode(response.body));
          print(messagenotificationmodal?.status);

          // Update the stream with the new data
          _notificationStreamController.add(messagenotificationmodal);

          if (response.statusCode == 200 && messagenotificationmodal?.status == "success") {
            print("Not");
            print(messagenotificationmodal?.data);
          } else {
            // Handle the error scenario if needed
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

}
