import 'dart:convert';

import 'package:chet/Modal/Experincemodal.dart';
import 'package:chet/Modal/SelfIdeaModal.dart';
import 'package:chet/Modal/collectionModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/10.dart';
import 'package:chet/screens/14.dart';
import 'package:chet/screens/6.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';


import '7.dart';

class SelfIdeaCreted extends StatefulWidget {
  const SelfIdeaCreted({super.key});

  @override
  State<SelfIdeaCreted> createState() => _SelfIdeaCretedState();
}

class _SelfIdeaCretedState extends State<SelfIdeaCreted> {
  bool isLoading = true;
  int selected = 0;
  int? sel=0;
  int? COLLSEL=0;
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String tdata = DateFormat("HH:mm").format(DateTime.now());
  DateTime _currentday = DateTime.now();

  String? weekdayName;
  String getWeekdayName(DateTime date) {
    // Create an instance of DateFormat with the desired pattern
    DateFormat formatter = DateFormat.EEEE();  // EEEE represents the full weekday name

    // Format the given date to get the weekday name
    String weekdayName = formatter.format(date);

    return weekdayName;
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    idealistap();
    setState(() {
      DateTime currentDate = DateTime.now();
      weekdayName = getWeekdayName(currentDate);
      print("Weekday name: $weekdayName");
    });
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        bottomNavigationBar: Bottomnavbar(sel: 0,),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height:MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft:Radius.circular(30) ),
                        image: DecorationImage(
                            image: AssetImage( 'assets/img5.png',),
                            fit: BoxFit.cover
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(00, 4),
                              blurRadius: 07),
                        ],
                      ),
                      child:  Container(
                        // height: 600.h,
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              Container(
                                padding: EdgeInsets.all(15.w),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15.w),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            "assets/img 4.png",
                                            height: 32.h,
                                            width: 64.w,
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "智能体验推荐",
                                      style: TextStyle(
                                        fontFamily: "simsan",
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "    \"Yo 嘛呢？今天是",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        // Text(
                                        //   "2022年11月5日",

                                        // ),
                                        SizedBox(width: 5.w,),
                                        Text( weekdayName == "Monday"
                                            ? "周一"
                                            : weekdayName == " Tuesday"
                                            ? "周二"
                                            : weekdayName ==
                                            " Wednesday"
                                            ? "周三"
                                            : weekdayName ==
                                            "Thursday"
                                            ? "周四"
                                            : weekdayName ==
                                            "Friday"
                                            ? "星期五"
                                            : weekdayName ==
                                            "Saturday"
                                            ? "周六"
                                            : weekdayName ==
                                            "Sunday"
                                            ? "星期日"
                                            : "".toString(),style: TextStyle(
                                          color: Colors.red.shade900,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                        ),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "$currentDate||$tdata",
                                          style: TextStyle(
                                            color: Colors.red.shade900,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " NASA在1935年的今 ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "天成立。",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "中国北京东城区",
                                          style: TextStyle(
                                            color: Colors.red.shade900,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "目前天气是 ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "小雨",
                                          style: TextStyle(
                                            color: Colors.red.shade900,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "，根据您之前的浏览喜好AI为您推",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "荐以下体验点子 \“",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              selfideamodal?.data?.length == 0?Container(
                                  child:Center(child: Text("20公里范围内没有发现任何想法",style: TextStyle(color: Colors.white),))
                              ):
                              Container(
                                // height: 350.h,
                                  child: Column(
                                      children:[
                                        for(int index=0;index<(selfideamodal?.data?.length ?? 0);index++)...[
                                          index % 2 == 0
                                              ?
                                          Container(
                                            // height: 65.h,
                                            margin: EdgeInsets.only(
                                                right: 15.w,
                                                top: 5.w,
                                                bottom: 5.w),
                                            padding:
                                            EdgeInsets.symmetric(
                                                horizontal: 15.w,
                                                vertical: 10.w),
                                            width:
                                            MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.only(
                                                  topRight:
                                                  Radius.circular(
                                                      20),
                                                  bottomRight:
                                                  Radius.circular(
                                                      20),
                                                ),
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                GestureDetector(
                                                  onTap:(){
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) => Tenth(id:selfideamodal?.data?[index].ideaId ?? ""
                                                            )));
                                                  },
                                                  child: Text(
                                                    selfideamodal
                                                        ?.data?[index]
                                                        .ideaTitle == "" ||  selfideamodal
                                                        ?.data?[index]
                                                        .ideaTitle == null ? "N/A" :   selfideamodal
                                                        ?.data?[index]
                                                        .ideaTitle ??
                                                        "",

                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      "simsan",
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "已体验 : ${selfideamodal?.data?[index].experienceCount} | 已收藏 : ${selfideamodal?.data?[index].collectedCount}",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontSize: 14.sp,
                                                        fontFamily:
                                                        "simsan",
                                                      ),
                                                    ),
                                                    // Row(
                                                    //   mainAxisAlignment:
                                                    //   MainAxisAlignment
                                                    //       .spaceBetween,
                                                    //   children: [
                                                    //     GestureDetector(
                                                    //       onTap:
                                                    //           () {
                                                    //         setState((){
                                                    //           sel =index;
                                                    //         });
                                                    //       },
                                                    //       child: (idealistmodal?.data?[index].buttonExperience.toString() ==
                                                    //           "1")
                                                    //           ? GestureDetector(
                                                    //         onTap:
                                                    //             () {
                                                    //
                                                    //           experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                                                    //         },
                                                    //         child:
                                                    //         Icon(
                                                    //           Icons.check_circle_rounded,
                                                    //           color: Color(0xffbEBEAEA),
                                                    //           size: 20.sp,
                                                    //         ),
                                                    //       )
                                                    //           : GestureDetector(
                                                    //         onTap:
                                                    //             () {
                                                    //           experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                                                    //         },
                                                    //         child:
                                                    //         Icon(
                                                    //           Icons.check_circle_outline,
                                                    //           color: Color(0xffb777777),
                                                    //           size: 20.sp,
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //     SizedBox(
                                                    //       width: 5.w,
                                                    //     ),
                                                    //     GestureDetector(
                                                    //       onTap: (){
                                                    //         setState((){
                                                    //           sel =index;
                                                    //         });
                                                    //         experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                                                    //       },
                                                    //       child: Text(
                                                    //         "已体验",
                                                    //         style:
                                                    //         TextStyle(
                                                    //           color: Color(
                                                    //               0xffbA8A8A8),
                                                    //           fontSize:
                                                    //           14.sp,
                                                    //           fontFamily:
                                                    //           "simsan",
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //     SizedBox(
                                                    //       width: 5.w,
                                                    //     ),
                                                    //     GestureDetector(
                                                    //         onTap:
                                                    //             () {
                                                    //           setState((){
                                                    //             COLLSEL =index;
                                                    //           });
                                                    //         },
                                                    //         child: idealistmodal?.data?[index].buttonCollected ==
                                                    //             "1"
                                                    //             ? GestureDetector(
                                                    //           onTap:
                                                    //               () {
                                                    //             collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                                    //           },
                                                    //           child:
                                                    //           Icon(
                                                    //             Icons.favorite,
                                                    //             color: Color(0xffbD05454),
                                                    //           ),
                                                    //         )
                                                    //             : GestureDetector(
                                                    //           onTap:
                                                    //               () {
                                                    //             collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                                    //           },
                                                    //           child:
                                                    //           Icon(
                                                    //             Icons.favorite_border,
                                                    //             color: Color(0xffb777777),
                                                    //           ),
                                                    //         )),
                                                    //     SizedBox(
                                                    //       width: 5.w,
                                                    //     ),
                                                    //     GestureDetector(
                                                    //       onTap: (){
                                                    //         setState((){
                                                    //           COLLSEL =index;
                                                    //         });
                                                    //         collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                                    //       } ,
                                                    //       child: Text(
                                                    //         "收藏",
                                                    //         style:
                                                    //         TextStyle(
                                                    //           color: Color(
                                                    //               0xffbA8A8A8),
                                                    //           fontSize:
                                                    //           14.sp,
                                                    //           fontFamily:
                                                    //           "simsan",
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                              : Container(

                                            // height: 65.h,
                                            margin: EdgeInsets.only(
                                                left: 15.w),
                                            padding:
                                            EdgeInsets.symmetric(
                                                horizontal: 15.w,
                                                vertical: 10.w),
                                            width:
                                            MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.only(
                                                  topLeft:
                                                  Radius.circular(
                                                      20),
                                                  bottomLeft:
                                                  Radius.circular(
                                                      20),
                                                ),
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                GestureDetector(
                                                  onTap:(){
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) => Tenth(id:selfideamodal?.data?[index].ideaId ?? ""
                                                            )));
                                                  },
                                                  child: Text(
                                                    selfideamodal
                                                        ?.data?[index]
                                                        .ideaTitle == "" ||  selfideamodal
                                                        ?.data?[index]
                                                        .ideaTitle == null ? "N/A" :   selfideamodal
                                                        ?.data?[index]
                                                        .ideaTitle ??
                                                        "",

                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      "simsan",
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "已体验 : ${selfideamodal?.data?[index].experienceCount} | 已收藏 : ${selfideamodal?.data?[index].collectedCount}",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontSize: 14.sp,
                                                        fontFamily:
                                                        "simsan",
                                                      ),
                                                    ),
                                                    // Row(
                                                    //   mainAxisAlignment:
                                                    //   MainAxisAlignment
                                                    //       .spaceBetween,
                                                    //   children: [
                                                    //     GestureDetector(
                                                    //       onTap:
                                                    //           () {
                                                    //         setState((){
                                                    //           sel =index;
                                                    //         });
                                                    //       },
                                                    //       child: (idealistmodal?.data?[index].buttonExperience.toString() ==
                                                    //           "1")
                                                    //           ? GestureDetector(
                                                    //         onTap:
                                                    //             () {
                                                    //
                                                    //           experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                                                    //         },
                                                    //         child:
                                                    //         Icon(
                                                    //           Icons.check_circle_rounded,
                                                    //           color: Color(0xffbEBEAEA),
                                                    //           size: 20.sp,
                                                    //         ),
                                                    //       )
                                                    //           : GestureDetector(
                                                    //         onTap:
                                                    //             () {
                                                    //           experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                                                    //         },
                                                    //         child:
                                                    //         Icon(
                                                    //           Icons.check_circle_outline,
                                                    //           color: Color(0xffb777777),
                                                    //           size: 20.sp,
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //     SizedBox(
                                                    //       width: 5.w,
                                                    //     ),
                                                    //     GestureDetector(
                                                    //       onTap: (){
                                                    //         setState((){
                                                    //           sel =index;
                                                    //         });
                                                    //         experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                                                    //       },
                                                    //       child: Text(
                                                    //         "已体验",
                                                    //         style:
                                                    //         TextStyle(
                                                    //           color: Color(
                                                    //               0xffbA8A8A8),
                                                    //           fontSize:
                                                    //           14.sp,
                                                    //           fontFamily:
                                                    //           "simsan",
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //     SizedBox(
                                                    //       width: 5.w,
                                                    //     ),
                                                    //     GestureDetector(
                                                    //         onTap:
                                                    //             () {
                                                    //           setState((){
                                                    //             COLLSEL =index;
                                                    //           });
                                                    //         },
                                                    //         child: idealistmodal?.data?[index].buttonCollected ==
                                                    //             "1"
                                                    //             ? GestureDetector(
                                                    //           onTap:
                                                    //               () {
                                                    //             collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                                    //           },
                                                    //           child:
                                                    //           Icon(
                                                    //             Icons.favorite,
                                                    //             color: Color(0xffbD05454),
                                                    //           ),
                                                    //         )
                                                    //             : GestureDetector(
                                                    //           onTap:
                                                    //               () {
                                                    //             collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                                    //           },
                                                    //           child:
                                                    //           Icon(
                                                    //             Icons.favorite_border,
                                                    //             color: Color(0xffb777777),
                                                    //           ),
                                                    //         )),
                                                    //     SizedBox(
                                                    //       width: 5.w,
                                                    //     ),
                                                    //     GestureDetector(
                                                    //       onTap: (){
                                                    //         setState((){
                                                    //           COLLSEL =index;
                                                    //         });
                                                    //         collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                                    //       } ,
                                                    //       child: Text(
                                                    //         "收藏",
                                                    //         style:
                                                    //         TextStyle(
                                                    //           color: Color(
                                                    //               0xffbA8A8A8),
                                                    //           fontSize:
                                                    //           14.sp,
                                                    //           fontFamily:
                                                    //           "simsan",
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ]
                                      ]
                                  )


                                // ListView.builder(
                                //     padding: EdgeInsets.zero,
                                //     physics: ScrollPhysics(),
                                //     itemCount: idealistmodal?.data?.length,
                                //     shrinkWrap: true,
                                //     scrollDirection: Axis.vertical,
                                //     itemBuilder: (context, index) {
                                //       return index % 2 == 0
                                //           ? Container(
                                //             // height: 65.h,
                                //             margin: EdgeInsets.only(
                                //                 right: 15.w,
                                //                 top: 5.w,
                                //                 bottom: 5.w),
                                //             padding:
                                //                 EdgeInsets.symmetric(
                                //                     horizontal: 15.w,
                                //                     vertical: 10.w),
                                //             width:
                                //                 MediaQuery.of(context)
                                //                     .size
                                //                     .width,
                                //             decoration: BoxDecoration(
                                //                 borderRadius:
                                //                     BorderRadius.only(
                                //                   topRight:
                                //                       Radius.circular(
                                //                           20),
                                //                   bottomRight:
                                //                       Radius.circular(
                                //                           20),
                                //                 ),
                                //                 color: Colors.black
                                //                     .withOpacity(0.5)),
                                //             child: Column(
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment
                                //                       .start,
                                //               children: [
                                //                 GestureDetector(
                                //                   onTap:(){
                                //                     Navigator.of(context).push(
                                //                         MaterialPageRoute(
                                //                             builder: (context) => Tenth(id:idealistmodal?.data?[index].ideaId ?? ""
                                //                             )));
                                //                   },
                                //                   child: Text(
                                //                     idealistmodal
                                //                         ?.data?[index]
                                //                         .ideaName == "" || idealistmodal
                                //                         ?.data?[index]
                                //                         .ideaName == null ? "N/A" : idealistmodal
                                //                             ?.data?[index]
                                //                             .ideaName ??
                                //                         "",
                                //
                                //                     style: TextStyle(
                                //                       color: Colors.white,
                                //                       fontSize: 17.sp,
                                //                       fontWeight:
                                //                           FontWeight.bold,
                                //                       fontFamily:
                                //                           "simsan",
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   height: 8.h,
                                //                 ),
                                //                 Row(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment
                                //                           .spaceBetween,
                                //                   children: [
                                //                     Text(
                                //                       "已体验 : ${idealistmodal?.data?[index].noOfExperience} | 已收藏 : ${idealistmodal?.data?[index].noOfCollection}",
                                //                       style: TextStyle(
                                //                         color: Colors
                                //                             .white,
                                //                         fontSize: 14.sp,
                                //                         fontFamily:
                                //                             "simsan",
                                //                       ),
                                //                     ),
                                //                     Row(
                                //                       mainAxisAlignment:
                                //                           MainAxisAlignment
                                //                               .spaceBetween,
                                //                       children: [
                                //                         GestureDetector(
                                //                             onTap:
                                //                                 () {
                                //                                   setState((){
                                //                                     sel =index;
                                //                                   });
                                //                                 },
                                //                             child: (idealistmodal?.data?[index].buttonExperience.toString() ==
                                //                                     "1")
                                //                                 ? GestureDetector(
                                //                                     onTap:
                                //                                         () {
                                //
                                //                                       experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                                //                                     },
                                //                                     child:
                                //                                         Icon(
                                //                                       Icons.check_circle_rounded,
                                //                                       color: Color(0xffbEBEAEA),
                                //                                       size: 20.sp,
                                //                                     ),
                                //                                   )
                                //                                 : GestureDetector(
                                //                                     onTap:
                                //                                         () {
                                //                                       experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                                //                                     },
                                //                                     child:
                                //                                         Icon(
                                //                                       Icons.check_circle_outline,
                                //                                       color: Color(0xffb777777),
                                //                                       size: 20.sp,
                                //                                     ),
                                //                                   ),
                                //                         ),
                                //                         SizedBox(
                                //                           width: 5.w,
                                //                         ),
                                //                         GestureDetector(
                                //                           onTap: (){
                                //                             setState((){
                                //                               sel =index;
                                //                             });
                                //                             experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                                //                           },
                                //                           child: Text(
                                //                             "已体验",
                                //                             style:
                                //                                 TextStyle(
                                //                               color: Color(
                                //                                   0xffbA8A8A8),
                                //                               fontSize:
                                //                                   14.sp,
                                //                               fontFamily:
                                //                                   "simsan",
                                //                             ),
                                //                           ),
                                //                         ),
                                //                         SizedBox(
                                //                           width: 5.w,
                                //                         ),
                                //                         GestureDetector(
                                //                             onTap:
                                //                                 () {
                                //                                   setState((){
                                //                                     COLLSEL =index;
                                //                                   });
                                //                                 },
                                //                             child: idealistmodal?.data?[index].buttonCollected ==
                                //                                     "1"
                                //                                 ? GestureDetector(
                                //                                     onTap:
                                //                                         () {
                                //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                //                                     },
                                //                                     child:
                                //                                         Icon(
                                //                                       Icons.favorite,
                                //                                       color: Color(0xffbD05454),
                                //                                     ),
                                //                                   )
                                //                                 : GestureDetector(
                                //                                     onTap:
                                //                                         () {
                                //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                //                                     },
                                //                                     child:
                                //                                         Icon(
                                //                                       Icons.favorite_border,
                                //                                       color: Color(0xffb777777),
                                //                                     ),
                                //                                   )),
                                //                         SizedBox(
                                //                           width: 5.w,
                                //                         ),
                                //                         GestureDetector(
                                //                          onTap: (){
                                //                            setState((){
                                //                              COLLSEL =index;
                                //                            });
                                //                            collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                //                          } ,
                                //                           child: Text(
                                //                             "收藏",
                                //                             style:
                                //                                 TextStyle(
                                //                               color: Color(
                                //                                   0xffbA8A8A8),
                                //                               fontSize:
                                //                                   14.sp,
                                //                               fontFamily:
                                //                                   "simsan",
                                //                             ),
                                //                           ),
                                //                         ),
                                //                       ],
                                //                     )
                                //                   ],
                                //                 )
                                //               ],
                                //             ),
                                //           )
                                //           : Container(
                                //
                                //             // height: 65.h,
                                //             margin: EdgeInsets.only(
                                //                 left: 15.w),
                                //             padding:
                                //                 EdgeInsets.symmetric(
                                //                     horizontal: 15.w,
                                //                     vertical: 10.w),
                                //             width:
                                //                 MediaQuery.of(context)
                                //                     .size
                                //                     .width,
                                //             decoration: BoxDecoration(
                                //                 borderRadius:
                                //                     BorderRadius.only(
                                //                   topLeft:
                                //                       Radius.circular(
                                //                           20),
                                //                   bottomLeft:
                                //                       Radius.circular(
                                //                           20),
                                //                 ),
                                //                 color: Colors.black
                                //                     .withOpacity(0.5)),
                                //             child: Column(
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment
                                //                       .start,
                                //               children: [
                                //                 GestureDetector(
                                //                   onTap:(){
                                //                     Navigator.of(context).push(
                                //                         MaterialPageRoute(
                                //                             builder: (context) => Tenth(id:idealistmodal?.data?[index].ideaId ?? ""
                                //                             )));
                                //                 },
                                //                   child: Text(
                                //                     idealistmodal
                                //                         ?.data?[index]
                                //                         .ideaName == "" || idealistmodal
                                //                         ?.data?[index]
                                //                         .ideaName == null ? "N/A" : idealistmodal
                                //                         ?.data?[index]
                                //                         .ideaName ??
                                //                         "",
                                //
                                //                     style: TextStyle(
                                //                       fontFamily:
                                //                           "simsan",
                                //                       color: Colors.white,
                                //                       fontSize: 17.sp,
                                //                       fontWeight:
                                //                           FontWeight.bold,
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   height: 5.h,
                                //                 ),
                                //                 Row(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment
                                //                           .spaceBetween,
                                //                   children: [
                                //                     Text(
                                //                       "已体验 ：" +
                                //                           (idealistmodal
                                //                                   ?.data?[
                                //                                       index]
                                //                                   .noOfExperience)
                                //                               .toString() +
                                //                           " | 已收藏 ：" +
                                //                           (idealistmodal
                                //                                   ?.data?[
                                //                                       index]
                                //                                   .noOfCollection)
                                //                               .toString(),
                                //                       style: TextStyle(
                                //                         color: Colors
                                //                             .white,
                                //                         fontSize: 14.sp,
                                //                         fontFamily:
                                //                             "simsan",
                                //                       ),
                                //                     ),
                                //                     Row(
                                //                       mainAxisAlignment:
                                //                           MainAxisAlignment
                                //                               .spaceBetween,
                                //                       children: [
                                //                         GestureDetector(
                                //                             onTap: () {
                                //
                                //                               experincebuttonap(
                                //                                   idealistmodal?.data?[index].ideaId ??
                                //                                       "");
                                //                             },
                                //                             child: ((idealistmodal?.data?[index].buttonExperience).toString() ==
                                //                                     "1")
                                //                                 ? Icon(
                                //                                     Icons.check_circle_rounded,
                                //                                     color:
                                //                                         Color(0xffbEBEAEA),
                                //                                     size:
                                //                                         20.sp,
                                //                                   )
                                //                                 : Icon(
                                //                                     Icons.check_circle_outline,
                                //                                     color:
                                //                                         Color(0xffb777777),
                                //                                     size:
                                //                                         20.sp,
                                //                                   )),
                                //                         SizedBox(
                                //                           width: 5.w,
                                //                         ),
                                //                         GestureDetector(
                                //                           onTap: (){
                                //                             experincebuttonap(
                                //                                 idealistmodal?.data?[index].ideaId ??
                                //                                     "");
                                //                           },
                                //                           child: Text(
                                //                             "已体验",
                                //                             style:
                                //                                 TextStyle(
                                //                               color: Color(
                                //                                   0xffbA8A8A8),
                                //                               fontSize:
                                //                                   14.sp,
                                //                               fontFamily:
                                //                                   "simsan",
                                //                             ),
                                //                           ),
                                //                         ),
                                //                         SizedBox(
                                //                           width: 5.w,
                                //                         ),
                                //                         GestureDetector(
                                //                             onTap:
                                //                                 () {},
                                //                             child: (idealistmodal?.data?[index].buttonCollected) ==
                                //                                     "1"
                                //                                 ? GestureDetector(
                                //                                     onTap:
                                //                                         () {
                                //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                //                                     },
                                //                                     child:
                                //                                         Icon(
                                //                                       Icons.favorite,
                                //                                       color: Color(0xffbD05454),
                                //                                     ),
                                //                                   )
                                //                                 : GestureDetector(
                                //                                     onTap:
                                //                                         () {
                                //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                //                                     },
                                //                                     child:
                                //                                         Icon(
                                //                                       Icons.favorite_border,
                                //                                       color: Color(0xffb777777),
                                //                                     ),
                                //                                   )),
                                //                         SizedBox(
                                //                           width: 5.w,
                                //                         ),
                                //                         GestureDetector(
                                //                           onTap: (){
                                //                             collectedbuttonap(idealistmodal?.data?[index].ideaId);
                                //                           },
                                //                           child: Text(
                                //                             "收藏",
                                //                             style:
                                //                                 TextStyle(
                                //                               color: Color(
                                //                                   0xffbA8A8A8),
                                //                               fontSize:
                                //                                   14.sp,
                                //                               fontFamily:
                                //                                   "simsan",
                                //                             ),
                                //                           ),
                                //                         ),
                                //                       ],
                                //                     )
                                //                   ],
                                //                 )
                                //               ],
                                //             ),
                                //           );
                                //     }),
                              ),
                              SizedBox(height:30.h)
                            ]),
                      ),

                      // ClipRRect(
                      //   borderRadius: BorderRadius.only(
                      //       bottomLeft: Radius.circular(40),
                      //       bottomRight: Radius.circular(40)),
                      //   child: Image.asset(
                      //     'assets/img5.png',
                      //     fit: BoxFit.cover,
                      //     height: 1050.h,
                      //     width: MediaQuery.of(context).size.width,
                      //   ),
                      // ),
                    ),
                    // Container(
                    //   // height: 600.h,
                    //   // height: MediaQuery.of(context).size.height,
                    //   width: MediaQuery.of(context).size.width,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //   ),
                    //   child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         SizedBox(
                    //           height: 40.h,
                    //         ),
                    //         Container(
                    //           padding: EdgeInsets.all(15.w),
                    //           child: Column(
                    //             crossAxisAlignment:
                    //             CrossAxisAlignment.start,
                    //             children: [
                    //               Padding(
                    //                 padding: EdgeInsets.all(15.w),
                    //                 child: Row(
                    //                   mainAxisAlignment:
                    //                   MainAxisAlignment.end,
                    //                   children: [
                    //                     Image.asset(
                    //                       "assets/img 4.png",
                    //                       height: 32.h,
                    //                       width: 64.w,
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //               Text(
                    //                 "智能体验推荐",
                    //                 style: TextStyle(
                    //                   fontFamily: "simsan",
                    //                   color: Colors.white,
                    //                   fontSize: 20.sp,
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 height: 10.h,
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     "    \"Yo 嘛呢？今天是",
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 14.sp,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ),
                    //                   // Text(
                    //                   //   "2022年11月5日",
                    //
                    //                   // ),
                    //                   SizedBox(width: 5.w,),
                    //                   Text(weekdayName.toString(),style: TextStyle(
                    //                     color: Colors.red.shade900,
                    //                     fontSize: 17.sp,
                    //                     fontWeight: FontWeight.bold,
                    //                   ),),
                    //
                    //                 ],
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     "$currentDate||$tdata",
                    //                     style: TextStyle(
                    //                       color: Colors.red.shade900,
                    //                       fontSize: 17.sp,
                    //                       fontWeight: FontWeight.bold,
                    //                     ),
                    //                   ),
                    //                   Text(
                    //                     " NASA在1935年的今 ",
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 14.sp,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     "天成立。",
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 14.sp,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ),
                    //                   Text(
                    //                     "中国北京东城区",
                    //                     style: TextStyle(
                    //                       color: Colors.red.shade900,
                    //                       fontSize: 17.sp,
                    //                       fontWeight: FontWeight.bold,
                    //                     ),
                    //                   ),
                    //                   Text(
                    //                     "目前天气是 ",
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 14.sp,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     "小雨",
                    //                     style: TextStyle(
                    //                       color: Colors.red.shade900,
                    //                       fontSize: 17.sp,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ),
                    //                   Text(
                    //                     "，根据您之前的浏览喜好AI为您推",
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 14.sp,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     "荐以下体验点子 \“",
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 14.sp,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 20.h,
                    //         ),
                    //         idealistmodal?.data?.length == 0?Container(
                    //             child:Center(child: Text("20公里范围内没有发现任何想法",style: TextStyle(color: Colors.white),))
                    //         ):
                    //         Container(
                    //           // height: 350.h,
                    //             child: Column(
                    //                 children:[
                    //                   for(int index=0;index<(idealistmodal?.data?.length ?? 0);index++)...[
                    //                     index % 2 == 0
                    //                         ? Container(
                    //                       // height: 65.h,
                    //                       margin: EdgeInsets.only(
                    //                           right: 15.w,
                    //                           top: 5.w,
                    //                           bottom: 5.w),
                    //                       padding:
                    //                       EdgeInsets.symmetric(
                    //                           horizontal: 15.w,
                    //                           vertical: 10.w),
                    //                       width:
                    //                       MediaQuery.of(context)
                    //                           .size
                    //                           .width,
                    //                       decoration: BoxDecoration(
                    //                           borderRadius:
                    //                           BorderRadius.only(
                    //                             topRight:
                    //                             Radius.circular(
                    //                                 20),
                    //                             bottomRight:
                    //                             Radius.circular(
                    //                                 20),
                    //                           ),
                    //                           color: Colors.black
                    //                               .withOpacity(0.5)),
                    //                       child: Column(
                    //                         crossAxisAlignment:
                    //                         CrossAxisAlignment
                    //                             .start,
                    //                         children: [
                    //                           GestureDetector(
                    //                             onTap:(){
                    //                               Navigator.of(context).push(
                    //                                   MaterialPageRoute(
                    //                                       builder: (context) => Tenth(id:idealistmodal?.data?[index].ideaId ?? ""
                    //                                       )));
                    //                             },
                    //                             child: Text(
                    //                               idealistmodal
                    //                                   ?.data?[index]
                    //                                   .ideaName == "" || idealistmodal
                    //                                   ?.data?[index]
                    //                                   .ideaName == null ? "N/A" : idealistmodal
                    //                                   ?.data?[index]
                    //                                   .ideaName ??
                    //                                   "",
                    //
                    //                               style: TextStyle(
                    //                                 color: Colors.white,
                    //                                 fontSize: 17.sp,
                    //                                 fontWeight:
                    //                                 FontWeight.bold,
                    //                                 fontFamily:
                    //                                 "simsan",
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           SizedBox(
                    //                             height: 8.h,
                    //                           ),
                    //                           Row(
                    //                             mainAxisAlignment:
                    //                             MainAxisAlignment
                    //                                 .spaceBetween,
                    //                             children: [
                    //                               Text(
                    //                                 "已体验 : ${idealistmodal?.data?[index].noOfExperience} | 已收藏 : ${idealistmodal?.data?[index].noOfCollection}",
                    //                                 style: TextStyle(
                    //                                   color: Colors
                    //                                       .white,
                    //                                   fontSize: 14.sp,
                    //                                   fontFamily:
                    //                                   "simsan",
                    //                                 ),
                    //                               ),
                    //                               Row(
                    //                                 mainAxisAlignment:
                    //                                 MainAxisAlignment
                    //                                     .spaceBetween,
                    //                                 children: [
                    //                                   GestureDetector(
                    //                                     onTap:
                    //                                         () {
                    //                                       setState((){
                    //                                         sel =index;
                    //                                       });
                    //                                     },
                    //                                     child: (idealistmodal?.data?[index].buttonExperience.toString() ==
                    //                                         "1")
                    //                                         ? GestureDetector(
                    //                                       onTap:
                    //                                           () {
                    //
                    //                                         experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                    //                                       },
                    //                                       child:
                    //                                       Icon(
                    //                                         Icons.check_circle_rounded,
                    //                                         color: Color(0xffbEBEAEA),
                    //                                         size: 20.sp,
                    //                                       ),
                    //                                     )
                    //                                         : GestureDetector(
                    //                                       onTap:
                    //                                           () {
                    //                                         experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                    //                                       },
                    //                                       child:
                    //                                       Icon(
                    //                                         Icons.check_circle_outline,
                    //                                         color: Color(0xffb777777),
                    //                                         size: 20.sp,
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width: 5.w,
                    //                                   ),
                    //                                   GestureDetector(
                    //                                     onTap: (){
                    //                                       setState((){
                    //                                         sel =index;
                    //                                       });
                    //                                       experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                    //                                     },
                    //                                     child: Text(
                    //                                       "已体验",
                    //                                       style:
                    //                                       TextStyle(
                    //                                         color: Color(
                    //                                             0xffbA8A8A8),
                    //                                         fontSize:
                    //                                         14.sp,
                    //                                         fontFamily:
                    //                                         "simsan",
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width: 5.w,
                    //                                   ),
                    //                                   GestureDetector(
                    //                                       onTap:
                    //                                           () {
                    //                                         setState((){
                    //                                           COLLSEL =index;
                    //                                         });
                    //                                       },
                    //                                       child: idealistmodal?.data?[index].buttonCollected ==
                    //                                           "1"
                    //                                           ? GestureDetector(
                    //                                         onTap:
                    //                                             () {
                    //                                           collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //                                         },
                    //                                         child:
                    //                                         Icon(
                    //                                           Icons.favorite,
                    //                                           color: Color(0xffbD05454),
                    //                                         ),
                    //                                       )
                    //                                           : GestureDetector(
                    //                                         onTap:
                    //                                             () {
                    //                                           collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //                                         },
                    //                                         child:
                    //                                         Icon(
                    //                                           Icons.favorite_border,
                    //                                           color: Color(0xffb777777),
                    //                                         ),
                    //                                       )),
                    //                                   SizedBox(
                    //                                     width: 5.w,
                    //                                   ),
                    //                                   GestureDetector(
                    //                                     onTap: (){
                    //                                       setState((){
                    //                                         COLLSEL =index;
                    //                                       });
                    //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //                                     } ,
                    //                                     child: Text(
                    //                                       "收藏",
                    //                                       style:
                    //                                       TextStyle(
                    //                                         color: Color(
                    //                                             0xffbA8A8A8),
                    //                                         fontSize:
                    //                                         14.sp,
                    //                                         fontFamily:
                    //                                         "simsan",
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               )
                    //                             ],
                    //                           )
                    //                         ],
                    //                       ),
                    //                     )
                    //                         : Container(
                    //
                    //                       // height: 65.h,
                    //                       margin: EdgeInsets.only(
                    //                           left: 15.w),
                    //                       padding:
                    //                       EdgeInsets.symmetric(
                    //                           horizontal: 15.w,
                    //                           vertical: 10.w),
                    //                       width:
                    //                       MediaQuery.of(context)
                    //                           .size
                    //                           .width,
                    //                       decoration: BoxDecoration(
                    //                           borderRadius:
                    //                           BorderRadius.only(
                    //                             topLeft:
                    //                             Radius.circular(
                    //                                 20),
                    //                             bottomLeft:
                    //                             Radius.circular(
                    //                                 20),
                    //                           ),
                    //                           color: Colors.black
                    //                               .withOpacity(0.5)),
                    //                       child: Column(
                    //                         crossAxisAlignment:
                    //                         CrossAxisAlignment
                    //                             .start,
                    //                         children: [
                    //                           GestureDetector(
                    //                             onTap:(){
                    //                               Navigator.of(context).push(
                    //                                   MaterialPageRoute(
                    //                                       builder: (context) => Tenth(id:idealistmodal?.data?[index].ideaId ?? ""
                    //                                       )));
                    //                             },
                    //                             child: Text(
                    //                               idealistmodal
                    //                                   ?.data?[index]
                    //                                   .ideaName == "" || idealistmodal
                    //                                   ?.data?[index]
                    //                                   .ideaName == null ? "N/A" : idealistmodal
                    //                                   ?.data?[index]
                    //                                   .ideaName ??
                    //                                   "",
                    //
                    //                               style: TextStyle(
                    //                                 fontFamily:
                    //                                 "simsan",
                    //                                 color: Colors.white,
                    //                                 fontSize: 17.sp,
                    //                                 fontWeight:
                    //                                 FontWeight.bold,
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           SizedBox(
                    //                             height: 5.h,
                    //                           ),
                    //                           Row(
                    //                             mainAxisAlignment:
                    //                             MainAxisAlignment
                    //                                 .spaceBetween,
                    //                             children: [
                    //                               Text(
                    //                                 "已体验 ：" +
                    //                                     (idealistmodal
                    //                                         ?.data?[
                    //                                     index]
                    //                                         .noOfExperience)
                    //                                         .toString() +
                    //                                     " | 已收藏 ：" +
                    //                                     (idealistmodal
                    //                                         ?.data?[
                    //                                     index]
                    //                                         .noOfCollection)
                    //                                         .toString(),
                    //                                 style: TextStyle(
                    //                                   color: Colors
                    //                                       .white,
                    //                                   fontSize: 14.sp,
                    //                                   fontFamily:
                    //                                   "simsan",
                    //                                 ),
                    //                               ),
                    //                               Row(
                    //                                 mainAxisAlignment:
                    //                                 MainAxisAlignment
                    //                                     .spaceBetween,
                    //                                 children: [
                    //                                   GestureDetector(
                    //                                       onTap: () {
                    //
                    //                                         experincebuttonap(
                    //                                             idealistmodal?.data?[index].ideaId ??
                    //                                                 "");
                    //                                       },
                    //                                       child: ((idealistmodal?.data?[index].buttonExperience).toString() ==
                    //                                           "1")
                    //                                           ? Icon(
                    //                                         Icons.check_circle_rounded,
                    //                                         color:
                    //                                         Color(0xffbEBEAEA),
                    //                                         size:
                    //                                         20.sp,
                    //                                       )
                    //                                           : Icon(
                    //                                         Icons.check_circle_outline,
                    //                                         color:
                    //                                         Color(0xffb777777),
                    //                                         size:
                    //                                         20.sp,
                    //                                       )),
                    //                                   SizedBox(
                    //                                     width: 5.w,
                    //                                   ),
                    //                                   GestureDetector(
                    //                                     onTap: (){
                    //                                       experincebuttonap(
                    //                                           idealistmodal?.data?[index].ideaId ??
                    //                                               "");
                    //                                     },
                    //                                     child: Text(
                    //                                       "已体验",
                    //                                       style:
                    //                                       TextStyle(
                    //                                         color: Color(
                    //                                             0xffbA8A8A8),
                    //                                         fontSize:
                    //                                         14.sp,
                    //                                         fontFamily:
                    //                                         "simsan",
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width: 5.w,
                    //                                   ),
                    //                                   GestureDetector(
                    //                                       onTap:
                    //                                           () {},
                    //                                       child: (idealistmodal?.data?[index].buttonCollected) ==
                    //                                           "1"
                    //                                           ? GestureDetector(
                    //                                         onTap:
                    //                                             () {
                    //                                           collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //                                         },
                    //                                         child:
                    //                                         Icon(
                    //                                           Icons.favorite,
                    //                                           color: Color(0xffbD05454),
                    //                                         ),
                    //                                       )
                    //                                           : GestureDetector(
                    //                                         onTap:
                    //                                             () {
                    //                                           collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //                                         },
                    //                                         child:
                    //                                         Icon(
                    //                                           Icons.favorite_border,
                    //                                           color: Color(0xffb777777),
                    //                                         ),
                    //                                       )),
                    //                                   SizedBox(
                    //                                     width: 5.w,
                    //                                   ),
                    //                                   GestureDetector(
                    //                                     onTap: (){
                    //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //                                     },
                    //                                     child: Text(
                    //                                       "收藏",
                    //                                       style:
                    //                                       TextStyle(
                    //                                         color: Color(
                    //                                             0xffbA8A8A8),
                    //                                         fontSize:
                    //                                         14.sp,
                    //                                         fontFamily:
                    //                                         "simsan",
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               )
                    //                             ],
                    //                           )
                    //                         ],
                    //                       ),
                    //                     )
                    //                   ]
                    //                 ]
                    //             )
                    //
                    //
                    //           // ListView.builder(
                    //           //     padding: EdgeInsets.zero,
                    //           //     physics: ScrollPhysics(),
                    //           //     itemCount: idealistmodal?.data?.length,
                    //           //     shrinkWrap: true,
                    //           //     scrollDirection: Axis.vertical,
                    //           //     itemBuilder: (context, index) {
                    //           //       return index % 2 == 0
                    //           //           ? Container(
                    //           //             // height: 65.h,
                    //           //             margin: EdgeInsets.only(
                    //           //                 right: 15.w,
                    //           //                 top: 5.w,
                    //           //                 bottom: 5.w),
                    //           //             padding:
                    //           //                 EdgeInsets.symmetric(
                    //           //                     horizontal: 15.w,
                    //           //                     vertical: 10.w),
                    //           //             width:
                    //           //                 MediaQuery.of(context)
                    //           //                     .size
                    //           //                     .width,
                    //           //             decoration: BoxDecoration(
                    //           //                 borderRadius:
                    //           //                     BorderRadius.only(
                    //           //                   topRight:
                    //           //                       Radius.circular(
                    //           //                           20),
                    //           //                   bottomRight:
                    //           //                       Radius.circular(
                    //           //                           20),
                    //           //                 ),
                    //           //                 color: Colors.black
                    //           //                     .withOpacity(0.5)),
                    //           //             child: Column(
                    //           //               crossAxisAlignment:
                    //           //                   CrossAxisAlignment
                    //           //                       .start,
                    //           //               children: [
                    //           //                 GestureDetector(
                    //           //                   onTap:(){
                    //           //                     Navigator.of(context).push(
                    //           //                         MaterialPageRoute(
                    //           //                             builder: (context) => Tenth(id:idealistmodal?.data?[index].ideaId ?? ""
                    //           //                             )));
                    //           //                   },
                    //           //                   child: Text(
                    //           //                     idealistmodal
                    //           //                         ?.data?[index]
                    //           //                         .ideaName == "" || idealistmodal
                    //           //                         ?.data?[index]
                    //           //                         .ideaName == null ? "N/A" : idealistmodal
                    //           //                             ?.data?[index]
                    //           //                             .ideaName ??
                    //           //                         "",
                    //           //
                    //           //                     style: TextStyle(
                    //           //                       color: Colors.white,
                    //           //                       fontSize: 17.sp,
                    //           //                       fontWeight:
                    //           //                           FontWeight.bold,
                    //           //                       fontFamily:
                    //           //                           "simsan",
                    //           //                     ),
                    //           //                   ),
                    //           //                 ),
                    //           //                 SizedBox(
                    //           //                   height: 8.h,
                    //           //                 ),
                    //           //                 Row(
                    //           //                   mainAxisAlignment:
                    //           //                       MainAxisAlignment
                    //           //                           .spaceBetween,
                    //           //                   children: [
                    //           //                     Text(
                    //           //                       "已体验 : ${idealistmodal?.data?[index].noOfExperience} | 已收藏 : ${idealistmodal?.data?[index].noOfCollection}",
                    //           //                       style: TextStyle(
                    //           //                         color: Colors
                    //           //                             .white,
                    //           //                         fontSize: 14.sp,
                    //           //                         fontFamily:
                    //           //                             "simsan",
                    //           //                       ),
                    //           //                     ),
                    //           //                     Row(
                    //           //                       mainAxisAlignment:
                    //           //                           MainAxisAlignment
                    //           //                               .spaceBetween,
                    //           //                       children: [
                    //           //                         GestureDetector(
                    //           //                             onTap:
                    //           //                                 () {
                    //           //                                   setState((){
                    //           //                                     sel =index;
                    //           //                                   });
                    //           //                                 },
                    //           //                             child: (idealistmodal?.data?[index].buttonExperience.toString() ==
                    //           //                                     "1")
                    //           //                                 ? GestureDetector(
                    //           //                                     onTap:
                    //           //                                         () {
                    //           //
                    //           //                                       experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                    //           //                                     },
                    //           //                                     child:
                    //           //                                         Icon(
                    //           //                                       Icons.check_circle_rounded,
                    //           //                                       color: Color(0xffbEBEAEA),
                    //           //                                       size: 20.sp,
                    //           //                                     ),
                    //           //                                   )
                    //           //                                 : GestureDetector(
                    //           //                                     onTap:
                    //           //                                         () {
                    //           //                                       experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                    //           //                                     },
                    //           //                                     child:
                    //           //                                         Icon(
                    //           //                                       Icons.check_circle_outline,
                    //           //                                       color: Color(0xffb777777),
                    //           //                                       size: 20.sp,
                    //           //                                     ),
                    //           //                                   ),
                    //           //                         ),
                    //           //                         SizedBox(
                    //           //                           width: 5.w,
                    //           //                         ),
                    //           //                         GestureDetector(
                    //           //                           onTap: (){
                    //           //                             setState((){
                    //           //                               sel =index;
                    //           //                             });
                    //           //                             experincebuttonap(idealistmodal?.data?[index].ideaId ?? "");
                    //           //                           },
                    //           //                           child: Text(
                    //           //                             "已体验",
                    //           //                             style:
                    //           //                                 TextStyle(
                    //           //                               color: Color(
                    //           //                                   0xffbA8A8A8),
                    //           //                               fontSize:
                    //           //                                   14.sp,
                    //           //                               fontFamily:
                    //           //                                   "simsan",
                    //           //                             ),
                    //           //                           ),
                    //           //                         ),
                    //           //                         SizedBox(
                    //           //                           width: 5.w,
                    //           //                         ),
                    //           //                         GestureDetector(
                    //           //                             onTap:
                    //           //                                 () {
                    //           //                                   setState((){
                    //           //                                     COLLSEL =index;
                    //           //                                   });
                    //           //                                 },
                    //           //                             child: idealistmodal?.data?[index].buttonCollected ==
                    //           //                                     "1"
                    //           //                                 ? GestureDetector(
                    //           //                                     onTap:
                    //           //                                         () {
                    //           //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //           //                                     },
                    //           //                                     child:
                    //           //                                         Icon(
                    //           //                                       Icons.favorite,
                    //           //                                       color: Color(0xffbD05454),
                    //           //                                     ),
                    //           //                                   )
                    //           //                                 : GestureDetector(
                    //           //                                     onTap:
                    //           //                                         () {
                    //           //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //           //                                     },
                    //           //                                     child:
                    //           //                                         Icon(
                    //           //                                       Icons.favorite_border,
                    //           //                                       color: Color(0xffb777777),
                    //           //                                     ),
                    //           //                                   )),
                    //           //                         SizedBox(
                    //           //                           width: 5.w,
                    //           //                         ),
                    //           //                         GestureDetector(
                    //           //                          onTap: (){
                    //           //                            setState((){
                    //           //                              COLLSEL =index;
                    //           //                            });
                    //           //                            collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //           //                          } ,
                    //           //                           child: Text(
                    //           //                             "收藏",
                    //           //                             style:
                    //           //                                 TextStyle(
                    //           //                               color: Color(
                    //           //                                   0xffbA8A8A8),
                    //           //                               fontSize:
                    //           //                                   14.sp,
                    //           //                               fontFamily:
                    //           //                                   "simsan",
                    //           //                             ),
                    //           //                           ),
                    //           //                         ),
                    //           //                       ],
                    //           //                     )
                    //           //                   ],
                    //           //                 )
                    //           //               ],
                    //           //             ),
                    //           //           )
                    //           //           : Container(
                    //           //
                    //           //             // height: 65.h,
                    //           //             margin: EdgeInsets.only(
                    //           //                 left: 15.w),
                    //           //             padding:
                    //           //                 EdgeInsets.symmetric(
                    //           //                     horizontal: 15.w,
                    //           //                     vertical: 10.w),
                    //           //             width:
                    //           //                 MediaQuery.of(context)
                    //           //                     .size
                    //           //                     .width,
                    //           //             decoration: BoxDecoration(
                    //           //                 borderRadius:
                    //           //                     BorderRadius.only(
                    //           //                   topLeft:
                    //           //                       Radius.circular(
                    //           //                           20),
                    //           //                   bottomLeft:
                    //           //                       Radius.circular(
                    //           //                           20),
                    //           //                 ),
                    //           //                 color: Colors.black
                    //           //                     .withOpacity(0.5)),
                    //           //             child: Column(
                    //           //               crossAxisAlignment:
                    //           //                   CrossAxisAlignment
                    //           //                       .start,
                    //           //               children: [
                    //           //                 GestureDetector(
                    //           //                   onTap:(){
                    //           //                     Navigator.of(context).push(
                    //           //                         MaterialPageRoute(
                    //           //                             builder: (context) => Tenth(id:idealistmodal?.data?[index].ideaId ?? ""
                    //           //                             )));
                    //           //                 },
                    //           //                   child: Text(
                    //           //                     idealistmodal
                    //           //                         ?.data?[index]
                    //           //                         .ideaName == "" || idealistmodal
                    //           //                         ?.data?[index]
                    //           //                         .ideaName == null ? "N/A" : idealistmodal
                    //           //                         ?.data?[index]
                    //           //                         .ideaName ??
                    //           //                         "",
                    //           //
                    //           //                     style: TextStyle(
                    //           //                       fontFamily:
                    //           //                           "simsan",
                    //           //                       color: Colors.white,
                    //           //                       fontSize: 17.sp,
                    //           //                       fontWeight:
                    //           //                           FontWeight.bold,
                    //           //                     ),
                    //           //                   ),
                    //           //                 ),
                    //           //                 SizedBox(
                    //           //                   height: 5.h,
                    //           //                 ),
                    //           //                 Row(
                    //           //                   mainAxisAlignment:
                    //           //                       MainAxisAlignment
                    //           //                           .spaceBetween,
                    //           //                   children: [
                    //           //                     Text(
                    //           //                       "已体验 ：" +
                    //           //                           (idealistmodal
                    //           //                                   ?.data?[
                    //           //                                       index]
                    //           //                                   .noOfExperience)
                    //           //                               .toString() +
                    //           //                           " | 已收藏 ：" +
                    //           //                           (idealistmodal
                    //           //                                   ?.data?[
                    //           //                                       index]
                    //           //                                   .noOfCollection)
                    //           //                               .toString(),
                    //           //                       style: TextStyle(
                    //           //                         color: Colors
                    //           //                             .white,
                    //           //                         fontSize: 14.sp,
                    //           //                         fontFamily:
                    //           //                             "simsan",
                    //           //                       ),
                    //           //                     ),
                    //           //                     Row(
                    //           //                       mainAxisAlignment:
                    //           //                           MainAxisAlignment
                    //           //                               .spaceBetween,
                    //           //                       children: [
                    //           //                         GestureDetector(
                    //           //                             onTap: () {
                    //           //
                    //           //                               experincebuttonap(
                    //           //                                   idealistmodal?.data?[index].ideaId ??
                    //           //                                       "");
                    //           //                             },
                    //           //                             child: ((idealistmodal?.data?[index].buttonExperience).toString() ==
                    //           //                                     "1")
                    //           //                                 ? Icon(
                    //           //                                     Icons.check_circle_rounded,
                    //           //                                     color:
                    //           //                                         Color(0xffbEBEAEA),
                    //           //                                     size:
                    //           //                                         20.sp,
                    //           //                                   )
                    //           //                                 : Icon(
                    //           //                                     Icons.check_circle_outline,
                    //           //                                     color:
                    //           //                                         Color(0xffb777777),
                    //           //                                     size:
                    //           //                                         20.sp,
                    //           //                                   )),
                    //           //                         SizedBox(
                    //           //                           width: 5.w,
                    //           //                         ),
                    //           //                         GestureDetector(
                    //           //                           onTap: (){
                    //           //                             experincebuttonap(
                    //           //                                 idealistmodal?.data?[index].ideaId ??
                    //           //                                     "");
                    //           //                           },
                    //           //                           child: Text(
                    //           //                             "已体验",
                    //           //                             style:
                    //           //                                 TextStyle(
                    //           //                               color: Color(
                    //           //                                   0xffbA8A8A8),
                    //           //                               fontSize:
                    //           //                                   14.sp,
                    //           //                               fontFamily:
                    //           //                                   "simsan",
                    //           //                             ),
                    //           //                           ),
                    //           //                         ),
                    //           //                         SizedBox(
                    //           //                           width: 5.w,
                    //           //                         ),
                    //           //                         GestureDetector(
                    //           //                             onTap:
                    //           //                                 () {},
                    //           //                             child: (idealistmodal?.data?[index].buttonCollected) ==
                    //           //                                     "1"
                    //           //                                 ? GestureDetector(
                    //           //                                     onTap:
                    //           //                                         () {
                    //           //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //           //                                     },
                    //           //                                     child:
                    //           //                                         Icon(
                    //           //                                       Icons.favorite,
                    //           //                                       color: Color(0xffbD05454),
                    //           //                                     ),
                    //           //                                   )
                    //           //                                 : GestureDetector(
                    //           //                                     onTap:
                    //           //                                         () {
                    //           //                                       collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //           //                                     },
                    //           //                                     child:
                    //           //                                         Icon(
                    //           //                                       Icons.favorite_border,
                    //           //                                       color: Color(0xffb777777),
                    //           //                                     ),
                    //           //                                   )),
                    //           //                         SizedBox(
                    //           //                           width: 5.w,
                    //           //                         ),
                    //           //                         GestureDetector(
                    //           //                           onTap: (){
                    //           //                             collectedbuttonap(idealistmodal?.data?[index].ideaId);
                    //           //                           },
                    //           //                           child: Text(
                    //           //                             "收藏",
                    //           //                             style:
                    //           //                                 TextStyle(
                    //           //                               color: Color(
                    //           //                                   0xffbA8A8A8),
                    //           //                               fontSize:
                    //           //                                   14.sp,
                    //           //                               fontFamily:
                    //           //                                   "simsan",
                    //           //                             ),
                    //           //                           ),
                    //           //                         ),
                    //           //                       ],
                    //           //                     )
                    //           //                   ],
                    //           //                 )
                    //           //               ],
                    //           //             ),
                    //           //           );
                    //           //     }),
                    //         ),
                    //         SizedBox(height:30.h)
                    //       ]),
                    // ),
                  ],
                ),
              ),
              Container(
                // height: 180.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 100.h,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffbBE1313),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40)),
                      ),
                      // navigate to manual exploration page page 6
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(Sixth());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(90)),
                              child: Text(
                                '手动搜索',
                                style: TextStyle(
                                    fontFamily: "simsan",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Center(
                        child: Text(
                          '没找到落入心坎儿里的体验？\n ￥0费用创建自己的体验获得额外收入！',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "simsan",
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    //navigate to add new idea
                    GestureDetector(
                      onTap: () {
                        Get.to(Fourteenth());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            color: Colors.red.shade900,
                            borderRadius: BorderRadius.circular(90)),
                        child: Text(
                          '创建新的体验点子',
                          style: TextStyle(
                              fontFamily: "simsan",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
  idealistap() {
    print("hiii");
    final Map<String, String> data = {};
    data['login_user_id'] = userdata?.userData?.id ?? '';
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().selfapi(data).then((response) async {
          selfideamodal = SelfIdeaModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              selfideamodal?.status == "success") {

            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  experincebuttonap(String? value) {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['idea_id'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().experincebuttonapi(data).then((response) async {
          experincemodal = ExperinceModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              experincemodal?.status == "success") {
            idealistap();


            // Get.off(Four());
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  collectedbuttonap(String? value) {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['idea_id'] = value.toString();
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().collectionbuttonapi(data).then((response) async {
          collectionmodal =
              CollectionModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              collectionmodal?.status == "success") {

            idealistap();
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }
}
