import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chet/Modal/ComentdisplayModal.dart';
import 'package:chet/Modal/CommentsModal.dart';
import 'package:chet/Modal/DetalisDataModal.dart';
import 'package:chet/Modal/DisplayemotionModal.dart';
import 'package:chet/Modal/EmotionModal.dart';
import 'package:chet/Modal/EventCancelModal.dart';
import 'package:chet/Modal/EventSignupModal.dart';
import 'package:chet/Modal/Experincemodal.dart';
import 'package:chet/Modal/Ratingmodal.dart';
import 'package:chet/Modal/UserProfileModal.dart';
import 'package:chet/Modal/addsubcommentmodal.dart';
import 'package:chet/Modal/catagarymodal%20(1).dart';
import 'package:chet/Modal/collectionModal.dart';
import 'package:chet/Modal/commentlike.dart';
import 'package:chet/Modal/generatepdfmodal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/16%20.dart';
import 'package:chet/screens/FollowScreen.dart';
import 'package:chet/screens/sharedesign.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/imagescreen.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class Tenth extends StatefulWidget {
  String? id;

  Tenth({super.key, this.id});

  @override
  State<Tenth> createState() => _TenthState();
}

class _TenthState extends State<Tenth> {
  TextEditingController _commenttitle = TextEditingController();
  TextEditingController _commentdesc = TextEditingController();
  TextEditingController _subcommenttitle = TextEditingController();
  Userprofile? userprofile;
  int? select = 0;
  var imagePaths;
  String commaSeparated = "";
  GeneratePdfModal? pdfmodal;
  String? user;
  List<File> selectedImages = []; // List of selected image
  ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  int maxImageLimit = 9;
  File? selectedimage;
  int _rating = 0;
  String? filePath;
  bool _isLoading = false;
  String? _currentAddress;
  Position? _currentPosition;
  DisplayemotionModal? emotiondisplay;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  DateTime currentDate = DateTime.now();
  bool set = false;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    await ideadetailap();
    await displayemotionap();
    await commentdisplay();
    await generatepdfap();
  }

  double? per1;
  int _currentSliderSecondaryValue = 0;
  int selected = 1;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        bottomNavigationBar: Bottomnavbar(
          sel: 0,
        ),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/img7.jpg',
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.75),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          // '将耳机音量调小偷听旁人谈话',
                                          detaildatamodal?.data?.ideaName ==
                                                      '' ||
                                                  detaildatamodal
                                                          ?.data?.ideaName ==
                                                      null
                                              ? "N/A"
                                              : detaildatamodal
                                                      ?.data?.ideaName ??
                                                  "",

                                          style: TextStyle(
                                              fontFamily: "simsan",
                                              color: Colors.white,
                                              fontSize: 25.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //     Container(
                                      // height: 5.h,
                                      //
                                      //       width:50.w,
                                      //       child: ListView.builder(
                                      //       itemCount:detaildatamodal?.data?.ideaCategory?.length,
                                      //       itemBuilder: (context,index){
                                      //         return Row(
                                      //           children: [
                                      //             Text(
                                      //               "分类 ：" + (((detaildatamodal?.data?.ideaCategory)==null||(detaildatamodal?.data?.ideaCategory).toString() == "" ) ? "N/A": ((detaildatamodal?.data?.ideaCategory).toString())),
                                      //               style: TextStyle(
                                      //                   fontFamily: "simsan",
                                      //                   color: Color(0xffbB0ACAC),
                                      //                   fontSize: 14.sp),
                                      //             ),
                                      //           ],
                                      //         );
                                      //       }
                                      //
                                      //       ),
                                      //     ),
                                      Text(
                                        "分类 ：" +
                                            (((commaSeparated.toString()) ==
                                                        null ||
                                                (commaSeparated.toString())==
                                                        "")
                                                ? "不适用"
                                                : (commaSeparated.toString())),
                                        style: TextStyle(
                                            fontFamily: "simsan",
                                            color: Color(0xffbB0ACAC),
                                            fontSize: 14.sp),
                                      ),

                                      Text(
                                        "体验感受中位数 : " +
                                            (((emotiondisplay?.emotionName) ==
                                                        null ||
                                                    (emotiondisplay
                                                                ?.emotionName)
                                                            .toString() ==
                                                        "")
                                                ? "记录"
                                                : (emotiondisplay?.emotionName)
                                                    .toString()),
                                        style: TextStyle(
                                            fontFamily: "simsan",
                                            color: Color(0xffbB0ACAC),
                                            fontSize: 14.sp),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '预计时长：${detaildatamodal?.data?.experienceLength == null || detaildatamodal?.data?.experienceLength == "" ? "不适用" : detaildatamodal?.data?.experienceLength ?? ''} ',
                                        style: TextStyle(
                                            fontFamily: "simsan",
                                            color: Color(0xffbB0ACAC),
                                            fontSize: 14.sp),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: InkWell(
                                    onTap: () {
                                      print(detaildatamodal?.data?.userId
                                          .toString());
                                      Get.to(Tenth(
                                          id: detaildatamodal?.data?.userId));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.w),
                                          height: 35.h,
                                          width: 40.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: (detaildatamodal?.data
                                                        ?.contributorProfile)
                                                    .toString(),
                                                progressIndicatorBuilder: (context,
                                                        url, progress) =>
                                                    CircularProgressIndicator(),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Image.asset(
                                                        "assets/user.png",
                                                        color: Colors.white)),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        // Text(
                                        //   detaildatamodal
                                        //       ?.data?.contributorName ??
                                        //       "",
                                        //   style: TextStyle(
                                        //       fontFamily: "simsan",
                                        //       color: Color(0xffbA8A4A4),
                                        //       fontSize: 12.sp),
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Divider(
                                    color: Colors.white70,
                                    thickness: 1.h,
                                  ),
                                ),
                                Container(
                                  height: 55.h,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  color: Colors.white.withOpacity(0.6),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  experincebuttonap();
                                                },
                                                child: detaildatamodal?.data
                                                            ?.experienceValue ==
                                                        "1"
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          print("exp");
                                                          experincebuttonap();
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_circle_rounded,
                                                              color: Color(
                                                                  0xffb191818),
                                                            ),
                                                            Text(
                                                              '已体验',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "simsan",
                                                                  color: Color(
                                                                      0xffb333333),
                                                                  fontSize:
                                                                      17.sp),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : GestureDetector(
                                                        onTap: () {
                                                          print("exp");
                                                          experincebuttonap();
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .check_circle_outline_rounded,
                                                                color: Color(
                                                                    0xffb191818)),
                                                            Text(
                                                              '已体验',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "simsan",
                                                                  color: Color(
                                                                      0xffb333333),
                                                                  fontSize:
                                                                      17.sp),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                            // GestureDetector(
                                            //   onTap: (){
                                            //
                                            //   },
                                            //   child:
                                            // )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  collectedbuttonap();
                                                },
                                                child: detaildatamodal?.data
                                                            ?.collectionValue ==
                                                        "1"
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          print("coll");
                                                          collectedbuttonap();
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .favorite_rounded,
                                                              color: Color(
                                                                  0xffb9F1818),
                                                            ),
                                                            Text(
                                                              '收藏',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "simsan",
                                                                  color: Color(
                                                                      0xffb333333),
                                                                  fontSize:
                                                                      17.sp),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : GestureDetector(
                                                        onTap: () {
                                                          print("coll");
                                                          collectedbuttonap();
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Color(
                                                                    0xffb191818)),
                                                            Text(
                                                              '收藏',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "simsan",
                                                                  color: Color(
                                                                      0xffb333333),
                                                                  fontSize:
                                                                      17.sp),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                            // GestureDetector(
                                            //   onTap: (){
                                            //
                                            //   },
                                            //   child: Text(
                                            //     '收藏',
                                            //     style: TextStyle(
                                            //         fontFamily: "simsan",
                                            //         color: Color(0xffb333333),
                                            //         fontSize: 17.sp),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Get.to(Sharedesign(
                                                    id: widget.id.toString(),

                                                  ));
                                                  print("ggfsd");
                                                  // downloaddata();
                                                },
                                                child: Icon(Icons.share)),
                                            Text(
                                              '分享',
                                              style: TextStyle(
                                                  fontFamily: "simsan",
                                                  color: Color(0xffb333333),
                                                  fontSize: 17.sp),
                                            )
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                buildErrorDialog2(
                                                    context,
                                                    "您已认领该体验",
                                                    "若需修改内容请返回“我的”界面删除当前认领体验后再重新编辑",
                                                    () {
                                                      Get.to(
                                                        Sixteenth(
                                                          name: detaildatamodal?.data?.ideaName??"",
                                                          ideaid: widget.id
                                                              .toString(),
                                                        ),
                                                      );
                                                      // experincebuttonap();
                                                    },
                                                    "好的",
                                                    () {
                                                      Get.back();
                                                    },
                                                    "返回",
                                                    Colors.black,
                                                    Color(0xffb14559E));
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.screenshot),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    '认领',
                                                    style: TextStyle(
                                                        fontFamily: "simsan",
                                                        color:
                                                            Color(0xffb333333),
                                                        fontSize: 17.sp),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '*举办活动',
                                                  style: TextStyle(
                                                      fontFamily: "simsan",
                                                      color: Color(0xffb333333),
                                                      fontSize: 11.sp),
                                                ),
                                                Text(
                                                  '获得收益',
                                                  style: TextStyle(
                                                      fontFamily: "simsan",
                                                      color: Color(0xffb333333),
                                                      fontSize: 11.sp),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '已体验：${detaildatamodal?.data?.noOfExperience ?? ''} | 已收藏： ${detaildatamodal?.data?.noOfCollection ?? ''}',
                                        style: TextStyle(
                                            fontFamily: "simsan",
                                            color: Color(0xffbF2ECEC),
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                detaildatamodal?.data?.event?.length == 0
                                    ? Container(
                                        // color: Colors.red,
                                        // height: 20.h,
                                        // width:
                                        // MediaQuery.of(context).size.width,
                                        // child: Center(
                                        //   child: Text("没有可用的活动"),
                                        // ),
                                        )
                                    : Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(height: 5.h,),
                                          Container(
                                            height: 45.h,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.only( left: 15.w, bottom: 7.h),
                                                // horizontal: 10.w,),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: detaildatamodal
                                                  ?.data?.event?.length,
                                              itemBuilder: (context, index2) {
                                                // DateTime currentDate = DateTime.now();
                                                // String targetDateString = detaildatamodal?.data?.event?[index2].eventStartDate ?? ""; // Your target date string
                                                // print(targetDateString);
                                                // DateTime targetDate = _dateFormat.parse(targetDateString);
                                                //
                                                // if (targetDate.isBefore(currentDate)) {
                                                //   set = false;
                                                // } else if (targetDate.isAfter(currentDate)) {
                                                //  set=true;
                                                // } else {
                                                //  set=false;
                                                // }
                                                return    Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 1.w),
                                                  height: 35.h,
                                                  width: 40.w,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(90),
                                                    child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: (detaildatamodal
                                                            ?.data?.event?[index2].eventProfilePic)
                                                            .toString(),
                                                        progressIndicatorBuilder: (context,
                                                            url, progress) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context, url,
                                                            error) =>
                                                            Image.asset(
                                                                "assets/user.png",
                                                                color: Colors.white)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    (detaildatamodal?.data?.event?.length == 0)
                        ? Container()
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.zero,
                            child: Column(children: [    SizedBox(height: 5.h),
                              for (int index = 0;
                                  index <
                                      (detaildatamodal?.data?.event?.length ??
                                          0);
                                  index++) ...[
                                Container(
                                  margin:
                                      EdgeInsets.only(right: 10.w, top: 10.h),
                                  decoration: BoxDecoration(
                                      color: Color(0xffA71B1E),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black54,
                                            offset: Offset(7, 6),
                                            blurRadius: 2)
                                      ],
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 100.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(Nineteenone(
                                                          user: (detaildatamodal
                                                                  ?.data
                                                                  ?.event?[
                                                                      index]
                                                                  .eventUserId)
                                                              .toString()));
                                                    },
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.all(10.h),
                                                      height: 60.h,
                                                      width: 65.w,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                        child: CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            imageUrl: detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .eventProfilePic ??
                                                                "",
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        progress) =>
                                                                    CircularProgressIndicator(),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                Image.asset(
                                                                    "assets/user.png",
                                                                    color: Colors
                                                                        .white)),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    detaildatamodal
                                                            ?.data
                                                            ?.event?[index]
                                                            .eventOrganizerName ??
                                                        "",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontFamily: "simsan",
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),

                                                  //
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      // Row(
                                                      //   mainAxisAlignment: MainAxisAlignment.end,
                                                      //   children: [
                                                      //     RatingBar.builder(
                                                      //       initialRating:double.parse(detaildatamodal
                                                      // ?.data
                                                      //     ?.event?[index]
                                                      //     .rating ??
                                                      // "",),
                                                      //       minRating: 0,
                                                      //       direction: Axis.horizontal,itemSize: 15.sp,glow: false,
                                                      //       allowHalfRating: true,
                                                      //       itemPadding:
                                                      //       EdgeInsets.symmetric(horizontal: 3.0),
                                                      //       itemBuilder: (context, _) => Icon(
                                                      //         Icons.star,
                                                      //         color: Colors.white,
                                                      //       ),
                                                      //       onRatingUpdate: (rating) {
                                                      //         setState(() {
                                                      //          user = detaildatamodal
                                                      //               ?.data
                                                      //               ?.event?[index]
                                                      //               .eventUserId;
                                                      //          _rating=rating.toInt();
                                                      //
                                                      //         });
                                                      //       ratingap();
                                                      //       },
                                                      //     ),
                                                      //     // RatingBar.builder(itemSize: 18,
                                                      //     //   initialRating: _rating.toDouble(),
                                                      //     //   minRating: 1,
                                                      //     //   direction: Axis.horizontal,
                                                      //     //   allowHalfRating: false,
                                                      //     //   itemCount: 5,unratedColor:Colors.white ,
                                                      //     //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                      //     //
                                                      //     //   itemBuilder: (context, index) {
                                                      //     //     if (index < _rating.floor()) {
                                                      //     //       return Icon(
                                                      //     //         Icons.star,
                                                      //     //         color: Colors.white,
                                                      //     //       );
                                                      //     //     } else {
                                                      //     //       return Icon(
                                                      //     //         Icons.star_border,
                                                      //     //         color: Colors.white,
                                                      //     //       );
                                                      //     //     }
                                                      //     //   },
                                                      //     //   onRatingUpdate: (rating) {
                                                      //     //     setState(() {
                                                      //     //       _rating = rating.toInt();
                                                      //     //     });
                                                      //     //     ratingap();
                                                      //     //   },
                                                      //     // ),
                                                      //
                                                      //     // RatingBarIndicator(
                                                      //     //   rating: 3.5,
                                                      //     //   itemBuilder:
                                                      //     //       (context, index3) =>
                                                      //     //       Icon(
                                                      //     //         Icons.star,
                                                      //     //         color: Colors.white,
                                                      //     //       ),
                                                      //     //   itemCount: 5,
                                                      //     //   itemSize: 20.0,
                                                      //     //   direction: Axis.horizontal,
                                                      //     // ),
                                                      //   ],
                                                      // ),

                                                      RatingBarIndicator(
                                                        rating: double.parse(
                                                            (detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .rating)
                                                                .toString()),
                                                        itemBuilder:
                                                            (context, index3) =>
                                                                Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        itemCount: 5,
                                                        itemSize: 20.0,
                                                        direction:
                                                            Axis.horizontal,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Text(
                                                    (detaildatamodal
                                                                        ?.data
                                                                        ?.event?[
                                                                            index]
                                                                        .userRatingCount ==
                                                                    null
                                                                ? "N/A"
                                                                : detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .userRatingCount)
                                                            .toString() +
                                                        "人评价了TA",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11.sp,
                                                        fontFamily: "simsan"),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  GestureDetector(
                                                      onTap: () {
                                                        ratingpopup(detaildatamodal
                                                                ?.data
                                                                ?.event?[index]
                                                                .eventUserId ??
                                                            "");
                                                      },
                                                      child: Text(
                                                        "给予评级",
                                                        style: textstyle,
                                                      )),
                                                  SizedBox(height: 4.h),

                                                  Center(
                                                    child: Text(
                                                      '已体验数 : ' +
                                                          (detaildatamodal
                                                                  ?.data
                                                                  ?.event?[
                                                                      index]
                                                                  .numberOfExperienced)
                                                              .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 11.sp,
                                                        fontFamily: "simsan",
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Center(
                                                    child: Text(
                                                      '已认领体验数 :' +
                                                          (detaildatamodal
                                                                  ?.data
                                                                  ?.event?[
                                                                      index]
                                                                  .numberOfIdeasOwned)
                                                              .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 5.w),
                                              child: SizedBox(
                                                width: 210.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    //event title
                                                    Text(
                                                      detaildatamodal
                                                              ?.data
                                                              ?.event?[index]
                                                              .eventTitle ??
                                                          "",
                                                      style: TextStyle(
                                                          fontFamily: "simsan",
                                                          color: Colors.white,
                                                          fontSize: 14.sp),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    //event description
                                                    Text(
                                                      detaildatamodal
                                                              ?.data
                                                              ?.event?[index]
                                                              .eventDescription ??
                                                          "",
                                                      style: TextStyle(
                                                          fontFamily: "simsan",
                                                          color: Colors.white,
                                                          fontSize: 11.sp),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    //event start time
                                                    detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .eventStartTime ==
                                                                "00:00:00" ||
                                                            detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .eventStartTime ==
                                                                null ||
                                                            detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .eventStartDate ==
                                                                null
                                                        ? Container()
                                                        : Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .watch_later,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Text(
                                                                    '开始时间',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "simsan",
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5.h,
                                                              ),
                                                              Text(
                                                                (detaildatamodal
                                                                            ?.data
                                                                            ?.event?[
                                                                                index]
                                                                            .eventStartTime)
                                                                        .toString() +
                                                                    " " +
                                                                    (detaildatamodal
                                                                            ?.data
                                                                            ?.event?[index]
                                                                            .eventStartDate)
                                                                        .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        "simsan",
                                                                    fontSize:
                                                                        14.sp),
                                                              ),
                                                            ],
                                                          ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    // event length
                                                    ((detaildatamodal
                                                                        ?.data
                                                                        ?.event?[
                                                                            index]
                                                                        .experienceLength)
                                                                    .toString() ==
                                                                "" ||
                                                            (detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .experienceLength) ==
                                                                null)
                                                        ? Container()
                                                        : Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .watch_later_outlined,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Text(
                                                                    '体验时长',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "simsan",
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5.h,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 30
                                                                            .w),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      (detaildatamodal
                                                                              ?.data
                                                                              ?.event?[index]
                                                                              .experienceLength)
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                              "simsan",
                                                                          fontSize:
                                                                              14.sp),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    //event location
                                                    ((detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .eventLocation)
                                                                .toString() ==
                                                            "")
                                                        ? Container()
                                                        : Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_on,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          10.w,
                                                                    ),
                                                                    Text(
                                                                      '体验地点',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                              "simsan",
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14.sp),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                Text(
                                                                  detaildatamodal
                                                                          ?.data
                                                                          ?.event?[
                                                                              index]
                                                                          .eventLocation ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      fontFamily: "simsan",
                                                                      color: Colors.white,
                                                                      // fontWeight: FontWeight.bold,
                                                                      fontSize: 14.sp),
                                                                ),
                                                                // Container(
                                                                //   margin:
                                                                //       EdgeInsets.all(2.h),
                                                                //   height: 120.h,
                                                                //   width: 300.w,
                                                                //   child:GoogleMapExample(id1: (detaildatamodal?.data?.event?[index].eventLocation).toString() )
                                                                // ),
                                                              ]),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    detaildatamodal
                                                                ?.data
                                                                ?.event?[index]
                                                                .eventPicture
                                                                ?.length ==
                                                            0
                                                        ? Container()
                                                        : Container(
                                                            height: 120.h,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: GridView
                                                                .builder(
                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      10.0,
                                                                  mainAxisSpacing:
                                                                      10.0,
                                                                  childAspectRatio:
                                                                      1 / 1),
                                                              itemCount:
                                                                  detaildatamodal
                                                                      ?.data
                                                                      ?.event?[
                                                                          index]
                                                                      .eventPicture
                                                                      ?.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index1) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    print(
                                                                        "hiiii");
                                                                    Get.to(
                                                                        openimage(
                                                                      imageid: detaildatamodal
                                                                              ?.data
                                                                              ?.event?[index]
                                                                              .eventPicture?[index1] ??
                                                                          "",
                                                                    ));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        20.w,
                                                                    width:
                                                                        100.w,
                                                                    margin: EdgeInsets
                                                                        .all(2
                                                                            .h),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        imageUrl:
                                                                            detaildatamodal?.data?.event?[index].eventPicture?[index1] ??
                                                                                "",
                                                                        progressIndicatorBuilder: (context,
                                                                                url,
                                                                                progress) =>
                                                                            CircularProgressIndicator(),
                                                                        errorWidget: (context,
                                                                                url,
                                                                                error) =>
                                                                            Image.asset(
                                                                          'assets/user.png',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            )
                                                            // Column(
                                                            //     children:[
                                                            //
                                                            //       for(int index1 =0; index1<((detaildatamodal
                                                            //           ?.data
                                                            //           ?.event?[index]
                                                            //           .eventPicture
                                                            //           ?.length ?? 0) ~/2 );index1 ++) ...[
                                                            //         Row(
                                                            //             children:[
                                                            //               for(int index2=0; index2<2;index2++)...[
                                                            //
                                                            //
                                                            //
                                                            //               ]
                                                            //
                                                            //             ]
                                                            //         )
                                                            //
                                                            //       ]
                                                            //     ]
                                                            // )
                                                            ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Text( detaildatamodal?.data?.event?[index].eventUserId??""),
                                        //     Text( userdata?.userData?.id ??""),
                                        //   ],
                                        // ),

                                        // ( _dateFormat.parse(detaildatamodal?.data?.event?[index].eventStartDate ?? "").isAfter(currentDate))?
                                        // detaildatamodal?.data?.event?[index].eventUserId.toString() == userdata?.userData?.id.toString() ?
                                        detaildatamodal?.data?.event?[index]
                                                    .eventUserId ==
                                                userdata?.userData?.id
                                            ? Container()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 25.w,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(2.w),
                                                        // decoration: BoxDecoration(
                                                        //     color: Colors.white,
                                                        //     borderRadius:
                                                        //     BorderRadius.circular(90)),
                                                        child: Icon(
                                                          Icons.people_outline,
                                                          size: 28.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                        (detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .remainingSeats)
                                                                .toString() +
                                                            '/' +
                                                            (detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .totalSeats)
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "simsan",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.sp),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(2.w),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90)),
                                                        child: Icon(
                                                          Icons
                                                              .currency_yen_rounded,
                                                          size: 18.sp,
                                                          color:
                                                              Color(0xffA71B1E),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8.w,
                                                      ),
                                                      Text(
                                                        detaildatamodal
                                                                ?.data
                                                                ?.event?[index]
                                                                .eventFee ??
                                                            "",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "simsan",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.sp),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        select = index;
                                                      });
                                                      detaildatamodal
                                                                  ?.data
                                                                  ?.event?[
                                                                      index]
                                                                  .btnTxt ==
                                                              "Signup"
                                                          ? signuppopup()
                                                          : detaildatamodal
                                                                      ?.data
                                                                      ?.event?[
                                                                          index]
                                                                      .btnTxt ==
                                                                  "Already Registered"
                                                              ? buildErrorDialog2(
                                                                  context,
                                                                  "确认取消报名?",
                                                                  "体验费用将在本月月底被原路退回",
                                                                  () {
                                                                    Canclereg(
                                                                      detaildatamodal
                                                                              ?.data
                                                                              ?.event?[index]
                                                                              .eventId ??
                                                                          "",
                                                                    );
                                                                    Get.back();
                                                                  },
                                                                  //confirm cancle
                                                                  "确认取消报名",
                                                                  () {
                                                                    Get.back();
                                                                  },
                                                                  // return
                                                                  "返回",
                                                                  Colors.black,
                                                                  Color(
                                                                      0xffb14559E))
                                                              : buildErrorDialog2(
                                                                  context,
                                                                  "抱歉，体验报名不能被取消",
                                                                  "貌似已过最后取消时限啦",
                                                                  () {
                                                                    Get.back();
                                                                  },
                                                                  // Qtafull
                                                                  "好的",
                                                                  () {
                                                                    Get.back();
                                                                  },
                                                                  // return
                                                                  "返回",
                                                                  Colors.black,
                                                                  Color(
                                                                      0xffb14559E));
                                                    },
                                                    child: Container(
                                                      height: 50.h,
                                                      width: 120.w,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black54,
                                                              offset:
                                                                  Offset(7, 6),
                                                              blurRadius: 2)
                                                        ],
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Text(
                                                        detaildatamodal
                                                                    ?.data
                                                                    ?.event?[
                                                                        index]
                                                                    .btnTxt ==
                                                                "Signup"
                                                            ? "报名"
                                                            : detaildatamodal
                                                                        ?.data
                                                                        ?.event?[
                                                                            index]
                                                                        .btnTxt ==
                                                                    "Already Registered"
                                                                ? "已经注册"
                                                                : "配额已满",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "simsan",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xffA61B1B),
                                                            fontSize: 18.sp),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                        // :Container(),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ]
                            ])),

                    // comment
                    commentdisplaymodal?.status == "fail"
                        ? Container(
                            // height: 100.h,
                            // width: MediaQuery.of(context).size.width,
                            // child: Center(child: Text("这个想法没有评论"))
                            )
                        : Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(children: [
                                    for (int index = 0;
                                        index <
                                            (commentdisplaymodal
                                                    ?.data?.length ??
                                                0);
                                        index++) ...[
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white30,
                                            ),
                                            child: Card(

                                              shape: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              color: Colors.white30,
                                              // color: Colors.orange,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(

                                                        padding:
                                                        EdgeInsets.only(
                                                            bottom:5.h),
                                                        width: 100.w,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.all(
                                                                      10.h),
                                                              height: 60.h,
                                                              width: 65.w,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            90),
                                                                child: CachedNetworkImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    imageUrl: commentdisplaymodal
                                                                            ?.data?[
                                                                                index]
                                                                            .userpicture ??
                                                                        "",
                                                                    progressIndicatorBuilder:
                                                                        (context,
                                                                                url,
                                                                                progress) =>
                                                                            CircularProgressIndicator(),
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        Image.asset(
                                                                            "assets/user.png",
                                                                            color: Colors
                                                                                .white)),
                                                              ),
                                                            ),
                                                            // Container(
                                                            //
                                                            //   margin:
                                                            //       EdgeInsets.all(10.h),
                                                            //   height: 60.h,
                                                            //   width: 65.w,
                                                            //   decoration: BoxDecoration(
                                                            //     borderRadius:
                                                            //     BorderRadius.circular(
                                                            //         90),
                                                            //   ),
                                                            //   child: ClipRRect(
                                                            //     borderRadius:
                                                            //         BorderRadius.circular(
                                                            //             120),
                                                            //     child: CachedNetworkImage(
                                                            //       fit: BoxFit.fitHeight,
                                                            //       imageUrl:
                                                            //           commentdisplaymodal
                                                            //                   ?.data?[
                                                            //                       index]
                                                            //                   .userpicture ??
                                                            //               "",
                                                            //       progressIndicatorBuilder:
                                                            //           (context, url,
                                                            //                   progress) =>
                                                            //               Center(
                                                            //                   child:
                                                            //                       CircularProgressIndicator()),
                                                            //       errorWidget: (context,
                                                            //               url, error) =>
                                                            //           Image.asset(
                                                            //         'assets/user.png',
                                                            //         color: Colors.white,
                                                            //       ),
                                                            //     ),
                                                            //   ),
                                                            // ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      left: 0.w),
                                                              child: Center(
                                                                child: Text(
                                                                  commentdisplaymodal
                                                                          ?.data?[
                                                                              index]
                                                                          .username ??
                                                                      "",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontFamily:
                                                                          "simsan"),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 12.w,
                                                      ),
                                                      Container(
                                                        width: 210.w,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 7.h,
                                                            ),
                                                            Text(
                                                              commentdisplaymodal
                                                                      ?.data?[index]
                                                                      .commentName ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "simsan",
                                                                  color: Color(
                                                                      0xffb2B59A2),
                                                                  fontSize: 14.sp),
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            commentdisplaymodal
                                                                            ?.data?[
                                                                                index]
                                                                            .commentDescription ==
                                                                        "" ||
                                                                    commentdisplaymodal
                                                                            ?.data?[
                                                                                index]
                                                                            .commentDescription ==
                                                                        null
                                                                ? Container()
                                                                : Column(
                                                                children: [
                                                                    Text(
                                                                      commentdisplaymodal
                                                                              ?.data?[
                                                                                  index]
                                                                              .commentDescription ??
                                                                          "",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "simsan",
                                                                          color: Color(
                                                                              0xffb8D8D8D),
                                                                          fontSize:
                                                                              14.sp),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 15.h,
                                                                    ),
                                                                  ]),
                                                            commentdisplaymodal
                                                                        ?.data?[
                                                                            index]
                                                                        .picture
                                                                        ?.length ==
                                                                    0
                                                                ? Container()
                                                                : Column(
                                                                children: [
                                                                    Container(
                                                                      height: 120.h,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      child:
                                                                          // Column(
                                                                          //      children:[
                                                                          //        for(int index =0;index<((commentdisplaymodal
                                                                          //            ?.data?[index]
                                                                          //            .picture
                                                                          //            ?.length ?? 0) ~/2) +1 ; index++)...[
                                                                          //           Row(
                                                                          //             for*
                                                                          //           )
                                                                          //
                                                                          //
                                                                          //        ]
                                                                          //      ]
                                                                          // )
                                                                          //
                                                                          GridView
                                                                              .builder(
                                                                        physics:
                                                                            ScrollPhysics(),
                                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                            crossAxisCount:
                                                                                2,
                                                                            crossAxisSpacing:
                                                                                10,
                                                                            mainAxisSpacing:
                                                                                10),
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount: commentdisplaymodal
                                                                            ?.data?[
                                                                                index]
                                                                            .picture
                                                                            ?.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index4) {
                                                                          return Container(
                                                                            height:
                                                                                107.h,
                                                                            width: MediaQuery.of(context)
                                                                                .size
                                                                                .width,
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius:
                                                                                  BorderRadius.circular(5),
                                                                              child:
                                                                                  CachedNetworkImage(
                                                                                fit:
                                                                                    BoxFit.cover,
                                                                                imageUrl:
                                                                                    commentdisplaymodal?.data?[index].picture?[index4] ?? "",
                                                                                progressIndicatorBuilder: (context, url, progress) =>
                                                                                    CircularProgressIndicator(),
                                                                                errorWidget: (context, url, error) =>
                                                                                    Image.asset(
                                                                                  'assets/user.png',
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 20.h,
                                                                    ),
                                                                  ]),
                                                            // Container(
                                                            //   child: Row(
                                                            //     crossAxisAlignment:
                                                            //         CrossAxisAlignment
                                                            //             .start,
                                                            //     mainAxisAlignment:
                                                            //         MainAxisAlignment
                                                            //             .spaceBetween,
                                                            //     children: [
                                                            //       Text(
                                                            //         (commentdisplaymodal
                                                            //                     ?.data?[
                                                            //                         index]
                                                            //                     .likeCount)
                                                            //                 .toString() +
                                                            //             ' 赞 ' +
                                                            //             (commentdisplaymodal
                                                            //                     ?.data?[index]
                                                            //                     .subcommentCount)
                                                            //                 .toString() +
                                                            //             ' 评论',
                                                            //         style: TextStyle(
                                                            //             fontFamily:
                                                            //                 "simsan",
                                                            //             color: Color(
                                                            //                 0xffb717171),
                                                            //             fontSize:
                                                            //                 14.sp),
                                                            //       ),
                                                            //       Row(
                                                            //         crossAxisAlignment:
                                                            //             CrossAxisAlignment
                                                            //                 .start,
                                                            //         children: [
                                                            //           GestureDetector(
                                                            //             onTap: () {
                                                            //               addlikecomment((commentdisplaymodal
                                                            //                       ?.data?[index]
                                                            //                       .commentId)
                                                            //                   .toString());
                                                            //             },
                                                            //             child: commentdisplaymodal?.data?[index].commentLikes ==
                                                            //                     0
                                                            //                 ? Icon(
                                                            //                     CupertinoIcons.heart,
                                                            //                     size:
                                                            //                         28.sp,
                                                            //                     color:
                                                            //                         Color(0xffb777777),
                                                            //                   )
                                                            //                 : Icon(
                                                            //                     Icons.favorite,
                                                            //                     size:
                                                            //                         28.sp,
                                                            //                     color:
                                                            //                         Color(0xffbD52525),
                                                            //                   ),
                                                            //           ),
                                                            //           SizedBox(
                                                            //               width:
                                                            //                   5.w),
                                                            //           GestureDetector(
                                                            //             onTap: () {
                                                            //               addsubcommentbox((commentdisplaymodal
                                                            //                       ?.data?[index]
                                                            //                       .commentId)
                                                            //                   .toString());
                                                            //             },
                                                            //             child: Icon(
                                                            //               CupertinoIcons
                                                            //                   .chat_bubble_text,
                                                            //               size:
                                                            //                   28.sp,
                                                            //               color: Color(
                                                            //                   0xffb777777),
                                                            //             ),
                                                            //           ),
                                                            //         ],
                                                            //       )
                                                            //     ],
                                                            //   ),
                                                            // ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(bottom: 10.h,left:115.w,right:15.w),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                          (commentdisplaymodal
                                                              ?.data?[
                                                          index]
                                                              .likeCount)
                                                              .toString() +
                                                              ' 赞 ' +
                                                              (commentdisplaymodal
                                                                  ?.data?[index]
                                                                  .subcommentCount)
                                                                  .toString() +
                                                              ' 评论',
                                                          style: TextStyle(
                                                              fontFamily:
                                                              "simsan",
                                                              color: Color(
                                                                  0xffb717171),
                                                              fontSize:
                                                              14.sp),
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                addlikecomment((commentdisplaymodal
                                                                    ?.data?[index]
                                                                    .commentId)
                                                                    .toString());
                                                              },
                                                              child: commentdisplaymodal?.data?[index].commentLikes ==
                                                                  0
                                                                  ? Icon(
                                                                CupertinoIcons.heart,
                                                                size:
                                                                28.sp,
                                                                color:
                                                                Color(0xffb777777),
                                                              )
                                                                  : Icon(
                                                                Icons.favorite,
                                                                size:
                                                                28.sp,
                                                                color:
                                                                Color(0xffbD52525),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width:
                                                                5.w),
                                                            GestureDetector(
                                                              onTap: () {
                                                                addsubcommentbox((commentdisplaymodal
                                                                    ?.data?[index]
                                                                    .commentId)
                                                                    .toString());
                                                              },
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .chat_bubble_text,
                                                                size:
                                                                28.sp,
                                                                color: Color(
                                                                    0xffb777777),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          commentdisplaymodal?.status == "fail"
                                              ? Container()
                                              : Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            for (int index1 = 0;
                                                                index1 <
                                                                    (commentdisplaymodal
                                                                            ?.data?[
                                                                                index]
                                                                            .subcomment
                                                                            ?.length ??
                                                                        0);
                                                                index1++) ...[
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              20.w),
                                                                  child: RichText(
                                                                      text: TextSpan(
                                                                          children: [
                                                                        TextSpan(
                                                                          text: commentdisplaymodal
                                                                              ?.data?[
                                                                                  index]
                                                                              .subcomment?[
                                                                                  index1]
                                                                              .subcomment,
                                                                          style: TextStyle(
                                                                              color: Color(
                                                                                  0xffb2B59A2),
                                                                              fontSize: 14
                                                                                  .sp,
                                                                              fontFamily:
                                                                                  "simsan"),
                                                                        ),
                                                                        TextSpan(
                                                                            text:
                                                                                " : "),
                                                                        TextSpan(
                                                                            text: commentdisplaymodal
                                                                                ?.data?[
                                                                                    index]
                                                                                .subcomment?[
                                                                                    index1]
                                                                                .subcommentName,
                                                                            style: TextStyle(
                                                                                color:
                                                                                    Colors.black,
                                                                                fontSize: 14.sp,
                                                                                fontFamily: "simsan"))
                                                                      ])))
                                                            ]
                                                          ]),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                    ],
                                                  ))
                                        ],
                                      )
                                    ]
                                  ])),
                            ],
                          ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 20.h),
                      height: 200.h,
                      width: double.infinity,
                      color: Colors.black87,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '我的体验感受',
                                style: TextStyle(
                                  color: Color(0xffbF0F1F2),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 350.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Slider(
                              max: 16.0,
                              min: 0.0,
                              divisions: 16,
                              thumbColor: Colors.red.shade900,
                              activeColor: Colors.red.shade900,
                              inactiveColor: Colors.white70,
                              value: _currentSliderSecondaryValue.toDouble(),
                              label: _currentSliderSecondaryValue == 1
                                  ? "濒死"
                                  : _currentSliderSecondaryValue == 2
                                      ? "痛苦"
                                      : _currentSliderSecondaryValue == 3
                                          ? "恐惧"
                                          : _currentSliderSecondaryValue == 4
                                              ? "羞耻"
                                              : _currentSliderSecondaryValue ==
                                                      5
                                                  ? "憎恶"
                                                  : _currentSliderSecondaryValue ==
                                                          6
                                                      ? "嫉妒"
                                                      : _currentSliderSecondaryValue ==
                                                              7
                                                          ? "焦虑"
                                                          : _currentSliderSecondaryValue ==
                                                                  8
                                                              ? "郁闷"
                                                              : _currentSliderSecondaryValue ==
                                                                      9
                                                                  ? "惭愧"
                                                                  : _currentSliderSecondaryValue ==
                                                                          10
                                                                      ? "丧"
                                                                      : _currentSliderSecondaryValue ==
                                                                              11
                                                                          ? "无聊"
                                                                          : _currentSliderSecondaryValue == 12
                                                                              ? "无感"
                                                                              : _currentSliderSecondaryValue == 13
                                                                                  ? "轻松"
                                                                                  : _currentSliderSecondaryValue == 14
                                                                                      ? "有点意思"
                                                                                      : _currentSliderSecondaryValue == 15
                                                                                          ? "高兴"
                                                                                          : _currentSliderSecondaryValue == 16
                                                                                              ? "怜爱"
                                                                                              : _currentSliderSecondaryValue == 17
                                                                                                  ? "敬佩"
                                                                                                  : _currentSliderSecondaryValue == 18
                                                                                                      ? "自豪"
                                                                                                      : "狂喜",
                              onChangeEnd: (double value) {
                                setState(() {
                                  _currentSliderSecondaryValue = value.toInt();
                                });
                                emotionaddap();
                              },
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderSecondaryValue = value.toInt();
                                  print(value);
                                });
                              },
                            ),
                          ),
                          Text(
                            '*我们将取所有感受的中位数作为该体验的“情感中位数”',
                            style: TextStyle(
                              fontFamily: "simsan",
                              color: Color(0xffb9FA1A1),
                              fontSize: 10.sp,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                commentbox();
                                // Get.to(Fourteenth());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 250.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Color(0xffbD52525),
                                  borderRadius: BorderRadius.circular(800),
                                ),
                                child: Text(
                                  '写评论',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  commentbox() async {
    print("jsdkgjksdfjgkdfsjgkfsg");
    // await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
    //     .then((Position position) async {
    //   setState(() => _currentPosition = position);
    //   await placemarkFromCoordinates(
    //           _currentPosition!.latitude, _currentPosition!.longitude)
    //       .then((List<Placemark> placemarks) {
    //     Placemark place = placemarks[0];
    //     setState(() {
    //       _currentAddress =
    //           '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
    //       print(_currentAddress);
    //     });
    //   });
    // });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              height: 700.h,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.w),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27),
                          ),

                          child: Card(
                            elevation: 8,shape: RoundedRectangleBorder(   borderRadius: BorderRadius.circular(27),),
                            child: Padding(
                              padding:EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
                              child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                                hintText: "#将耳机音量调小偷听旁人谈话 \n \n记录下你的体验感受...",
                                hintMaxLines: 1,
                                hintStyle: TextStyle(color: Color(0xffb2B59A2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                        controller: _commenttitle,
                        validator: (value) {
                              if (value!.isEmpty) {
                                return "   评论标题";
                              }
                              return null;
                        },
                        // onSubmitted: (String value) {
                        //   debugPrint(value);
                        // },
                      ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(27),
                             ),
                          child: Card(elevation: 8,shape: RoundedRectangleBorder(   borderRadius: BorderRadius.circular(27),),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
                              child: TextFormField(
                                maxLines: 6,
                                decoration: InputDecoration(
                                    hintText: "#将耳机音量调小偷听旁人谈话 \n \n记录下你的体验感受...",
                                    hintStyle: TextStyle(color: Color(0xffb2B59A2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0))),
                                controller: _commentdesc,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "   评论描述";
                                  }
                                  return null;
                                },
                                // onSubmitted: (String value) {
                                //   debugPrint(value);
                                // },
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.w),
                          child: selectedImages
                                  .isEmpty // If no images is selected
                              ? Center(
                                  child: GestureDetector(
                                  onTap: () async {
                                    final List<XFile> pickedFileList =
                                        await ImagePicker().pickMultiImage();

                                    if (pickedFileList != null) {
                                      if (pickedFileList!.length +
                                              selectedImages.length >
                                          maxImageLimit) {
                                        // Handle maximum image limit exceeded
                                      } else {
                                        setState(() {
                                          selectedImages = pickedFileList!
                                              .map((XFile file) =>
                                                  File(file.path))
                                              .toList()!;
                                          imagePaths = pickedFileList
                                              .map((file) => file.path)
                                              .toList();
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 120.w,
                                    width: 120.w,
                                    padding: EdgeInsets.all(20.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffb333333),
                                            width: 1)),
                                    child: Image.asset(
                                      "assets/add.png",
                                      height: 80.w,
                                      color: Color(0xffb333333),
                                      fit: BoxFit.cover,
                                      width: 80.w,
                                    ),
                                  ),
                                ))
                              : Container(),
                        ),
                        selectedImages.isEmpty
                            ? Container()
                            : Container(
                                height: 120.w,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15.w),
                                child: GridView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: selectedImages.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3
                                          // Horizontally only 3 images will show
                                          ),
                                  itemBuilder: (context, index) {
                                    // TO show selected file
                                    return Container(
                                        height: 100.w,
                                        width: 100.w,
                                        child:
                                            Image.file(selectedImages[index]));
                                  },
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color(0xffbBE1313),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: Text(
                              "阿康广场，苏拉特，古吉拉特邦",
                              style: TextStyle(
                                  color: Color(0xffbBE1313),
                                  fontSize: 14.sp,
                                  fontFamily: "simsan"),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        commentuser();
                        // Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffbBE1313)),
                        child: Text(
                          "发布",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "simsan",
                              fontSize: 17.sp),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  experincebuttonap() {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['idea_id'] = widget.id.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().experincebuttonapi(data).then((response) async {
          experincemodal = ExperinceModal.fromJson(json.decode(response.body));
          print(experincemodal?.status);
          if (response.statusCode == 200 &&
              experincemodal?.status == "success") {
            print(experincemodal?.message);
            ideadetailap();
            // Get.off(Four());
            setState(() {});
          } else {}
        });
      } else {
        setState(() {});
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  collectedbuttonap() {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['idea_id'] = widget.id.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().collectionbuttonapi(data).then((response) async {
          collectionmodal =
              CollectionModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              collectionmodal?.status == "success") {
            print(collectionmodal?.status);
            ideadetailap();

            setState(() {});
          } else {}
        });
      } else {
        setState(() {});
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  ideadetailap() {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? "";
    data['idea_id'] = widget.id.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().detailidea(data).then((response) async {
          detaildatamodal =
              DetalisDataModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              detaildatamodal?.status == "success") {
            String input = (detaildatamodal?.data?.ideaCategory).toString();

            List<String> elements =
                input.replaceAll('[', '').replaceAll(']', '').split(',');

            // Output: "abc,pqr"
            // print(commaSeparated); // Output: "abc,pq
            // print("kwjefdsk");
            // print(commaSeparated);
            setState(() {
              commaSeparated = elements.join(',');

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

  commentuser() {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? "";
    data['idea_id'] = widget.id.toString();
    data['emotion_id'] = "3";
    data['location'] = "surat";
    data['comment_text'] = _commenttitle.text.toString();

    // data['comment_picture'] = imagePaths.toString();
    data['comment_description'] = _commentdesc.text.toString();
    print(data);
    if (_formKey.currentState!.validate()) {
      print("Abc");
      checkInternet().then((internet) async {
        if (internet) {
          ideaprovider()
              .addcommentapi(data, selectedImages)
              .then((response) async {
            commentsmodal = CommentsModal.fromJson(json.decode(response.body));
            print(commentsmodal?.status);
            if (response.statusCode == 200 &&
                commentsmodal?.status == "success") {
              Get.back();
              _commenttitle.text = "";
              _commentdesc.text = "";
              selectedImages = [];
              commentdisplay();

              setState(() {});
            } else {}
          });
        } else {
          setState(() {});
          buildErrorDialog(context, '错误', "需要互联网");
        }
      });
    }
  }

  commentdisplay() {
    final Map<String, String> data = {};
    data['idea_id'] = widget.id.toString();
    data['login_user_id'] = userdata?.userData?.id ?? "";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().commentdisplayapi(data).then((response) async {
          commentdisplaymodal =
              CommentdisplayModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              commentdisplaymodal?.status == "success") {
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

  addsubcommentbox(String? value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Container(

              // width: 170.w,
              // width: 250.w,
              child: Form(
                key: _formKey1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    Padding(
                      padding: EdgeInsets.all(15.w),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27),
                          ),

                          child: Card(
                            elevation: 8,shape: RoundedRectangleBorder(   borderRadius: BorderRadius.circular(27),),
                            child: Padding(
                              padding:EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
                              child: TextFormField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: "#将耳机音量调小偷听旁人谈话 \n \n记录下你的体验感受...",
                                    hintMaxLines: 1,
                                    hintStyle: TextStyle(color: Color(0xffb2B59A2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0))),
                                controller:_subcommenttitle ,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "   评论标题";
                                  }
                                  return null;
                                },
                                // onSubmitted: (String value) {
                                //   debugPrint(value);
                                // },
                              ),
                            ),
                          )),
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            child: Container(

                              width:160.w,
                              height: 50.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border(right: BorderSide(color: Color(0xffbDFDEDE)),top:BorderSide(color: Color(0xffbDFDEDE)) )
                              ),
                              child: Center(
                                child: Text("取消",
                                    textAlign: TextAlign.center,
                                    style:  TextStyle(
                                        fontSize: 17.sp,
                                        color: Colors.black,
                                        fontFamily: 'simsan')),
                              ),
                            ),
                            onTap:(){
                              Get.back();
                            },
                        ),
                        GestureDetector(
                            child: Container(

                              width:160.w,
                              height: 50.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border(left: BorderSide(color: Color(0xffbDFDEDE)),top:BorderSide(color: Color(0xffbDFDEDE)) )
                              ),
                              child: Center(
                                child: Text("萨姆比特",
                                    textAlign: TextAlign.center,
                                    style:  TextStyle(
                                        fontSize: 17.sp,

                                        color: Color(0xffb14559E),

                                        fontFamily: 'simsan')),
                              ),
                            ),
                            onTap:(){
                              addsubcommentap(value.toString());
                            }
                        )
                      ],
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     addsubcommentap(value.toString());
                    //     Get.back();
                    //   },
                      // child: Container(
                      //   alignment: Alignment.center,
                      //   height: 50.h,
                      //   width: 300.w,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: Color(0xffbBE1313)),
                      //   child: Text(
                      //     "发布",
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontFamily: "simsan",
                      //         fontSize: 17.sp),
                      //   ),
                      // ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  addsubcommentap(String? value) {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['comment_id'] = value.toString();
    data['description'] = _subcommenttitle.text;
    print(data);
    if (_formKey1.currentState!.validate()){
      checkInternet().then((internet) async {
        if (internet) {
          ideaprovider().addsubcommentapi(data).then((response) async {
            addsubcomment =
                AddsubcommentModal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 &&
                addsubcomment?.status == "success") {
              _subcommenttitle.text = "";
              commentdisplay();
              Get.back();

              setState(() {});
            } else {}
          });
        } else {
          setState(() {});
          buildErrorDialog(context, '错误', "需要互联网");
        }
      });
    }

  }

  addlikecomment(String? value) {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['comment_id'] = value.toString();
    data['idea_id'] = widget.id.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().addsubcommentlikeapi(data).then((response) async {
          addcommentlike =
              AddcommentlikeModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              addcommentlike?.status == "success") {
            commentdisplay();
            setState(() {});
          } else {}
        });
      } else {
        setState(() {});
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  signupbutton(String? value) {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['event_id'] = value.toString();
    data['transaction_id'] = "dfhjh123558";
    data['transaction_amount'] = "200";
    data['transaction_status'] = "1";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().signeventupapi(data).then((response) async {
          eventsignupmodal =
              EventSignupModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              eventsignupmodal?.status == "success") {
            print("sdfkdsfs");
            print(eventsignupmodal?.status);
            ideadetailap();

            setState(() {});
          } else {}
        });
      } else {
        setState(() {});
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  Canclereg(String? value) {
    final Map<String, String> data = {};
    data['login_user_id'] = userdata?.userData?.id ?? '';
    data['event_id'] = value.toString();
    print("Abc");
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().eventcancelapi(data).then((response) async {
          eventcancelmodal =
              EventCancelModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              eventcancelmodal?.status == "success") {
            print(eventcancelmodal?.status);
            ideadetailap();
            // print( eventcancelmodal?.status);

            setState(() {});
          } else {}
        });
      } else {
        setState(() {});
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  emotionaddap() {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['idea_id'] = widget.id.toString();
    data['emotion'] = _currentSliderSecondaryValue.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().emotionadd(data).then((response) async {
          EmotionModal emotion =
              EmotionModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && emotion?.status == "success") {
            buildErrorDialog(context, "", "表情记录成功");
            displayemotionap();
            setState(() {});
          } else {}
        });
      } else {
        setState(() {});
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  displayemotionap() {
    final Map<String, String> data = {};
    data['idea_id'] = widget.id.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().displayemotion(data).then((response) async {
          emotiondisplay =
              DisplayemotionModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              emotiondisplay?.status == "success") {
            setState(() {});
          } else {}
        });
      } else {
        setState(() {});
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  ratingap() {
    final Map<String, String> data = {};
    data['login_user_id'] = userdata?.userData?.id ?? "";
    data['event_organiser_id'] = user.toString();
    data['rating'] = _rating.toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().ratingapi(data).then((response) async {
          ratingmodal = Ratingmodal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && ratingmodal?.status == "success") {
            Get.back();
            ideadetailap();
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

  ratingpopup(String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
              width: 250.w,
              height: 150.h,
              // height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 20.sp,
                          ))
                    ],
                  ),
                  Text(
                    "添加评级",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        itemSize: 30,
                        initialRating: _rating.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        unratedColor: Colors.black,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, index) {
                          if (index < _rating.floor()) {
                            return Icon(
                              Icons.star,
                              color: Colors.black,
                            );
                          } else {
                            return Icon(
                              Icons.star_border,
                              color: Colors.black,
                            );
                          }
                        },
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating.toInt();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          user = value.toString();
                        });
                        ratingap();
                      },
                      child: Text(
                        "提交",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ))
                ],
              )),
        );
      },
    );
  }

  TextStyle textstyle = TextStyle(
    color: Colors.white,
    fontSize: 11.sp,
    fontFamily: "simsan",
    decoration: TextDecoration.underline,
  );

  signuppopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
              width: 300.w,
              // height: 255.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "请确认以下信息",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "体验名称：" +
                              (((detaildatamodal?.data?.event?[select!]
                                              .eventTitle ==
                                          "" ||
                                      detaildatamodal?.data?.event?[select!]
                                              .eventTitle ==
                                          null)
                                  ? "N/A"
                                  : (detaildatamodal
                                          ?.data?.event?[select!].eventTitle)
                                      .toString())),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "体验主：" +
                              (((detaildatamodal?.data?.event?[select!]
                                              .eventDescription ==
                                          "" ||
                                      detaildatamodal?.data?.event?[select!]
                                              .eventDescription ==
                                          null)
                                  ? "N/A"
                                  : (detaildatamodal?.data?.event?[select!]
                                          .eventDescription)
                                      .toString())),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "体验开始时间：" +
                              (((detaildatamodal?.data?.event?[select!]
                                              .eventStartDate ==
                                          "" ||
                                      detaildatamodal?.data?.event?[select!]
                                              .eventStartDate ==
                                          null)
                                  ? "N/A"
                                  : (detaildatamodal?.data?.event?[select!]
                                          .eventStartDate)
                                      .toString())) +
                              (((detaildatamodal?.data?.event?[select!]
                                              .eventStartTime ==
                                          "" ||
                                      detaildatamodal?.data?.event?[select!]
                                              .eventStartTime ==
                                          null)
                                  ? "N/A"
                                  : (detaildatamodal?.data?.event?[select!]
                                          .eventStartTime)
                                      .toString())),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "体验时长：" +
                              (((detaildatamodal?.data?.event?[select!]
                                              .experienceLength ==
                                          "" ||
                                      detaildatamodal?.data?.event?[select!]
                                              .experienceLength ==
                                          null)
                                  ? "N/A"
                                  : (detaildatamodal?.data?.event?[select!]
                                          .experienceLength)
                                      .toString())),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "体验地点：" +
                              (((detaildatamodal?.data?.event?[select!]
                                              .eventLocation ==
                                          "" ||
                                      detaildatamodal?.data?.event?[select!]
                                              .eventLocation ==
                                          null)
                                  ? "N/A"
                                  : (detaildatamodal
                                          ?.data?.event?[select!].eventLocation)
                                      .toString())),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "体验费用：" +
                              (((detaildatamodal?.data?.event?[select!]
                                              .eventFee ==
                                          "" ||
                                      detaildatamodal?.data?.event?[select!]
                                              .eventFee ==
                                          null)
                                  ? "N/A"
                                  : (detaildatamodal
                                          ?.data?.event?[select!].eventFee)
                                      .toString())),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "点击”确认无误“完成报名",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          child: Container(
                            width: 150.w,
                            height: 40.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                                    right:
                                        BorderSide(color: Color(0xffbDFDEDE)),
                                    top:
                                        BorderSide(color: Color(0xffbDFDEDE)))),
                            child: Center(
                              child: Text("返回",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontFamily: 'simsan')),
                            ),
                          ),
                          onTap: () {
                            Get.back();
                          }),
                      GestureDetector(
                          child: Container(
                            width: 150.w,
                            height: 40.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: Color(0xffbDFDEDE)),
                                    top:
                                        BorderSide(color: Color(0xffbDFDEDE)))),
                            child: Center(
                              child: Text("确认无误",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontFamily: 'simsan')),
                            ),
                          ),
                          onTap: () {
                            signupbutton(
                                detaildatamodal?.data?.event?[select!].eventId);
                            Get.back();
                          })
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }

  generatepdfap() {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? "";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().generatepdfapi(data).then((response) async {
          pdfmodal = GeneratePdfModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && pdfmodal?.status == "success") {
            print("hdffgbv");
            print(pdfmodal?.data?.name);
            per1 = 100 -
                ((double.parse((pdfmodal?.data?.exprienceCount).toString()) *
                        double.parse((pdfmodal?.data?.ideaOwned).toString())) /
                    100);

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
      EasyLoading.show(status: 'Share...');
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
                      imageUrl == null || imageUrl == ""
                          ? pw.ClipOval(
                              child: pw.Container(
                                width: 80,
                                height: 80,
                                decoration: pw.BoxDecoration(
                                    shape: pw.BoxShape.circle,
                                    image: pw.DecorationImage(
                                        image: imageProvider)),
                              ),
                            )
                          : pw.ClipOval(
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
                                      : (per1?.toStringAsFixed(2)).toString() +
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

    print("file");
    String? filePath = '${dir?.path}/${userdata?.userData?.username}.pdf';
    print(filePath);
    final File file = File(filePath!);
    print("skdjfgjdfskg");
    await file.writeAsBytes(await pdf.save());

    // final sharedFilePath = await filePath.copy('path_to_shared_pdf.pdf');

    setState(() {
      _isLoading = false;
      EasyLoading.showSuccess('pdf下载成功');
      Share.shareFiles([filePath]);
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
