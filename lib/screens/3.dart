import 'package:chet/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



import '4.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img 3.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
              children: [
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding:  EdgeInsets.only(right:30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/img 4.png",height:32.h,width: 64.w,)
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,right: 25.w),
              child: Text(
                "    这里记录了三万多种人类经历。",
                style: TextStyle(
                  fontFamily: "simsan",
                    color: Colors.black,
                    fontSize: 17.sp,

                  ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,right: 25.w),
              child: Row(
                children: [
                  Text(
                    "在我们物种灭绝之后，",
                    style: TextStyle(
                      fontFamily: "simsan",
                      color: Colors.black,
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      " 这个数据库将成为漂浮在宇宙中的地球文明的基础。",
                      style: TextStyle(
                        fontFamily: "simsan",
                        color: Colors.black,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w),
              child: Row(
                children: [
                  Text(
                    "珍贵纪念品，",
                    style: TextStyle(
                      fontFamily: "simsan",
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ), SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Text(
                    "一键记录人生各种第一次",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontFamily: "simsan",

                       ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 308.76.h,
            ),

          ]),
          Positioned(
            bottom: 0.h,
            left: 0.w,
            child: Container(
              height: 160.h,
              width: MediaQuery.of(context).size.width,padding: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    height: 2.5.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white70),
                  ),
                  SizedBox(height:50.h),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25.w),
                        child: Row(
                          children: [
                            Text(
                              "终于等到你，欢迎来到嘛呢体验社！",
                              style: TextStyle(
                                fontFamily: "simsan",
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {Get.to(login());},
                              child: Container(
                                height: 40.h,
                                width: 120.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xffb797979)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white.withOpacity(0.66)),
                                child: Text('开始体验',style: TextStyle(
                                  fontFamily: "simsan",
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
