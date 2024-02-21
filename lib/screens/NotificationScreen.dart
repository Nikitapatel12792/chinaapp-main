import 'dart:convert';
import 'dart:io';
import 'package:chet/Modal/NotificationFollowModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/19.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen> {
  @override
  bool isLoading=true;
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    await notificationfollow();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold:Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Bottomnavbar(
          sel: 3,
        ),
        body: (isLoading)?Container():Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Container(
                      height: 300.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/messageback.png")),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Container(
                        height: 300.h,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(35.w),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 130.h,
                            ),
                            Text(
                              "站内消息",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "simsan"),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "重要的事儿我们只会在这说",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "simsan"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
    notificationfollowmodal?.notifications?.length ==0
       ?Container(child: Center(child: Text("无通知",style:textstyle2 ,)),):Column(
                    children: [
                      for (int index = 0;
                          index <
                              (notificationfollowmodal?.notifications?.length ??
                                  0);
                          index++) ...[
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                notificationfollowmodal?.notifications?[index].type=="follow"?Get.to(Nineteen(user:userdata?.userData?.id,)):
                                notificationfollowmodal?.notifications?[index].type=="envent signuped"?Get.to(Nineteen(user:userdata?.userData?.id,)):
                                notificationfollowmodal?.notifications?[index].type=="envent cancelled"?Get.to(Nineteen(user:userdata?.userData?.id,)):"";
                              },
                     child: Container(

                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(15.w),
                                padding: EdgeInsets.all(15.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color(0xffbE66464),
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
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(notificationfollowmodal
                                                ?.notifications?[index].date ??
                                            "",style: textstyle3,),
                                      ],
                                    ),
                                    SizedBox(height: 5.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(notificationfollowmodal
                                              ?.notifications?[index].title ??
                                              "",style: textstyle2,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(notificationfollowmodal
                                              ?.notifications?[index].content ??
                                              "",style: textstyle3,),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]
                      // Container(
                      //   margin: EdgeInsets.all(15.w),
                      //   padding: EdgeInsets.all(15.w),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     color: Color(0xffbE66464),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey,
                      //         blurRadius: 15.0, // soften the shadow
                      //         spreadRadius: 5.0, //extend the shadow
                      //         offset: Offset(
                      //           5.0, // Move to right 5  horizontally
                      //           5.0, // Move to bottom 5 Vertically
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      //   child:
                      //   Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "2022年11月30日 14:32",
                      //         style: textstyle3,
                      //       ),
                      //       SizedBox(
                      //         height: 5.h,
                      //       ),
                      //       Text(
                      //         "体验活动认领成功",
                      //         style: textstyle2,),
                      //       SizedBox(
                      //         height: 10.h,
                      //       ),
                      //       RichText(
                      //           text: TextSpan(children: [
                      //             TextSpan(
                      //                 text: " 恭喜您，您申请认领的 ",
                      //                 style: textstyle
                      //             ),
                      //             TextSpan(
                      //                 text: "#在早高峰地铁做引体向上 ",
                      //                 style: textstyle1
                      //             ),
                      //             TextSpan(
                      //                 text: "体验已通过审核，现在可以浏览",
                      //                 style:textstyle
                      //             ),
                      //           ])),
                      //       SizedBox(
                      //         height: 10.h,
                      //       ),
                      //       RichText(
                      //           text: TextSpan(children: [
                      //             TextSpan(
                      //               text: " 体验活动发布后则不可更改。您可以前往",
                      //               style: textstyle,
                      //             ),
                      //             TextSpan(
                      //               text: "【我的界面】",
                      //               style: textstyle1,
                      //             ),
                      //             TextSpan(
                      //               text: "删除后重新发布",
                      //               style: textstyle,
                      //             ),
                      //           ])),
                      //       SizedBox(
                      //         height: 10.h,
                      //       ),
                      //       Text(
                      //         " 感谢您的支持，人类族群有了您的存在变得更加有趣！",
                      //         style: textstyle,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.all(15.w),
                      //   padding: EdgeInsets.all(15.w),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     color: Color(0xffbE66464),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey,
                      //         blurRadius: 15.0, // soften the shadow
                      //         spreadRadius: 5.0, //extend the shadow
                      //         offset: Offset(
                      //           5.0, // Move to right 5  horizontally
                      //           5.0, // Move to bottom 5 Vertically
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "2022年11月28日 10:05",
                      //         style: textstyle3,
                      //       ),
                      //       SizedBox(
                      //         height: 5.h,
                      //       ),
                      //       Text(
                      //         "跟史蒂芬没有关系的女人评论了你发布的体验",
                      //         style: textstyle2,
                      //       ),
                      //       SizedBox(
                      //         height: 10.h,
                      //       ),
                      //       RichText(
                      //           text: TextSpan(children: [
                      //             TextSpan(
                      //               text: " 跟史蒂芬没有关系的女人 评论了你发布的体验",
                      //               style: textstyle,
                      //             ),
                      //             TextSpan(
                      //               text: "#在早高峰地铁上做引体向上 ",
                      //               style: textstyle1,
                      //             ),
                      //             TextSpan(
                      //               text: "快去k看看吧！",
                      //               style: textstyle,
                      //             ),
                      //           ])),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.all(15.w),
                      //   padding: EdgeInsets.all(15.w),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     color: Color(0xffbE66464),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey,
                      //         blurRadius: 15.0, // soften the shadow
                      //         spreadRadius: 5.0, //extend the shadow
                      //         offset: Offset(
                      //           5.0, // Move to right 5  horizontally
                      //           5.0, // Move to bottom 5 Vertically
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "2022年9月11日 00:13",
                      //         style: textstyle3,
                      //       ),
                      //       SizedBox(
                      //         height: 5.h,
                      //       ),
                      //       Text(
                      //         "您已成功报名史蒂芬他大舅举办的#在天坛公园吹泡泡糖“体验！",
                      //         style: textstyle2,
                      //       ),
                      //       SizedBox(
                      //         height: 10.h,
                      //       ),
                      //       RichText(
                      //           text: TextSpan(children: [
                      //             TextSpan(
                      //               text: "   您已成功报名",
                      //               style: textstyle,
                      //             ),
                      //             TextSpan(
                      //               text: "史蒂芬他大舅",
                      //               style: textstyle1,
                      //             ),
                      //             TextSpan(
                      //               text: "举办的 ",
                      //               style: textstyle,
                      //             ),
                      //             TextSpan(
                      //               text: " #在天坛公园吹泡泡糖",
                      //               style: textstyle1,
                      //             ),
                      //             TextSpan(
                      //               text: "体验。您可以前往",
                      //               style: textstyle,
                      //             ),
                      //             TextSpan(
                      //               text: "【我的界面】 ",
                      //               style: textstyle1,
                      //             ),
                      //             TextSpan(
                      //               text: "下“我报名的体验”查看。体验当天将",
                      //               style: textstyle,
                      //             ),
                      //             TextSpan(
                      //               text: "【我的界面】",
                      //               style: textstyle1,
                      //             ),
                      //             TextSpan(
                      //               text: "展示给体验主即可完成入场！",
                      //               style: textstyle,
                      //             ),
                      //
                      //           ])),
                      //       SizedBox(
                      //         height: 10.h,
                      //       ),
                      //       Text(
                      //         "  体验当然是一项人民基本权利，让我们榨干肉体最后一丝余热，感受狂喜与悲痛，有你在真好！!",
                      //         style: textstyle,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.all(15.w),
                      //   padding: EdgeInsets.all(15.w),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey,
                      //         blurRadius: 15.0, // soften the shadow
                      //         spreadRadius: 5.0, //extend the shadow
                      //         offset: Offset(
                      //           5.0, // Move to right 5  horizontally
                      //           5.0, // Move to bottom 5 Vertically
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "2022年9月9日 09:30",
                      //         style: textstyle3,
                      //       ),
                      //       SizedBox(
                      //         height: 5.h,
                      //       ),
                      //       Text(
                      //         "邀请您评价体验主史蒂芬他二舅",
                      //         style:textstyle2,
                      //       ),
                      //       SizedBox(
                      //         height: 10.h,
                      //       ),
                      //       RichText(
                      //           text: TextSpan(children: [
                      //             TextSpan(
                      //               text: "您刚刚参加了 ",
                      //               style: textstyle,
                      //             ),
                      //             TextSpan(
                      //               text: "史蒂芬他二舅 ",
                      //               style: textstyle1,
                      //             ),
                      //             TextSpan(
                      //               text: "举办的体验，您的评价对体验主和我们至关重要。",
                      //               style: textstyle,
                      //             ),
                      //           ])),
                      //       SizedBox(
                      //         height: 10.h,
                      //       ),
                      //       Center(
                      //         child: RatingBar.builder(
                      //           initialRating: 4,
                      //           minRating: 1,
                      //           direction: Axis.horizontal,
                      //           allowHalfRating: true,
                      //           itemCount: 5,
                      //           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      //           itemBuilder: (context, _) => Icon(
                      //             Icons.star,
                      //             color: Colors.amber,
                      //           ),
                      //           onRatingUpdate: (rating) {
                      //             print(rating);
                      //           },
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.all(15.w),
                      //   padding: EdgeInsets.all(15.w),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey,
                      //         blurRadius: 15.0, // soften the shadow
                      //         spreadRadius: 5.0, //extend the shadow
                      //         offset: Offset(
                      //           5.0, // Move to right 5  horizontally
                      //           5.0, // Move to bottom 5 Vertically
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "2022年9月1日 22:14",
                      //         style: textstyle3,
                      //       ),
                      //       SizedBox(
                      //         height: 5.h,
                      //       ),
                      //       Text(
                      //         "史蒂芬的小学体育老师关注了您！",
                      //         style: textstyle2,
                      //       ),
                      //       SizedBox(
                      //         height: 10.h,
                      //       ),
                      //       RichText(
                      //           text: TextSpan(children: [
                      //             TextSpan(
                      //               text: "史蒂芬的小学体育老师",
                      //               style: textstyle1,
                      //             ),
                      //             TextSpan(
                      //               text: " 关注了你。前往",
                      //               style: textstyle,
                      //             ),
                      //             TextSpan(
                      //               text: "我的界面】",
                      //               style: textstyle1,
                      //             ),
                      //           ]))
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 50.h,)
                    ],
                  ),
                ]),
              ),
              // Positioned(
              //     top: Platform.isAndroid ? 600.h : 575.h,
              //     child: Container(
              //       width: 360.w,
              //       color: Colors.white,
              //       padding: EdgeInsets.all(5.h),
              //       height: 50.h,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           SizedBox(
              //             width: 290.w,
              //             child: TextField(
              //               decoration: InputDecoration(
              //                 hintText: '開始聊天',
              //                 disabledBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(50),
              //                   borderSide: BorderSide(
              //                       width: 2, color: Colors.grey), //<-- SEE HERE
              //                 ),
              //                 focusedBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(50),
              //                   borderSide: BorderSide(
              //                       width: 2, color: Colors.grey), //<-- SEE HERE
              //                 ),
              //                 enabledBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(50),
              //                   borderSide: BorderSide(
              //                       width: 2, color: Colors.grey), //<-- SEE HERE
              //                 ),
              //               ),
              //             ),
              //           ),
              //           IconButton(onPressed: () {}, icon: Icon(Icons.send))
              //         ],
              //       ),
              //
              //     )),
            )
          ],
        ),
      ),
    );
  }

  TextStyle textstyle = TextStyle(
      color: Color(0xffb2A2424), fontSize: 14.sp, fontFamily: "simsan");
  TextStyle textstyle1 = TextStyle(
      color: Color(0xffb182459), fontSize: 14.sp, fontFamily: "simsan");
  TextStyle textstyle2 = TextStyle(
      color: Color(0xffb2A2424),
      fontSize: 17.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "simsan");
  TextStyle textstyle3 = TextStyle(
    color: Color(0xffb383838),
    fontSize: 14.sp,
    fontFamily: "simsan",
  );
  notificationfollow() {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? "";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().notificationfollowapi(data).then((response) async {
          notificationfollowmodal =
              NotificationFollowModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              notificationfollowmodal?.status == "success") {
            print("ajfkdjfkdsf");
            print(response.statusCode);


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
}
