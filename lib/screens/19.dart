import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chet/Modal/EventDeleteModal.dart';
import 'package:chet/Modal/FollowedmeModal.dart';
import 'package:chet/Modal/FollowuserModal.dart';
import 'package:chet/Modal/IfollowModal.dart';
import 'package:chet/Modal/Ratingmodal.dart';
import 'package:chet/Modal/RecommendedFriendModal.dart';
import 'package:chet/Modal/UnfollowuserModal.dart';
import 'package:chet/Modal/UserProfileModal.dart';
import 'package:chet/Modal/claimmodal.dart';
import 'package:chet/Modal/generatepdfmodal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/23.dart';
import 'package:chet/screens/25.dart';
import 'package:chet/screens/ChatListing.dart';
import 'package:chet/screens/FollowScreen.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import 'dart:math' as math;


import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;


class Nineteen extends StatefulWidget {
  String? user;
  String? eventid;

  Nineteen({Key? key, this.user, this.eventid}) : super(key: key);

  @override
  State<Nineteen> createState() => _NineteenState();
}

class test {
  String image;
  String title;
  String data;

  test(this.image, this.title, this.data);
}

class _NineteenState extends State<Nineteen> {
  Userprofile? userprofile;
  bool isLoading = true;
  bool _isLoading = false;
  int _rating = 0;
  double? per;
  double? per1;
  String? filePath="";
  List<test> image1 = [
    test(
        "https://shayariholic.com/wp-content/uploads/2022/09/whatsapp-dp-86-983x1024.jpg",
        "跟史蒂芬没有关系的女人", "取消关注"),
    test("https://cdn.statusqueen.com/dpimages/thumbnail/dp_images_8-1279.jpg",
        "史蒂芬的儿时基友", "取消关注"),
    test(
        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "跟史蒂芬有点关系的女人", "取消关注"),
    test(
        "https://images.pexels.com/photos/1080213/pexels-photo-1080213.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "史蒂芬的小学体育老师", "取消关注"),
    test(
        "https://as1.ftcdn.net/v2/jpg/04/15/47/46/1000_F_415474633_0Q1hAKF0U1Xiots9CXgzpttuIlJVHGS7.jpg",
        "史蒂芬他二舅", "取消关注"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.user);
    getdata();

  }

  GeneratePdfModal? pdfmodal;

  getdata() async {
    await userpfdata();
    await ifollowap();
    await followmeap();
    await recommdedfriendlist();
    await generatepdfap();
    await  claimap();
  }

  int? select = 0;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        bottomNavigationBar: Bottomnavbar(sel: 2),
        body: isLoading ? Container() : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 480.h,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 460.h,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(00, 4),
                                blurRadius: 07),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: Image.asset(
                            'assets/img19.jpg',
                            fit: BoxFit.cover,
                            height: 460.h,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 460.h,
                      // margin: EdgeInsets.only(left: 15.w),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black.withOpacity(0.45)
                      ),
                      // padding: EdgeInsets.all(15.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Row(

                                      children: [
                                        Container(
                                          height: 60.w,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.pink,
                                                Colors.blue
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                100),
                                            child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                (userprofile?.data
                                                    ?.profilePicture)
                                                    .toString(),
                                                progressIndicatorBuilder: (
                                                    context, url, progress) =>
                                                    CircularProgressIndicator(),
                                                errorWidget: (context, url,
                                                    error) =>
                                                    Icon(
                                                      Icons.person,
                                                      color: Colors.white
                                                          .withOpacity(0.59),
                                                      size: 50.sp,
                                                    )

                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 5.w,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            Container(
                                              width: 85.w,
                                              child: Text(
                                                userprofile?.data?.username ==
                                                    "" || userprofile?.data
                                                    ?.username == null
                                                    ? "姓名"
                                                    : userprofile?.data
                                                    ?.username ?? "",
                                                style: TextStyle(
                                                  color: Color(0xffbffffff),
                                                  fontFamily: "simsan",
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                            ),
                                            // widget.user.toString() != userdata?.userData?.id.toString() ?TextButton(onPressed: (){Get.to(profilePage());}, child:Text("Edit Avatar",style: TextStyle(
                                            //   color: Color(0xffbffffff),
                                            //   fontFamily: "simsan",
                                            //   fontSize: 10
                                            //       .sp,
                                            //   fontWeight: FontWeight.bold,
                                            // ),)):Container(),
                                            widget.user.toString() !=
                                                userdata?.userData?.id
                                                    .toString() ? Column(
                                              children: [
                                                SizedBox(height: 10.h,),
                                                GestureDetector(
                                                  onTap: () {
                                                    userprofile?.data
                                                        ?.isFollow == 0
                                                        ? followup(
                                                        widget.user.toString()
                                                    )
                                                        : unfollowap(
                                                        widget.user.toString());
                                                  },
                                                  child: Container(
                                                      height: 30.h,
                                                      width: 80.w,
                                                      alignment: Alignment
                                                          .center,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(10.0),
                                                          color: Colors.white
                                                              .withOpacity(0.8)
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          userprofile?.data
                                                              ?.isFollow == 0
                                                              ? "跟随"
                                                              : "取消关注",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 11.sp,
                                                              fontFamily: "simsan"
                                                          ),),
                                                      )
                                                  ),
                                                )
                                              ],
                                            ) : Container()

                                          ],
                                        ),
                                        SizedBox(width: 14.w,),
                                      ]
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(userprofile?.data
                                                  ?.noOfExperienced == "" ||
                                                  userprofile?.data
                                                      ?.noOfExperienced == null
                                                  ? "N/A"
                                                  : (userprofile?.data
                                                  ?.noOfExperienced).toString(),
                                                  style: textstyle),
                                              Text(
                                                  "已休体验", style: textstyle),
                                            ],
                                          ),
                                          SizedBox(width: 12.w,),
                                          Column(
                                            children: [
                                              Text(userprofile?.data
                                                  ?.noOfCollected == "" ||
                                                  userprofile?.data
                                                      ?.noOfCollected == null
                                                  ? "N/A"
                                                  : (userprofile?.data
                                                  ?.noOfCollected).toString(),
                                                  style: textstyle),
                                              Text("已收藏", style: textstyle),
                                            ],
                                          ),
                                          SizedBox(width: 12.w,),
                                          Column(
                                            children: [
                                              Text(userprofile?.data
                                                  ?.noOfOwned == "" ||
                                                  userprofile?.data
                                                      ?.noOfOwned == null
                                                  ? "N/A"
                                                  : (userprofile?.data
                                                  ?.noOfOwned).toString(),
                                                  style: textstyle),
                                              Text("已认领", style: textstyle),
                                            ],
                                          )
                                        ],
                                      ),

                                      SizedBox(height: 5.h,),
                                      widget.user != userdata?.userData?.id
                                          ? Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 25,
                                            initialRating: _rating.toDouble(),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: false,
                                            itemCount: 5,
                                            unratedColor: Colors.white,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),

                                            itemBuilder: (context, index) {
                                              if (index < _rating.floor()) {
                                                return Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                );
                                              } else {
                                                return Icon(
                                                  Icons.star_border,
                                                  color: Colors.white,
                                                );
                                              }
                                            },
                                            onRatingUpdate: (rating) {
                                              // setState(() {
                                              //   _rating = rating.toInt();
                                              // });
                                              ratingap();
                                            },
                                          ),

                                          // RatingBarIndicator(
                                          //   rating: 3.5,
                                          //   itemBuilder:
                                          //       (context, index3) =>
                                          //       Icon(
                                          //         Icons.star,
                                          //         color: Colors.white,
                                          //       ),
                                          //   itemCount: 5,
                                          //   itemSize: 20.0,
                                          //   direction: Axis.horizontal,
                                          // ),
                                        ],
                                      )
                                          : Container(),
                                      SizedBox(height: 5.h,),
                                      widget.user != userdata?.userData?.id
                                          ? Text(
                                        (userprofile?.data?.userRatingCount)
                                            .toString() + "人评价了TA",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.sp,
                                            fontFamily: "simsan"),
                                      )
                                          : Container(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(height: 30.h,),
                            //black colored container
                            Stack(
                              children: [
                                Container(
                                  // color:Colors.red,
                                  height: 300.h,
                                ),
                                Positioned(
                                  top: 40.h,
                                  left: 20.w,
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    // height:230.h ,
                                    padding: EdgeInsets.all(15.w),
                                    margin: EdgeInsets.only(left: 20.w),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.63),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30))
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text("截至今天,我已经在嘛呢。",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.sp,
                                            fontFamily: "simsan",
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        SizedBox(height: 10.h,),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: Row(
                                            children: [
                                              Text("体验了", style: textstyle,),
                                              Text(userprofile?.data
                                                  ?.noOfExperienced == "" ||
                                                  userprofile?.data
                                                      ?.noOfExperienced == null
                                                  ? "N/A"
                                                  : (userprofile?.data
                                                  ?.noOfExperienced).toString(),
                                                  style: textstyle1),
                                              Text("个点子", style: textstyle),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0.w),
                                          child: Row(
                                            children: [
                                              Text("收藏了", style: textstyle),
                                              Text(userprofile?.data
                                                  ?.noOfCollected == "" ||
                                                  userprofile?.data
                                                      ?.noOfCollected == null
                                                  ? "N/A"
                                                  : (userprofile?.data
                                                  ?.noOfCollected).toString(),
                                                  style: textstyle1),
                                              Text("个点子", style: textstyle),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Row(
                                          children: [
                                            Text("体验数超过了",
                                                style: textstyle),
                                            Text(userprofile?.data
                                                ?.noOfExperienced == "" ||
                                                userprofile?.data
                                                    ?.noOfExperienced == null
                                                ? "N/A"
                                                : (per?.toStringAsFixed(2))
                                                .toString() + "%",
                                                style: textstyle1),
                                            Text("的嘛呢用户",
                                                style: textstyle),
                                          ],
                                        ),
                                        SizedBox(height: 10.h,),
                                        Text(
                                            " 因为你的存在让我们这一物种变得更加有趣！",
                                            style: textstyle),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 0.w,
                                    left: 190.w,
                                    child: Transform.rotate(
                                        angle: math.pi / 10,

                                        child: Image.asset(
                                          "assets/stiker.png", height: 200.w,
                                          width: 200.w,))

                                )
                              ],
                            ),
                          ]),
                    ),
                    Positioned(
                        top: 370.h,
                        left: 0.w,
                        right: 0.w,
                        child: InkWell(
                          onTap: () async {
                            // downloaddata();
                            // FileDownloader.downloadFile(
                            //     url: "https://www.africau.edu/images/default/sample.pdf",
                            //     name: "123 ",
                            //     onDownloadCompleted: (path) {
                            //       final File file = File(path);
                            //       print(file.toString());
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //               SnackBar(
                            //                 content: Text('PDF Downloaded Successfully'),
                            //               ),
                            //             );
                            //     });
                            Get.to(Twentythree(set:1,user: widget.user,));
                          },
                          child: Container(
                            height: 100.h,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            margin: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.red.shade900.withOpacity(0.9)
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/dog.png', height: 150.w,
                                  width: 150.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "点我一键生成 ", textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontFamily: "simsan"
                                      ),),
                                    Text("《有趣的灵魂报告》",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontFamily: "simsan"
                                      ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),


              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // avatar
                    Container(
                      margin: EdgeInsets.all(10.w),
                      // height: 260.h,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15.0, // soften the shadow
                              spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 5  horizontally
                                5.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.0)),
                      child: userprofile?.data?.avatarName == "" ?
                      Container(
                          height: 30.h,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Center(child: Text(
                              "“开始你的第一个体验来获得角色形象！"))) :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.h,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(

                                      alignment: Alignment.topCenter,
                                      // height: 185.h,
                                      child: Image.asset(
                                        userprofile?.data?.avatarName ==
                                            "Romantic/Humanitarian"
                                            ? "assets/roman.png"
                                            :
                                        userprofile?.data?.avatarName ==
                                            "Analyst/Thinker"
                                            ? "assets/bearedman.jpg"
                                            :
                                        userprofile?.data?.avatarName ==
                                            "Adventurer/Optimist"
                                            ? "assets/adeva.png"
                                            :
                                        userprofile?.data?.avatarName ==
                                            "Diplomat/Strategist"
                                            ? "assets/diplo.png"
                                            : "assets/prote.png"
                                        ,
                                        height: 160.h,
                                        width: 103.w,
                                      )),
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                // height: 185.h,
                                width: 215.w,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "你目前参加最多的体验为 尬、舒适圈、自然",
                                      style: TextStyle(
                                          color: Color(0XFFB383838),
                                          fontSize: 12.sp,
                                          fontFamily: "simsan"),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Center(
                                      child: Text(
                                        userprofile?.data?.avatarName ==
                                            "Romantic/Humanitarian"
                                            ? "浪漫家/人文主义者"
                                            :
                                        userprofile?.data?.avatarName ==
                                            "Analyst/Thinker"
                                            ? "分析家/思考者"
                                            :
                                        userprofile?.data?.avatarName ==
                                            "Adventurer/Optimist"
                                            ? "分析家/思考者"
                                            :
                                        userprofile?.data?.avatarName ==
                                            "Diplomat/Strategist"
                                            ? "外交家/权谋者"
                                            : "保护者/护卫军"
                                        ,
                                        style: TextStyle(
                                            color: Color(0XFFB272525),
                                            fontSize: 14.sp,
                                            fontFamily: "simsan",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      userprofile?.data?.avatarName ==
                                          "Romantic/Humanitarian"
                                          ? "在AI时代鉴定的人文主义者，关注人的体验和需求，也时不时希望在生活中有点小情调"
                                          :
                                      userprofile?.data?.avatarName ==
                                          "Analyst/Thinker"
                                          ? "重视事实和数据，对细节和推理有关的体验很感兴趣，常常对事关人类以及宇宙命运的问题刨根问底并得到快乐"
                                          :
                                      userprofile?.data?.avatarName ==
                                          "Adventurer/Optimist"
                                          ? "喜欢激烈碰撞的事情，生活就要热热闹闹嗨嗨皮皮，吃火锅也要点最辣的锅，他们的热情一不小心就能向四周辐射，对参与探险累的体验情有独钟"
                                          :
                                      userprofile?.data?.avatarName ==
                                          "Diplomat/Strategist"
                                          ? "喜欢在与人互动中获得能量或者新知，权谋策略在TA这里稀松平常游刃有余，对需要和人合作或者能获得别人肯定的体验很感兴趣"
                                          : "崇尚世界大同万物和谐，他们喜欢通过成就或者保护别人来救赎自己，对生活体验十分重视，也愿意参与这方面的体验来让自己取得平静"
                                      ,
                                      style: TextStyle(
                                        color: Color(0XFFB383838),
                                        fontSize: 14.sp,
                                        fontFamily: "simsan",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 5.h,),
                          Padding(
                            padding: EdgeInsets.all(0.w),
                            child: Text(
                              "*随着体验更多项目，你的体验角色可能会变",
                              style: TextStyle(
                                  color: Color(0XFF585),
                                  fontSize: 12.sp,
                                  fontFamily: "simsan"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                    Center(
                      child: Container(
                        height: 5.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.black
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Center(
                      child: Text("我认领的体验", style: TextStyle(
                          color: Color(0xffb383838),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "simsan"
                      ),),
                    ),
                    SizedBox(height: 5.h,),
                    claimmodal1?.claimedEventsList?.length == 0
                        ? Container(
                        height: 20.h, child: Center(
                      child: Text("没有活动报名", style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontFamily: "simsan")),
                    ))
                        :
                    Container(

                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child:
                        Column(
                            children: [
                              for(int index = 0; index <
                                  (claimmodal1?.claimedEventsList?.length ?? 0); index++)...[
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5.h),
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0)),
                                        child: Container(
                                          // height: 110.h,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          margin: EdgeInsets.only(right: 5.w),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      20.0),
                                                  bottomRight: Radius.circular(
                                                      20.0)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://www.pngarts.com/files/16/Family-PNG-Image.png")
                                                  , fit: BoxFit.cover)
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                // height: 120.h,
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                margin: EdgeInsets.only(
                                                    right: 5.w),
                                                padding: EdgeInsets.all(15.w),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .only(topRight: Radius
                                                        .circular(20.0),
                                                        bottomRight: Radius
                                                            .circular(20.0)),
                                                    color: Colors.black
                                                        .withOpacity(0.7)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 250.w,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            claimmodal1?.claimedEventsList?[index].eventName ==
                                                                null ||
                                                                claimmodal1?.claimedEventsList?[index].eventName ==
                                                                    ''
                                                                ? 'N/A'
                                                                : (claimmodal1?.claimedEventsList?[index].eventName)
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 17.sp,
                                                                fontWeight: FontWeight
                                                                    .bold,
                                                                fontFamily: "simsan"
                                                            ),),
                                                          SizedBox(height: 10
                                                              .h,),
                                                          Text(claimmodal1?.claimedEventsList?[index].eventStartDate ==
                                                              null ||
                                                              claimmodal1?.claimedEventsList?[index].eventStartDate ==
                                                                  ''
                                                              ? 'N/A'
                                                              : (claimmodal1?.claimedEventsList?[index].eventStartDate)
                                                              .toString() +
                                                              ( claimmodal1?.claimedEventsList?[index].eventStartTime ==
                                                                  null ||
                                                                  claimmodal1?.claimedEventsList?[index].eventStartTime ==
                                                                      ''
                                                                  ? 'N/A'
                                                                  : claimmodal1?.claimedEventsList?[index].eventStartTime)
                                                                  .toString() +
                                                              "|" +
                                                              (claimmodal1?.claimedEventsList?[index]
                                                                  .noOfExperienced ==
                                                                  null ||
                                                                  claimmodal1?.claimedEventsList?[index]
                                                                      .noOfExperienced ==
                                                                      ''
                                                                  ? 'N/A'
                                                                  : claimmodal1?.claimedEventsList?[index]
                                                                  .noOfExperienced)
                                                                  .toString() +
                                                              "已体验",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight
                                                                    .normal,
                                                                fontFamily: "simsan"
                                                            ),),
                                                          Text((claimmodal1?.claimedEventsList?[index].city == null ||
                                                              claimmodal1?.claimedEventsList?[index].city == ''
                                                              ? 'N/A'
                                                              : claimmodal1?.claimedEventsList?[index].city)
                                                              .toString() +
                                                              " | "
                                                              + ((claimmodal1?.claimedEventsList?[index].address == null ||
                                                                  claimmodal1?.claimedEventsList?[index].address == ''
                                                                  ? 'N/A'
                                                                  : claimmodal1?.claimedEventsList?[index].address)
                                                                  .toString()),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight
                                                                    .normal,
                                                                fontFamily: "simsan"
                                                            ),),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 70.w,
                                                      width: 70.w,

                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,

                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius
                                                            .circular(80),
                                                        child: CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            imageUrl: (claimmodal1?.claimedEventsList?[index]
                                                                .profilePicture)
                                                                .toString(),
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                progress) =>
                                                                CircularProgressIndicator(),
                                                            errorWidget: (
                                                                context, url,
                                                                error) =>
                                                                Image.asset(
                                                                    "assets/user.png",
                                                                    color:
                                                                    Colors
                                                                        .white)),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ),
                                              // SizedBox(height: 3.h,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget.user.toString() == userdata?.userData?.id.toString() ?  
                                        
                                        Padding(
                                          padding:EdgeInsets.symmetric(horizontal:15.w),
                                          child: Row(
                                      children: [
                                          OutlinedButton(
                                              onPressed: () {
                                                buildErrorDialog2(context, "", "你对你的攀岩活动感到失望了吗？", () { deleteclimevent(claimmodal1?.claimedEventsList?[index]
                                                    .eventId);}, "去看看", () { Get.back();}, "返回", Colors.black, Color(0xffb14559E));

                                              },
                                              style: OutlinedButton.styleFrom(

                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(10),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 1),
                                              ),
                                              child: Center(
                                                child: Text("删除体验",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11.sp,
                                                        fontFamily: "simsan")),
                                              )),
                                          SizedBox(width: 5.w),
                                          OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(10),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 1),
                                              ),
                                              onPressed: () {},
                                              child: Center(
                                                child: Text("复制体验",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11.sp,
                                                        fontFamily: "simsan")),
                                              )),
                                      ],
                                    ),
                                        ):Container(),
                                  ],
                                )
                              ]
                            ]
                        )
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Container(
                        height: 5.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.black
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Center(
                      child: Text("我已报名的体验", style: TextStyle(
                          color: Color(0xffb383838),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "simsan"
                      ),),
                    ),
                    SizedBox(height: 5.h,),
                    Center(
                      child: Text(
                        "**活动当天出示此界面即可入场", style: TextStyle(
                        color: Color(0xffb8D8585),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    userprofile?.data?.signupEventsList?.length == 0
                        ? Container(
                        height: 20.h, child: Center(
                      child: Text("没有活动报名", style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontFamily: "simsan")),
                    ))
                        :
                    Container(

                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child:
                        Column(
                            children: [
                              for(int index = 0; index <
                                  (userprofile?.data?.signupEventsList
                                      ?.length ?? 0); index++)...[
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5.h),
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0)),
                                        child: Container(
                                          // height: 110.h,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          margin: EdgeInsets.only(right: 5.w),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      20.0),
                                                  bottomRight: Radius.circular(
                                                      20.0)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://www.pngarts.com/files/16/Family-PNG-Image.png")
                                                  , fit: BoxFit.cover)
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                // height: 120.h,
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                margin: EdgeInsets.only(
                                                    right: 5.w),
                                                padding: EdgeInsets.all(15.w),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .only(topRight: Radius
                                                        .circular(20.0),
                                                        bottomRight: Radius
                                                            .circular(20.0)),
                                                    color: Colors.black
                                                        .withOpacity(0.7)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 250.w,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            userprofile?.data
                                                                ?.signupEventsList?[index]
                                                                .eventName ==
                                                                null ||
                                                                userprofile
                                                                    ?.data
                                                                    ?.signupEventsList?[index]
                                                                    .eventName ==
                                                                    ''
                                                                ? 'N/A'
                                                                : (userprofile
                                                                ?.data
                                                                ?.signupEventsList?[index]
                                                                .eventName)
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 17.sp,
                                                                fontWeight: FontWeight
                                                                    .bold,
                                                                fontFamily: "simsan"
                                                            ),),
                                                          SizedBox(height: 10
                                                              .h,),
                                                          Text(userprofile?.data
                                                              ?.signupEventsList?[index]
                                                              .eventStartDate ==
                                                              null ||
                                                              userprofile?.data
                                                                  ?.signupEventsList?[index]
                                                                  .eventStartDate ==
                                                                  ''
                                                              ? 'N/A'
                                                              : (userprofile
                                                              ?.data
                                                              ?.signupEventsList?[index]
                                                              .eventStartDate)
                                                              .toString() +
                                                              (userprofile?.data
                                                                  ?.signupEventsList?[index]
                                                                  .eventStartTime ==
                                                                  null ||
                                                                  userprofile
                                                                      ?.data
                                                                      ?.signupEventsList?[index]
                                                                      .eventStartTime ==
                                                                      ''
                                                                  ? 'N/A'
                                                                  : userprofile
                                                                  ?.data
                                                                  ?.signupEventsList?[index]
                                                                  .eventStartTime)
                                                                  .toString() +
                                                              "|" +
                                                              (userprofile?.data
                                                                  ?.signupEventsList?[index]
                                                                  .noOfExperienced ==
                                                                  null ||
                                                                  userprofile
                                                                      ?.data
                                                                      ?.signupEventsList?[index]
                                                                      .noOfExperienced ==
                                                                      ''
                                                                  ? 'N/A'
                                                                  : userprofile
                                                                  ?.data
                                                                  ?.signupEventsList?[index]
                                                                  .noOfExperienced)
                                                                  .toString() +
                                                              "已体验",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight
                                                                    .normal,
                                                                fontFamily: "simsan"
                                                            ),),
                                                          Text((userprofile
                                                              ?.data
                                                              ?.signupEventsList?[index]
                                                              .city == null ||
                                                              userprofile?.data
                                                                  ?.signupEventsList?[index]
                                                                  .city == ''
                                                              ? 'N/A'
                                                              : userprofile
                                                              ?.data
                                                              ?.signupEventsList?[index]
                                                              .city)
                                                              .toString() +
                                                              " | "
                                                              + (userprofile
                                                                  ?.data
                                                                  ?.signupEventsList?[index]
                                                                  .address ==
                                                                  null ||
                                                                  userprofile
                                                                      ?.data
                                                                      ?.signupEventsList?[index]
                                                                      .address ==
                                                                      ''
                                                                  ? 'N/A'
                                                                  : userprofile
                                                                  ?.data
                                                                  ?.signupEventsList?[index]
                                                                  .address)
                                                                  .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight
                                                                    .normal,
                                                                fontFamily: "simsan"
                                                            ),),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 70.w,
                                                      width: 70.w,

                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,

                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius
                                                            .circular(80),
                                                        child: CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            imageUrl: (userprofile
                                                                ?.data
                                                                ?.signupEventsList?[index]
                                                                .profilePic)
                                                                .toString(),
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                progress) =>
                                                                CircularProgressIndicator(),
                                                            errorWidget: (
                                                                context, url,
                                                                error) =>
                                                                Image.asset(
                                                                    "assets/user.png",
                                                                    color:
                                                                    Colors
                                                                        .black)),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ),
                                              // SizedBox(height: 5.h,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    
                                    // Row(
                                    //   children: [
                                    //     OutlinedButton(
                                    //         onPressed: () {},
                                    //         style: OutlinedButton.styleFrom(
                                    //
                                    //           shape: RoundedRectangleBorder(
                                    //             borderRadius: BorderRadius
                                    //                 .circular(10),
                                    //           ),
                                    //           side: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //         ),
                                    //         child: Center(
                                    //           child: Text("删除体验",
                                    //               style: TextStyle(
                                    //                   color: Colors.black,
                                    //                   fontSize: 11.sp,
                                    //                   fontFamily: "simsan")),
                                    //         )),
                                    //     SizedBox(width: 5.w),
                                    //     OutlinedButton(
                                    //         style: OutlinedButton.styleFrom(
                                    //           shape: RoundedRectangleBorder(
                                    //             borderRadius: BorderRadius
                                    //                 .circular(10),
                                    //           ),
                                    //           side: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //         ),
                                    //         onPressed: () {},
                                    //         child: Center(
                                    //           child: Text("复制体验",
                                    //               style: TextStyle(
                                    //                   color: Colors.black,
                                    //                   fontSize: 11.sp,
                                    //                   fontFamily: "simsan")),
                                    //         )),
                                    //   ],
                                    // ),
                                  ],
                                )
                              ]
                            ]
                        )
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Container(
                        height: 5.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.black
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    Center(
                      child: Text("我参加过的体验", style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontFamily: "simsan",
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    userprofile?.data?.eventsParticipatedInBefore?.length == 0
                        ? Container(
                        height: 20.h, child: Center(
                      child: Text("之前没有参加过任何活动", style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontFamily: "simsan")),
                    ))
                        :
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Column(
                            children: [
                              for(int index = 0; index <
                                  (userprofile?.data?.eventsParticipatedInBefore
                                      ?.length ?? 0); index++)...[
                                Container(
                                  margin: EdgeInsets.only(bottom: 5.h),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0)),
                                    child: Container(
                                      // height: 115.h,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      margin: EdgeInsets.only(left: 5.w),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              bottomLeft: Radius.circular(
                                                  20.0)),
                                          image: DecorationImage(

                                              image: NetworkImage(
                                                  "https://www.pngarts.com/files/16/Family-PNG-Image.png")
                                              , fit: BoxFit.cover)
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            // height: 150.h,
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.only(left: 5.w),
                                            padding: EdgeInsets.all(15.w),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        20.0),
                                                    bottomLeft: Radius.circular(
                                                        20.0)),
                                                color: Colors.black.withOpacity(
                                                    0.8)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 250.w,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(userprofile?.data
                                                          ?.eventsParticipatedInBefore?[index]
                                                          .eventName == null ||
                                                          userprofile?.data
                                                              ?.eventsParticipatedInBefore?[index]
                                                              .eventName == ""
                                                          ? "N/A"
                                                          : (userprofile?.data
                                                          ?.eventsParticipatedInBefore?[index]
                                                          .eventName)
                                                          .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17.sp,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            fontFamily: "simsan"
                                                        ),),
                                                      SizedBox(height: 10.h,),
                                                      Text(userprofile?.data
                                                          ?.eventsParticipatedInBefore?[index]
                                                          .eventStartDate ==
                                                          null ||
                                                          userprofile?.data
                                                              ?.eventsParticipatedInBefore?[index]
                                                              .eventStartDate ==
                                                              ''
                                                          ? 'N/A'
                                                          : (userprofile?.data
                                                          ?.eventsParticipatedInBefore?[index]
                                                          .eventStartDate)
                                                          .toString() +
                                                          (userprofile?.data
                                                              ?.eventsParticipatedInBefore?[index]
                                                              .eventStartTime ==
                                                              null ||
                                                              userprofile?.data
                                                                  ?.eventsParticipatedInBefore?[index]
                                                                  .eventStartTime ==
                                                                  ''
                                                              ? 'N/A'
                                                              : userprofile
                                                              ?.data
                                                              ?.eventsParticipatedInBefore?[index]
                                                              .eventStartTime)
                                                              .toString() +
                                                          "|" +
                                                          (userprofile?.data
                                                              ?.eventsParticipatedInBefore?[index]
                                                              .noOfExperienced ==
                                                              null ||
                                                              userprofile?.data
                                                                  ?.eventsParticipatedInBefore?[index]
                                                                  .noOfExperienced ==
                                                                  ''
                                                              ? 'N/A'
                                                              : userprofile
                                                              ?.data
                                                              ?.eventsParticipatedInBefore?[index]
                                                              .noOfExperienced)
                                                              .toString() +
                                                          "已体验",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14.sp,
                                                            fontFamily: "simsan"
                                                        ),),
                                                      Text(userprofile?.data
                                                          ?.eventsParticipatedInBefore?[index]
                                                          .city == null ||
                                                          userprofile?.data
                                                              ?.eventsParticipatedInBefore?[index]
                                                              .city == ''
                                                          ? 'N/A'
                                                          : (userprofile?.data
                                                          ?.eventsParticipatedInBefore?[index]
                                                          .city).toString() +
                                                          " | " +
                                                          (userprofile?.data
                                                              ?.eventsParticipatedInBefore?[index]
                                                              .address ==
                                                              null ||
                                                              userprofile?.data
                                                                  ?.eventsParticipatedInBefore?[index]
                                                                  .address == ''
                                                              ? 'N/A'
                                                              : (userprofile
                                                              ?.data
                                                              ?.eventsParticipatedInBefore?[index]
                                                              .address)
                                                              .toString()),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14.sp,
                                                            fontFamily: "simsan"
                                                        ),),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 70.w,
                                                  width: 70.w,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.blue,
                                                        Colors.pink
                                                      ],
                                                      begin: Alignment
                                                          .topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius
                                                        .circular(80),
                                                    child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: (userprofile
                                                            ?.data
                                                            ?.eventsParticipatedInBefore?[index]
                                                            .profilePic)
                                                            .toString(),
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                            progress) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                            url, error) =>
                                                            Icon(
                                                              Icons.person,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                  0.59),
                                                              size: 50.sp,
                                                            )
                                                      // Image.asset(
                                                      //     "assets/user.png",
                                                      //     color:
                                                      //     Colors.white)

                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5.h,),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            ]
                        )

                    ),
                    SizedBox(height: 5.h,),
                    Center(
                      child: Container(
                        height: 5.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.black
                        ),
                      ),
                    ),
                    Center(
                      child: Text("我已体验的点子", style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "simsan"
                      ),),
                    ),
                    userprofile?.data?.experiencedIdeasList?.length == 0
                        ? Container(
                        height: 20.h, child: Center(
                      child: Text("没有想法经验", style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontFamily: "simsan")),
                    ))
                        : Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Column(
                            children: [
                              for(int index1 = 0; index1 <
                                  (userprofile?.data?.experiencedIdeasList
                                      ?.length ?? 0); index1++)...[
                                (index1%2==0)?
                                Container(
                                        margin:EdgeInsets.only(left:10.w,right:50.w),
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start ,
                                    children: [
                                      Text(userprofile?.data?.experiencedIdeasList?[index1].date ?? "",style: TextStyle(
                                          color: Color(0xffb333333),
                                          fontSize: 14.sp,
                                          fontFamily: "simsan"
                                      ),),
                                      SizedBox(height: 5.h,),
                                      Column(
                                          children:[
                                            for(int index = 0; index <
                                                (userprofile?.data?.experiencedIdeasList?[index1].idealist
                                                    ?.length ?? 0); index++)...[
                                                Column(
                                                  children:[
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text((userprofile?.data
                                                              ?.experiencedIdeasList?[index1].idealist?[index].ideaTitle == null ||
                                                              userprofile?.data
                                                                  ?.experiencedIdeasList?[index1].idealist?[index].ideaTitle == ''
                                                              ? 'N/A'
                                                              : userprofile?.data
                                                              ?.experiencedIdeasList?[index1].idealist?[index].ideaTitle).toString(),
                                                            style: TextStyle(
                                                                color: Color(0xffb333333),
                                                                fontSize: 14.sp,
                                                                fontFamily: "simsan"
                                                            ),),
                                                        ),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Icon(userprofile?.data
                                                                ?.experiencedIdeasList?[index1].idealist?[index].isExperienced == 0
                                                                ? Icons
                                                                .check_circle_outline_rounded
                                                                : Icons.check_circle_rounded,
                                                              size: 24.sp,),
                                                            SizedBox(width: 10.w,),
                                                            userprofile?.data
                                                                ?.experiencedIdeasList?[index1].idealist?[index].isCollected == 0 ? Icon(
                                                              Icons.favorite_border,
                                                              color: Color(0xff000000),
                                                              size: 24.sp,) : Icon(
                                                              Icons.favorite,
                                                              color: Color(0xffbD05454),
                                                              size: 24.sp,)
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 5.h,),
                                                    Divider(color: Colors.black,),
                                                    SizedBox(height: 5.h,),
                                                  ]
                                                )
                                            ]
                                      ]
                                      )



                                    ],
                                  ),
                                ):
                                Container(
                                  margin:EdgeInsets.only(left:50.w,right:10.w),
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.end ,
                                    children: [
                                      Text(userprofile?.data?.experiencedIdeasList?[index1].date ?? "",style: TextStyle(
                                      color: Color(0xffb333333),
                                          fontSize: 14.sp,
                                          fontFamily: "simsan"
                                      ),),
                                      SizedBox(height:5.h),
                                      Column(
                                          children:[
                                            for(int index = 0; index <
                                                (userprofile?.data?.experiencedIdeasList?[index1].idealist
                                                    ?.length ?? 0); index++)...[
                                              Column(
                                                  children:[
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            userprofile?.data
                                                                ?.experiencedIdeasList?[index1].idealist?[index].isCollected == 0 ? Icon(
                                                              Icons.favorite_border,
                                                              color: Color(0xff000000),
                                                              size: 24.sp,) : Icon(
                                                              Icons.favorite,
                                                              color: Color(0xffbD05454),
                                                              size: 24.sp,),
                                                            SizedBox(width: 10.w,),
                                                            Icon(userprofile?.data
                                                                ?.experiencedIdeasList?[index1].idealist?[index].isExperienced == 0
                                                                ? Icons
                                                                .check_circle_outline_rounded
                                                                : Icons.check_circle_rounded,
                                                              size: 24.sp,),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Text((userprofile?.data
                                                              ?.experiencedIdeasList?[index1].idealist?[index].ideaTitle == null ||
                                                              userprofile?.data
                                                                  ?.experiencedIdeasList?[index1].idealist?[index].ideaTitle == ''
                                                              ? 'N/A'
                                                              : userprofile?.data
                                                              ?.experiencedIdeasList?[index1].idealist?[index].ideaTitle).toString(),
                                                            style: TextStyle(
                                                                color: Color(0xffb333333),
                                                                fontSize: 14.sp,
                                                                fontFamily: "simsan"
                                                            ),),
                                                        ),
                                                        
                                                      ],
                                                    ),
                                                    SizedBox(height: 5.h,),
                                                    Divider(color: Colors.black,),
                                                    SizedBox(height: 5.h,),
                                                  ]
                                              )
                                            ]
                                          ]
                                      )


                                    ],
                                  ),
                                )
                              ]
                            ]
                        )
                    ),
                    SizedBox(height: 0.h,),
                    Center(
                      child: Container(
                        height: 5.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.black
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Center(
                      child: Text("我已收藏的点子", style: TextStyle(
                        color: Color(0xffb333333),
                        fontSize: 17.sp,
                        fontFamily: "simsan",
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    SizedBox(height: 0.h,),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                     
                      child: userprofile?.data?.collectedIdeasList?.length == 0
                          ? Container(
                          height: 20.h, child: Center(
                        child: Text("没有收集的想法",
                            style: TextStyle(color: Colors.black,
                                fontSize: 11.sp,
                                fontFamily: "simsan")),
                      ))
                          :Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Column(
                              children: [
                                for(int index1 = 0; index1 <
                                    (userprofile?.data?.collectedIdeasList?.length ?? 0); index1++)...[
                                  (index1%2==0)? 
                                      
                                      Container(
                                    margin:EdgeInsets.only(left:10.w,right:50.w),
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.start ,
                                      children: [
                                        Text(userprofile?.data?.collectedIdeasList?[index1].date ?? "",style: TextStyle(
                                            color: Color(0xffb333333),
                                            fontSize: 14.sp,
                                            fontFamily: "simsan"
                                        ),),
                                        SizedBox(height:5.h),
                                        Column(
                                            children:[
                                              for(int index = 0; index <
                                                  (userprofile?.data?.collectedIdeasList?[index1].idealist1?.length ?? 0); index++)...[
                                                Column(
                                                    children:[
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text((userprofile?.data
                                                                ?.collectedIdeasList?[index1].idealist1?[index].ideaTitle == null ||
                                                                userprofile?.data
                                                                    ?.collectedIdeasList?[index1].idealist1?[index].ideaTitle == ''
                                                                ? 'N/A'
                                                                : userprofile?.data
                                                                ?.collectedIdeasList?[index1].idealist1?[index].ideaTitle).toString(),
                                                              style: TextStyle(
                                                                  color: Color(0xffb333333),
                                                                  fontSize: 14.sp,
                                                                  fontFamily: "simsan"
                                                              ),),
                                                          ),
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Icon(userprofile?.data
                                                                  ?.collectedIdeasList?[index1].idealist1?[index].isExperienced == 0
                                                                  ? Icons
                                                                  .check_circle_outline_rounded
                                                                  : Icons.check_circle_rounded,
                                                                size: 24.sp,),
                                                              SizedBox(width: 10.w,),
                                                              userprofile?.data
                                                                  ?.collectedIdeasList?[index1].idealist1?[index].isCollected == 0 ? Icon(
                                                                Icons.favorite_border,
                                                                color: Color(0xff000000),
                                                                size: 24.sp,) : Icon(
                                                                Icons.favorite,
                                                                color: Color(0xffbD05454),
                                                                size: 24.sp,)
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 5.h,),
                                                      Divider(color: Colors.black,),
                                                      SizedBox(height: 5.h,),
                                                    ]
                                                )
                                              ]
                                            ]
                                        )


                                      ],
                                    ),
                                  ):
                                      
                                      Container(
                                    margin:EdgeInsets.only(left:50.w,right:10.w),
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.end ,
                                      children: [
                                        Text(userprofile?.data?.collectedIdeasList?[index1].date ?? ""),
                                        SizedBox(height:5.h),
                                        Column(
                                            children:[
                                              for(int index = 0; index <
                                                  (userprofile?.data?.collectedIdeasList?[index1].idealist1
                                                      ?.length ?? 0); index++)...[
                                                Column(
                                                    children:[
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              userprofile?.data
                                                                  ?.collectedIdeasList?[index1].idealist1?[index].isCollected == 0 ? Icon(
                                                                Icons.favorite_border,
                                                                color: Color(0xff000000),
                                                                size: 24.sp,) : Icon(
                                                                Icons.favorite,
                                                                color: Color(0xffbD05454),
                                                                size: 24.sp,),
                                                              SizedBox(width: 10.w,),
                                                              Icon(userprofile?.data
                                                                  ?.collectedIdeasList?[index1].idealist1?[index].isExperienced == 0
                                                                  ? Icons
                                                                  .check_circle_outline_rounded
                                                                  : Icons.check_circle_rounded,
                                                                size: 24.sp,),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Text((userprofile?.data
                                                                ?.collectedIdeasList?[index1].idealist1?[index].ideaTitle == null ||
                                                                userprofile?.data
                                                                    ?.collectedIdeasList?[index1].idealist1?[index].ideaTitle == ''
                                                                ? 'N/A'
                                                                : userprofile?.data
                                                                ?.collectedIdeasList?[index1].idealist1?[index].ideaTitle).toString(),
                                                              style: TextStyle(
                                                                  color: Color(0xffb333333),
                                                                  fontSize: 14.sp,
                                                                  fontFamily: "simsan"
                                                              ),),
                                                          ),

                                                        ],
                                                      ),
                                                      SizedBox(height: 5.h,),
                                                      Divider(color: Colors.black,),
                                                      SizedBox(height: 5.h,),
                                                    ]
                                                )
                                              ]
                                            ]
                                        )


                                      ],
                                    ),
                                  )
                                ]
                              ]
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(

                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Color(0xffb880A0A).withOpacity(0.88),
                            BlendMode.srcOver,
                          ),
                          image:AssetImage("assets/backdrop.jpg"),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h,),
                        Center(
                          child: Container(
                            height: 5.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Center(
                          child: Text("我关注的人", style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "simsan"
                          ),),
                        ),
                        SizedBox(height: 5.h,),
                        ifollowmodal?.data?.length == 0 ?
                        Container(
                            padding: EdgeInsets.all(15.w),
                            height: 155.h,
                            child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50.w,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        80),
                                    child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: "https://cdn.pixabay.com/photo/2023/06/29/12/22/snow-leopard-8096293_640.png",
                                        progressIndicatorBuilder:
                                            (context, url, progress) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url,
                                            error) =>
                                            Image.asset(
                                                "assets/user.png",
                                                color:
                                                Colors.white)),),

                                ),
                                SizedBox(height: 2.h,),
                                Text("Vikas", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontFamily: "simsan"
                                ),),
                                SizedBox(height: 2.h,),
                                Container(
                                    height: 30.h,
                                    width: 80.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius
                                            .circular(10.0),
                                       border:Border.all( color: Colors.white
                                           .withOpacity(0.8))
                                    ),
                                    child: Center(
                                      child: Text(
                                        "取消关注", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.sp,
                                          fontFamily: "simsan"
                                      ),),
                                    )
                                ),
                                SizedBox(height: 5.h,),
                                Container(
                                    height: 30.h,
                                    width: 80.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius
                                            .circular(10.0),
                                        color: Colors.white
                                            .withOpacity(0.8)
                                    ),
                                    child: Center(
                                      child: Text("发起会话",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.sp,
                                            fontFamily: "simsan"
                                        ),),
                                    )
                                ),
                              ],
                            )

                        )) :
                        Container(
                          height: 200.h,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          padding: EdgeInsets.all(15.w),
                          child:ListView.builder(
                              shrinkWrap: true,
                              scrollDirection:Axis.horizontal,
                              physics:ScrollPhysics(),
                              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              //     crossAxisCount: 4,
                              //     crossAxisSpacing: 10.0,
                              //     mainAxisSpacing: 10.0,
                              //     childAspectRatio: 0.5
                              // ),
                              itemCount: ifollowmodal?.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print(
                                                ifollowmodal?.data?[index]
                                                    .followersUserId);
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    (Nineteenone(
                                                        user: ifollowmodal
                                                            ?.data?[index]
                                                            .followersUserId))));
                                          },
                                          child: Container(
                                            height: 60.w,
                                            width: 60.w,

                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.blue,
                                                  Colors.pink
                                                ],
                                                begin: Alignment
                                                    .topCenter,
                                                end: Alignment
                                                    .bottomCenter,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(80),
                                              child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: ifollowmodal
                                                      ?.data?[index]
                                                      .profilePicture ??
                                                      "",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                      progress) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget: (context,
                                                      url, error) =>
                                                      Icon(
                                                        Icons.person,
                                                        color: Colors
                                                            .white
                                                            .withOpacity(
                                                            0.59),
                                                        size: 50.sp,
                                                      )
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.h,),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 30.h,
                                          child: Text(
                                            ifollowmodal?.data?[index]
                                                .name ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.sp,
                                                fontFamily: "simsan"
                                            ),),
                                        ),
                                        SizedBox(height: 5.h,),
                                        (widget.user.toString() ==
                                            userdata?.userData?.id
                                                .toString())
                                            ? GestureDetector(
                                          onTap: () {
                                            unfollowap((ifollowmodal
                                                ?.data?[index]
                                                .followersUserId)
                                                .toString());
                                          },
                                          child: Container(
                                              height: 30.h,
                                              width: 80.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(10.0),
                                                  border: Border.all( color: Colors.white
                                                      .withOpacity(0.8))

                                              ),
                                              child: Center(
                                                child: Text("取消关注",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11.sp,
                                                      fontFamily: "simsan"
                                                  ),),
                                              )
                                          ),
                                        )
                                            : Container(),
                                        SizedBox(height: 5.h,),
                                        GestureDetector(
                                          onTap: () {
                                            print("hjhhdjf");
                                            Get.to(Twentyfive(
                                                from:ifollowmodal?.data?[index]
                                                .followersUserId,
                                            photo:ifollowmodal?.data?[index]
                                                .profilePicture,
                                            name: ifollowmodal?.data?[index]
                                                .name,));


                                          },
                                          child: Container(
                                              height: 30.h,
                                              width: 80.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(10.0),
                                                  color: Colors.white
                                                      .withOpacity(0.8)
                                              ),
                                              child: Center(
                                                child: Text("发起会话",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11.sp,
                                                      fontFamily: "simsan"
                                                  ),),
                                              )
                                          ),
                                        )
                                      ]

                                  ),
                                );
                              }),
                        ),
                        // SizedBox(height: 5.h,),
                        Center(
                          child: Container(
                            height: 5.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Center(
                          child: Text("关注我的人", style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "simsan"
                          ),),
                        ),
                        followmemodal?.data?.length == 0
                            ? Container(
                            padding: EdgeInsets.all(15.w),
                            // height: 95.h,
                            child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start,
                                  children: [
                                    Container(
                                      height: 50.w,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius
                                            .circular(80),
                                        child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: "https://cdn.pixabay.com/photo/2023/06/25/08/46/woman-8086721_640.jpg",
                                            progressIndicatorBuilder:
                                                (context, url,
                                                progress) =>
                                                CircularProgressIndicator(),
                                            errorWidget: (context,
                                                url, error) =>
                                                Image.asset(
                                                    "assets/user.png",
                                                    color:
                                                    Colors.black)),),

                                    ),
                                    SizedBox(height: 2.h,),
                                    Text("Bhavik", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.sp,
                                        fontFamily: "simsan"
                                    ),),
                                    SizedBox(height: 2.h,),
                                    Container(
                                        height: 30.h,
                                        width: 80.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .circular(10.0),
                                            color: Colors.white
                                                .withOpacity(0.8)
                                        ),
                                        child: Center(
                                          child: Text(
                                            "关注TA", style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                              fontFamily: "simsan"
                                          ),),
                                        )
                                    ),
                                    SizedBox(height: 5.h,),
                                    GestureDetector(
                                      onTap: () {
                                       
                                      },
                                      child: Container(
                                          height: 30.h,
                                          width: 80.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(10.0),
                                              color: Colors.white
                                                  .withOpacity(0.8)
                                          ),
                                          child: Center(
                                            child: Text("发起会话",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                  fontFamily: "simsan"
                                              ),),
                                          )
                                      ),
                                    )
                                  ],
                                )
                            )
                        )
                            :
                        Container(
                          padding: EdgeInsets.all(15.w),
                          height: 200.h,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,

                          child:
                          ListView.builder(

                              shrinkWrap: true,
                              scrollDirection:Axis.horizontal,
                              physics:ScrollPhysics(),
                              itemCount: followmemodal?.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print("lenght");
                                            print(followmemodal?.data
                                                ?.length);
                                            print(followmemodal
                                                ?.data?[index]
                                                .followingUserId);
                                            Navigator.of(context)
                                                .push(
                                                MaterialPageRoute(
                                                    builder: (
                                                        context) =>
                                                    (Nineteenone(
                                                        user: followmemodal
                                                            ?.data?[index]
                                                            .followingUserId))));
                                          },
                                          child: Container(
                                            height: 60.w,
                                            width: 60.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.blue,
                                                  Colors.pink
                                                ],
                                                begin: Alignment
                                                    .topCenter,
                                                end: Alignment
                                                    .bottomCenter,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(80),
                                              child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: followmemodal
                                                      ?.data?[index]
                                                      .profilePicture ??
                                                      "",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                      progress) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget: (
                                                      context, url,
                                                      error) =>
                                                      Icon(
                                                        Icons.person,
                                                        color: Colors
                                                            .white
                                                            .withOpacity(
                                                            0.59),
                                                        size: 50.sp,
                                                      )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.h,),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 30.h,
                                          child: Text(
                                            followmemodal
                                                ?.data?[index]
                                                .name ?? "",
                                            textAlign: TextAlign
                                                .center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.sp,
                                                fontFamily: "simsan"
                                            ),),
                                        ),
                                        SizedBox(height: 5.h,),
                                        (widget.user.toString() ==
                                            userdata?.userData?.id
                                                .toString())
                                            ? GestureDetector(
                                          onTap: () {
                                            followup(
                                                (followmemodal
                                                    ?.data?[index]
                                                    .followingUserId)
                                                    .toString()
                                            );
                                          },
                                          child: Container(
                                              height: 30.h,
                                              width: 80.w,
                                              alignment: Alignment
                                                  .center,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(10.0),
                                                  color: Colors.white
                                                      .withOpacity(
                                                      0.8)

                                              ),
                                              child: Center(
                                                child: Text(
                                                  "关注TA",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .black,
                                                      fontSize: 11.sp,
                                                      fontFamily: "simsan"
                                                  ),),

                                              )
                                          ),
                                        )
                                            : Container(),
                                        SizedBox(height: 5.h,),
                                        GestureDetector(
                                          onTap: () {
                                            print("Abc");
                                            Get.to(Twentyfive(from:followup(
                                                (followmemodal
                                                    ?.data?[index]
                                                    .followingUserId)
                                                    .toString()
                                            )));

                                          },
                                          child: Container(
                                              height: 30.h,
                                              width: 80.w,
                                              alignment: Alignment
                                                  .center,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(10.0),
                                                  color: Colors.white
                                                      .withOpacity(
                                                      0.8)
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "发起会话",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .black,
                                                      fontSize: 11.sp,
                                                      fontFamily: "simsan"
                                                  ),),

                                              )
                                          ),
                                        )
                                      ]
                                  ),
                                );
                              }),
                        ),
                        // SizedBox(height: 5.h,),
                        (widget.user.toString() ==
                            userdata?.userData?.id.toString()) ?
                        Column(
                          children: [
                            Center(
                              child: Container(
                                height: 5.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        0),
                                    color: Colors.white
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            //++ recommanded friend
                            Center(
                              child: Text(
                                "相似灵魂推荐", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "simsan"
                              ),),
                            ),
                            SizedBox(height: 5.h,),
                            // Padding(
                            //   padding: EdgeInsets.all(15.w),
                            //     // 以下用户也体验了
                            //   child: Text("#别在伤口撒盐 ",style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 17.sp,
                            //       fontFamily: "simsan"
                            //   ),),
                            // ),
                            recommendedfriendmodal?.status == "fail" ?
                            Container(
                                padding: EdgeInsets.all(15.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start,
                                  children: [
                                    Container(
                                      height: 50.w,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius
                                            .circular(80),
                                        child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: "https://cdn.pixabay.com/photo/2023/06/29/12/22/snow-leopard-8096293_640.png",
                                            progressIndicatorBuilder:
                                                (context, url,
                                                progress) =>
                                                CircularProgressIndicator(),
                                            errorWidget: (context, url,
                                                error) =>
                                                Image.asset(
                                                    "assets/user.png",
                                                    color:
                                                    Colors.white)),),

                                    ),
                                    SizedBox(height: 2.h,),
                                    Text("jay", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.sp,
                                        fontFamily: "simsan"
                                    ),),
                                    SizedBox(height: 2.h,),
                                    Container(
                                        height: 30.h,
                                        width: 80.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .circular(10.0),
                                            color: Colors.white
                                                .withOpacity(0.8)
                                        ),
                                        child: Center(
                                          child: Text(
                                            "关注TA", style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                              fontFamily: "simsan"
                                          ),),
                                        )
                                    ),
                                    GestureDetector(
                                      onTap: () {

                                      },
                                      child: Container(
                                          height: 30.h,
                                          width: 80.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(10.0),
                                              color: Colors.white
                                                  .withOpacity(0.8)
                                          ),
                                          child: Center(
                                            child: Text("发起会话",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                  fontFamily: "simsan"
                                              ),),
                                          )
                                      ),
                                    )
                                  ],
                                )
                            ) :
                            Container(

                                height: 200.h,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                padding: EdgeInsets.all(15.w),
                                child:
                                ListView.builder(
                                    shrinkWrap: true,

                                    scrollDirection:Axis.horizontal,
                                    physics:ScrollPhysics(),
                                    itemCount: recommendedfriendmodal
                                        ?.data?.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:EdgeInsets.symmetric(horizontal: 5.w),
                                        child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  print("hiii");
                                                  Navigator.of(context)
                                                      .push(
                                                      MaterialPageRoute(
                                                          builder: (
                                                              context) =>
                                                          (Nineteenone(
                                                              user: recommendedfriendmodal
                                                                  ?.data?[index]
                                                                  .userId))));
                                                },
                                                child: Container(
                                                  height: 60.w,
                                                  width: 60.w,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.blue,
                                                        Colors.pink
                                                      ],
                                                      begin: Alignment
                                                          .topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                    ),

                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius
                                                        .circular(80),
                                                    child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: recommendedfriendmodal
                                                            ?.data?[index]
                                                            .profilePicture ??
                                                            "",
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                            progress) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (
                                                            context, url,
                                                            error) =>
                                                            Icon(
                                                              Icons.person,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                  0.59),
                                                              size: 50.sp,
                                                            )),),
                                                ),
                                              ),
                                              SizedBox(height: 5.h,),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 30.h,
                                                child: Text(
                                                  recommendedfriendmodal
                                                      ?.data?[index].name ??
                                                      "",
                                                  textAlign: TextAlign
                                                      .center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11.sp,
                                                      fontFamily: "simsan"
                                                  ),),
                                              ),
                                              SizedBox(height: 5.h,),
                                              GestureDetector(
                                                onTap: () {
                                                  followup(
                                                      (recommendedfriendmodal
                                                          ?.data?[index]
                                                          .userId)
                                                          .toString());
                                                  print("5545");
                                                },
                                                child: Container(
                                                    height: 30.h,
                                                    width: 80.w,
                                                    alignment: Alignment
                                                        .center,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(10.0),
                                                     border: Border.all( color: Colors
                                                         .white
                                                         .withOpacity(
                                                         0.8),)
                                                    ),
                                                    child: Text("关注TA",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white
                                                              .withOpacity(
                                                              0.8),
                                                          fontSize: 11.sp,
                                                          fontFamily: "simsan"
                                                      ),)
                                                ),
                                              ),
                                              // SizedBox(height: 5.h,),
                                              // GestureDetector(
                                              //   onTap: () {
                                              //
                                              //   },
                                              //   child: Container(
                                              //       height: 30.h,
                                              //       width: 80.w,
                                              //       alignment: Alignment
                                              //           .center,
                                              //       decoration: BoxDecoration(
                                              //         borderRadius: BorderRadius
                                              //             .circular(10.0),
                                              //           color: Colors
                                              //               .white
                                              //               .withOpacity(
                                              //               0.8),
                                              //       ),
                                              //       child: Text("发起会话",
                                              //         style: TextStyle(
                                              //             color: Colors
                                              //                 .black
                                              //                 .withOpacity(
                                              //                 0.8),
                                              //             fontSize: 11.sp,
                                              //             fontFamily: "simsan"
                                              //         ),)
                                              //   ),
                                              // )
                                            ]
                                        ),
                                      );
                                    })
                            ),
                            SizedBox(height: 5.h,),
                          ],
                        ) : Container()
                        // Padding(
                        //   padding: EdgeInsets.all(15.w),
                        //   child: Text("以下用户也体验了 #在巴黎铁塔下搔首弄姿挥舞丝巾 ",style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 17.sp,
                        //       fontFamily: "simsan"
                        //   ),),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal:15.w),
                        //   child: Column(
                        //       children:[
                        //         Container(
                        //           height: 60.w,
                        //           width: 60.w,
                        //           decoration:BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               color: Colors.white,
                        //               image: DecorationImage(
                        //                   image: NetworkImage(
                        //                       image1[1].image
                        //                   ),
                        //                   fit: BoxFit.cover
                        //               )
                        //           ),
                        //         ),
                        //         SizedBox(height: 5.h,),
                        //         Text(image1[1].title,style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 11.sp,
                        //             fontFamily: "simsan"
                        //         ),),
                        //         SizedBox(height: 5.h,),
                        //         GestureDetector(
                        //           onTap: (){},
                        //           child: Container(
                        //               height: 30.h,
                        //               width: 80.w,
                        //               alignment: Alignment.center,
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(10.0),
                        //                   color: Colors.white.withOpacity(0.8),
                        //               ),
                        //               child:  Text("关注TA",style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontSize: 11.sp,
                        //                   fontFamily: "simsan"
                        //               ),)
                        //           ),
                        //         )
                        //       ]
                        //   ),
                        // ),
                        // SizedBox(height: 20.h,),
                      ],
                    ),
                    //     .cover),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textstyle = TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontFamily: "simsan"
  );
  TextStyle textstyle1 = TextStyle(
      color: Colors.white,
      fontSize: 35.sp,
      fontFamily: "simsan"
  );

  userpfdata() {
    final Map<String, String> data = {};
    data['user_id'] = widget.user.toString();
    data['login_user_id'] = userdata?.userData?.id ?? "";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().userprofileapi(data).then((response) async {
          userprofile = Userprofile.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && userprofile?.status == "success") {

            per = 100 -
                ((double.parse((userprofile?.data?.noOfExperienced).toString()) *
                    double.parse((userprofile?.data?.noOfCollected).toString())) /
                    100);
            print(per);
            setState(() {
              per;
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


  ifollowap() {
    final Map<String, String> data = {};
    data['user_id'] = widget.user.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().ifollowlistapi(data).then((response) async {
          ifollowmodal = Ifollowmodal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && ifollowmodal?.status == "success") {
            print(ifollowmodal?.data?.length);
            // followmeap();
            // recommdedfriendlist();
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
  deleteclimevent(String? value) {
    final Map<String, String> data = {};
    data['event_id'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().climeventdeleteapi(data).then((response) async {
          eventdeletemodal = EventDeleteModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && eventdeletemodal?.status == "success") {
print("adjfkdjskfjdfs");

            claimap();
            Get.back();
            // followmeap();
            // recommdedfriendlist();
            setState(() {
              // isLoading = false;
            });

          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  followmeap() {
    final Map<String, String> data = {};
    data['user_id'] = widget.user.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().followmelistapi(data).then((response) async {
          followmemodal = FollowedmeModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              followmemodal?.status == "success") {
            print(followmemodal?.data?.length);
            // ifollowap();

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

  unfollowap(String? value) {
    final Map<String, String> data = {};
    data['user_1'] = userdata?.userData?.id ?? "";
    data['user_2'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().unfloowapi(data).then((response) async {
          unfollowusermodal =
              UnfollowuserModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              unfollowusermodal?.status == "success") {
            print(unfollowusermodal?.status);

            ifollowap();
            // followmeap();
            // recommdedfriendlist();
            userpfdata();
            buildErrorDialog(context, '', "您成功取消关注");
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

  followup(String value) {
    final Map<String, String> data = {};
    data['user_1'] = userdata?.userData?.id ?? "";
    data['user_2'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().floowapi(data).then((response) async {
          followusermodal =
              FollowuserModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              followusermodal?.status == "success") {
            print(followusermodal?.status);
            ifollowap();
            // followmeap();
            recommdedfriendlist();
            userpfdata();
            buildErrorDialog(context, '', "您关注成功");
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

  recommdedfriendlist() {
    final Map<String, String> data = {};
    data['login_user_id'] = userdata?.userData?.id ?? "";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().recommdefrapi(data).then((response) async {
          recommendedfriendmodal =
              RecommendedFriendModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              recommendedfriendmodal?.status == "success") {
            print(recommendedfriendmodal?.status);
            ifollowap();
            // followmeap();
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

  ratingap() {
    final Map<String, String> data = {};
    data['login_user_id'] = userdata?.userData?.id ?? "";
    data['event_organiser_id'] = widget.user.toString();
    data['rating'] = _rating.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().ratingapi(data).then((response) async {
          ratingmodal = Ratingmodal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && ratingmodal?.status == "success") {
            print(ratingmodal?.status);
            ifollowap();
            // followmeap();
            setState(() {
              // isLoading = false;
            });
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  generatepdfap() {
    final Map<String, String> data = {};
    data['user_id'] = widget.user.toString();


    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().generatepdfapi(data).then((response) async {
          pdfmodal = GeneratePdfModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && pdfmodal?.status == "success") {
            per1 = 100 -
                ((double.parse((pdfmodal?.data?.exprienceCount).toString()) *
                    double.parse((pdfmodal?.data?.ideaOwned).toString())) /
                    100);

            ifollowap();
            // followmeap();
            setState(() {
              // isLoading = false;
            });
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  Future<void> downloaddata() async {
    setState(() {
      _isLoading = true;
      EasyLoading.show(status: 'Downloading...');
    });

    final pdf = pw.Document();
    final imageProvider = await loadImageFromAsset('assets/img23.jpg');
    final imageProvider1 = await loadImageFromAsset('assets/img 4.png');
    final imageProvider2 = await loadImageFromAsset('assets/img25.png');
    final imageUrl = (pdfmodal?.data?.profilePicture).toString();
    final imageBytes = await fetchImage(imageUrl);
    final pdfWidget = pw.Stack(children: [
      pw.Container(
          width: double.infinity,
          height: double.infinity,
          decoration: pw.BoxDecoration(
            image: pw.DecorationImage(
              image: imageProvider,
              fit: pw.BoxFit.cover,
            ),
          ),
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 10),
                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 15),
                  child: pw.Image(imageProvider1, width: 60, height: 34),
                ),

                pw.Container(
                  padding: pw.EdgeInsets.all(15),
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Container(
                        height: 80.w,
                        // width: 80.w,
                        alignment: pw.Alignment.center,
                        child: pw.Text(
                          pdfmodal?.data?.name == null
                              ? "姓名"
                              : pdfmodal?.data?.name ?? "",
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 16,
                            font: await yourFont(),
                            // font: pw.Font.helvetica(),
                          ),
                        ),
                      ),
                      pw.SizedBox(
                        width: 10.w,
                      ),
                      imageUrl==null||imageUrl==""?pw.ClipOval(
                        child: pw.Container(
                          width: 80,
                          height: 80,
                          decoration: pw.BoxDecoration(
                              shape: pw.BoxShape.circle,
                              image: pw.DecorationImage(
                                  image:imageProvider)),
                        ),
                      ):pw.ClipOval(
                        child: pw.Container(
                          width: 80,
                          height: 80,
                          decoration: pw.BoxDecoration(
                              shape: pw.BoxShape.circle,
                              image: pw.DecorationImage(
                                  image: pw.MemoryImage(
                                      Uint8List.fromList(imageBytes)))),
                        ),
                      ),
                    ],
                  ),
                ),
                // pw.SizedBox(
                //   height:10.h
                // ),
                pw.Opacity(
                  opacity: 0.7,
                  child: pw.Container(
                    padding: pw.EdgeInsets.all(15.w),
                    margin: pw.EdgeInsets.only(left: 20.w),
                    decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.only(
                            topLeft: pw.Radius.circular(30),
                            bottomLeft: pw.Radius.circular(30))),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "截至今天,我已经在嘛呢。",
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 17.sp,
                            font: await yourFont(),
                            // font:pw.Font.helvetica(),

                            // fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(
                          height: 2.h,
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.only(left: 10.w),
                          child: pw.Row(
                            children: [
                              pw.Text(
                                "体验了",
                                style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 14.sp,
                                  font: await yourFont(),
                                ),
                              ),
                              pw.Text(
                                  pdfmodal?.data?.exprienceCount == "" ||
                                      pdfmodal?.data?.exprienceCount == null
                                      ? "0"
                                      : (pdfmodal?.data?.exprienceCount)
                                      .toString(),
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 40.sp,
                                    font: await yourFont(),
                                  )),
                              pw.Text("个点子",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 14.sp,
                                    font: await yourFont(),
                                  )),
                            ],
                          ),
                        ),
                        pw.SizedBox(
                          height: 2.h,
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.only(left: 0.w),
                          child: pw.Row(
                            children: [
                              pw.Text("收藏了",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 14.sp,
                                    font: await yourFont(),
                                  )),
                              pw.Text(
                                  pdfmodal?.data?.collectedCount == "" ||
                                      pdfmodal?.data?.collectedCount == null
                                      ? "0"
                                      : (pdfmodal?.data?.collectedCount)
                                      .toString(),
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 40.sp,
                                    font: await yourFont(),
                                  )),
                              pw.Text("个点子",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 14.sp,
                                    font: await yourFont(),
                                  )),
                            ],
                          ),
                        ),
                        pw.SizedBox(
                          height: 2.h,
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.only(left: 10.w),
                          child: pw.Row(
                            children: [
                              pw.Text("体验数超过了",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 14.sp,
                                    font: await yourFont(),
                                  )),
                              pw.Text(
                                  pdfmodal?.data?.collectedCount == "" ||
                                      pdfmodal?.data?.collectedCount == null
                                      ? "0"
                                      : (per?.toStringAsFixed(2)).toString() +
                                      "%",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 40.sp,
                                    font: await yourFont(),
                                  )),
                              pw.Text("的嘛呢用户",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 14.sp,
                                    font: await yourFont(),
                                  )),
                            ],
                          ),
                        ),
                        pw.SizedBox(
                          height: 2.h,
                        ),
                        pw.Text(" 因为你的存在让我们这一物种变得更加有趣！",
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 14.sp,
                              font: await yourFont(),
                            )),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(
                  height: 5.h,
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 15.w),
                  child: pw.Text(
                    "我最近体验过的5个点子是...",
                    style: pw.TextStyle(
                      color: PdfColors.white,
                      fontSize: 17.sp,
                      font: await yourFont(),
                      // fontFamily: "simsan",
                    ),
                  ),
                ),
                // pw.SizedBox(
                //   height: 5.h,
                // ),
                pw.Opacity(
                  opacity: 0.77,
                  child: pw.Container(
                    // height:160.h,
                      padding: pw.EdgeInsets.all(15.w),
                      margin: pw.EdgeInsets.only(right: 25.w),
                      decoration: pw.BoxDecoration(
                        // color: Colors.white.withOpacity(0.77),
                          color: PdfColors.white,
                          borderRadius: pw.BorderRadius.only(
                              topRight: pw.Radius.circular(30),
                              bottomRight: pw.Radius.circular(30))),
                      child: pdfmodal?.data?.expriencedIdeas?.length == 0
                          ? pw.Container(
                          height: 20.h,
                          child: pw.Center(
                            child: pw.Text("没有想法经验",
                                style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 11.sp,
                                  font: await yourFont(),
                                  // fontFamily: "simsan"
                                )),
                          ))
                          : pw.Column(children: [
                        for (int index = 0;
                        index <
                            (pdfmodal
                                ?.data?.expriencedIdeas?.length ??
                                0);
                        index++) ...[
                          pw.Row(
                            crossAxisAlignment:
                            pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                            pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                (index + 1).toString() + " . ",
                                style: pw.TextStyle(
                                  // color: Color(0xffb333333),
                                  fontSize: 14.sp,
                                  font: await yourFont(),
                                ),
                              ),
                              pw.Expanded(
                                child: pw.Text(
                                  (pdfmodal?.data?.expriencedIdeas?[index]
                                      .ideaTitle ==
                                      null ||
                                      pdfmodal
                                          ?.data
                                          ?.expriencedIdeas?[
                                      index]
                                          .ideaTitle ==
                                          ''
                                      ? 'N/A'
                                      : pdfmodal
                                      ?.data
                                      ?.expriencedIdeas?[index]
                                      .ideaTitle)
                                      .toString(),
                                  maxLines: 2,
                                  // Maximum number of lines before truncating
                                  // Allow text to wrap

                                  style: pw.TextStyle(
                                    color: PdfColors.black,
                                    fontSize: 14.sp,
                                    font: await yourFont(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]
                      ])),
                ),

                pw.SizedBox(
                  height: 20.h,
                ),
                // pw.Container(
                //     // margin: pw.EdgeInsets.symmetric(horizontal: 15.w),
                //     // height:100.h,
                //     color: PdfColors.white,
                //     child: pw.Row(
                //       children: [
                //         pw.Column(
                //           crossAxisAlignment: pw.CrossAxisAlignment.end,
                //           children: [
                //             // Image.asset("assets/barcode.png",height:72.w,width: 72.w,),
                //             pw.Text(
                //               "长按/扫码进入APP下载界面",
                //               style: pw.TextStyle(
                //                   color: PdfColors.black,
                //                   font: await yourFont(),
                //                   fontSize: 8.sp),
                //             )
                //           ],
                //         ),
                //         pw.SizedBox(
                //           width: 10.w,
                //         ),
                //         pw.Column(
                //           children: [
                //             pw.Image(
                //               imageProvider2,
                //               height: 80.h,
                //               width: 87.w,
                //             ),
                //           ],
                //         ),
                //         pw.SizedBox(
                //           width: 10.w,
                //         ),
                //         pw.VerticalDivider(),
                //         pw.SizedBox(
                //           width: 110.w,
                //           child: pw.Column(
                //             crossAxisAlignment: pw.CrossAxisAlignment.start,
                //             children: [
                //               pw.Image(imageProvider1, width: 60, height: 34),
                //               pw.Text(
                //                 "超过30,000+人类体验点子，用15分钟体验一个新奇好玩的点子这个世界哪里无聊了?",
                //                 maxLines: 4,
                //                 style: pw.TextStyle(
                //                   fontSize: 10.sp,
                //                   color: PdfColors.black,
                //                   font: await yourFont(),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ],
                //     ))
              ]))
    ]);

    pdf.addPage(pw.Page(
      build: (pw.Context context) => pdfWidget,
    ));
    // final Directory? directory = await getDownloadsDirectory();
    // final String filePath = '${directory?.path}/my_pdf.pdf';
    const downloadsFolderPath = '/storage/emulated/0/Download';

    Directory dir = Directory(downloadsFolderPath);
    final String filePath = '${dir?.path}/suppchat.pdf';
    print(filePath);
    final File file = File(
        filePath!);
    try {
      await file.writeAsBytes(await pdf.save());
      setState(() {
        _isLoading = false;
        EasyLoading.showSuccess(
            'pdf下载成功');
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        EasyLoading.showSuccess(
            'pdf下载成功');
      });
    }
  }
  claimap() {
    final Map<String, String> data = {};
    data['user_id'] = widget.user.toString();


    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().claimapi(data).then((response) async {
          claimmodal1 = ClaimModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && claimmodal1?.status== "success") {



            // followmeap();
            setState(() {
              // isLoading = false;
            });
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  Future<pw.Font> yourFont() async {
    final fontData = await rootBundle.load(
        'assets/fonts/chinese.msyh.ttf'); // Replace with your font file path
    final fontUint8List = fontData.buffer.asUint8List();
    final fontByteData = ByteData.sublistView(fontUint8List);
    final font = pw.Font.ttf(fontByteData);
    return font;
  }

  Future<pw.MemoryImage> loadImageFromAsset(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    return pw.MemoryImage(Uint8List.fromList(bytes));
  }

  Future<List<int>> fetchImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    return response.bodyBytes;
  }

}


