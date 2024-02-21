import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/10.dart';
import 'package:chet/screens/16%20.dart';
import 'package:chet/screens/FollowScreen.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/imagescreen.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui' as ui;


class Sharedesign extends StatefulWidget {
  String? id;
  String? ideaid;


  Sharedesign({super.key, this.id,this.ideaid});

  @override
  State<Sharedesign> createState() => _SharedesignState();
}

class _SharedesignState extends State<Sharedesign> {
  TextEditingController _commenttitle = TextEditingController();
  TextEditingController _commentdesc = TextEditingController();
  TextEditingController _subcommenttitle = TextEditingController();
  Userprofile? userprofile;
  int? select =0;
  var imagePaths;
  String? user;
  List<File> selectedImages = []; // List of selected image
  ImagePicker _picker = ImagePicker();
  int maxImageLimit = 9;
  File? selectedimage;
  int _rating = 0;
  String? _currentAddress;
  Position? _currentPosition;
  DisplayemotionModal?    emotiondisplay;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  DateTime currentDate = DateTime.now();
  bool set=false;
  String commaSeparated = "";
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    await ideadetailap();
    await displayemotionap();

  }
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentSliderSecondaryValue = 0;
  int selected = 1;
  bool isLoading = true;
  bool  _isLoading = false;

  Future<Uint8List?> captureScaffoldToImage() async {

    setState(() {
      _isLoading = true;
      EasyLoading.show(status: '保存..');
    });
    print(2);
    RenderRepaintBoundary? boundary =
    _scaffoldKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    if(boundary == null){

    }
    else{
      ui.Image image = await boundary.toImage(pixelRatio: 3.0); // Adjust pixelRatio as needed
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    }

  }
  void saveCapturedImage(Uint8List imageBytes) async {
    print(3);
    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/img.png';
    File(imagePath).writeAsBytesSync(imageBytes);
print(imagePath);
    // Save the image to the gallery
    final result = await ImageGallerySaver.saveImage(imageBytes, name: 'captured_image');
    if (result['isSuccess']) {
      setState(() {
        _isLoading = false;
        EasyLoading.showSuccess(
          '图像已保存',);
      });
      Share.shareFiles([imagePath]);
      Get.to(Tenth(id: widget.id,));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Image is saved to gallery.'),
      //     duration: Duration(seconds: 3), // How long the SnackBar will be displayed
      //   ),
      // );
    } else {
      print('Failed to save image to gallery');
    }
  }
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _scaffoldKey,
      child:
       Scaffold(
          body:
              SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/img7.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 200.h,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(
                           30.0
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "体验感受中位数：" + (((emotiondisplay?.emotionName)==null||(emotiondisplay?.emotionName).toString() == "")? "记录" : (emotiondisplay?.emotionName).toString()),
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
                                    '预计时长：${detaildatamodal?.data?.experienceLength ?? ''} ',
                                    style: TextStyle(
                                        fontFamily: "simsan",
                                        color: Color(0xffbB0ACAC),
                                        fontSize: 14.sp),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.w),
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
                                  Text(
                                    detaildatamodal
                                        ?.data?.contributorName ??
                                        "",
                                    style: TextStyle(
                                        fontFamily: "simsan",
                                        color: Color(0xffbA8A4A4),
                                        fontSize: 12.sp),
                                  )
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding:
                            //   EdgeInsets.symmetric(horizontal: 20.w),
                            //   child: Divider(
                            //     color: Colors.white70,
                            //     thickness: 1.h,
                            //   ),
                            // ),
                            // Container(
                            //   height: 55.h,
                            //   width: double.infinity,
                            //   alignment: Alignment.center,
                            //   color: Colors.white.withOpacity(0.6),
                            //   child: Row(
                            //       crossAxisAlignment:
                            //       CrossAxisAlignment.center,
                            //       mainAxisAlignment:
                            //       MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         Column(
                            //           mainAxisAlignment:
                            //           MainAxisAlignment.center,
                            //           children: [
                            //             GestureDetector(
                            //                 onTap: () {
                            //
                            //                 },
                            //                 child: detaildatamodal?.data
                            //                     ?.experienceValue ==
                            //                     "1"
                            //                     ? GestureDetector(
                            //                   onTap: () {
                            //
                            //                   },
                            //                   child: Icon(
                            //                     Icons
                            //                         .check_circle_rounded,
                            //                     color: Color(
                            //                         0xffb191818),
                            //                   ),
                            //                 )
                            //                     : GestureDetector(
                            //                   onTap: () {
                            //
                            //                   },
                            //                   child: Icon(
                            //                       Icons
                            //                           .check_circle_outline_rounded,
                            //                       color: Color(
                            //                           0xffb191818)),
                            //                 )),
                            //             GestureDetector(
                            //               onTap: (){
                            //
                            //               },
                            //               child: Text(
                            //                 '已体验',
                            //                 style: TextStyle(
                            //                     fontFamily: "simsan",
                            //                     color: Color(0xffb333333),
                            //                     fontSize: 17.sp),
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //         Column(
                            //           mainAxisAlignment:
                            //           MainAxisAlignment.center,
                            //           children: [
                            //             GestureDetector(
                            //                 onTap: () {
                            //
                            //                 },
                            //                 child: detaildatamodal?.data
                            //                     ?.collectionValue ==
                            //                     "1"
                            //                     ? GestureDetector(
                            //                   onTap: () {
                            //
                            //
                            //                   },
                            //                   child: Icon(
                            //                     Icons
                            //                         .favorite_rounded,
                            //                     color: Color(
                            //                         0xffb9F1818),
                            //                   ),
                            //                 )
                            //                     : GestureDetector(
                            //                   onTap: () {
                            //
                            //                   },
                            //                   child: Icon(
                            //                       Icons
                            //                           .favorite_border,
                            //                       color: Color(
                            //                           0xffb191818)),
                            //                 )),
                            //             GestureDetector(
                            //               onTap: (){
                            //
                            //               },
                            //               child: Text(
                            //                 '收藏',
                            //                 style: TextStyle(
                            //                     fontFamily: "simsan",
                            //                     color: Color(0xffb333333),
                            //                     fontSize: 17.sp),
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //         Column(
                            //           mainAxisAlignment:
                            //           MainAxisAlignment.center,
                            //           children: [
                            //             GestureDetector(
                            //                 onTap: () {
                            //                   Share.share(
                            //                       "https://pub.dev/packages/flutter_share");
                            //                 },
                            //                 child: Icon(Icons.share)),
                            //             Text(
                            //               '分享',
                            //               style: TextStyle(
                            //                   fontFamily: "simsan",
                            //                   color: Color(0xffb333333),
                            //                   fontSize: 17.sp),
                            //             )
                            //           ],
                            //         ),
                            //         Row(
                            //             children:[
                            //               Column(
                            //                 mainAxisAlignment:
                            //                 MainAxisAlignment.center,
                            //                 children: [
                            //                   GestureDetector(
                            //                     onTap: () {
                            //                       buildErrorDialog2(
                            //                           context,
                            //                           "您已认领该体验",
                            //                           "若需修改内容请返回“我的”界面删除当前认领体验后再重新编辑",
                            //                               () {
                            //                             Get.to(Sixteenth(
                            //
                            //                               ideaid: widget.id
                            //                                   .toString(),
                            //                             ),
                            //
                            //                             );
                            //                             // experincebuttonap();
                            //                           },
                            //                           "好的",
                            //                               () {
                            //                             Get.back();
                            //                           },
                            //                           "返回",
                            //                           Colors.black,
                            //                           Color(0xffb14559E));
                            //                     },
                            //                     child: Column(
                            //                       children: [
                            //                         Icon(Icons.screenshot),
                            //                         SizedBox(width: 5.w),
                            //                         Text(
                            //                           '认领',
                            //                           style: TextStyle(
                            //                               fontFamily: "simsan",
                            //                               color: Color(0xffb333333),
                            //                               fontSize: 17.sp),
                            //                         )
                            //                       ],
                            //                     ),
                            //                   ),
                            //
                            //                 ],
                            //               ),
                            //               Column(
                            //                 mainAxisAlignment: MainAxisAlignment.center,
                            //                 crossAxisAlignment: CrossAxisAlignment.end ,
                            //                 children: [
                            //                   Text(
                            //                     '*举办活动',
                            //                     style: TextStyle(
                            //                         fontFamily:
                            //                         "simsan",
                            //                         color: Color(
                            //                             0xffb333333),
                            //                         fontSize: 11.sp),
                            //                   ),
                            //                   Text(
                            //                     '获得收益',
                            //                     style: TextStyle(
                            //                         fontFamily:
                            //                         "simsan",
                            //                         color: Color(
                            //                             0xffb333333),
                            //                         fontSize: 11.sp),
                            //                   )
                            //                 ],
                            //               )
                            //             ]
                            //         )
                            //
                            //       ]
                            //   ),
                            // ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(height: 10.h,),
                            detaildatamodal?.data?.event?.length == 0
                                ? Container(

                            )
                                : Container(
                              height: 35.h,
                              width:
                              MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w),
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
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 1.w),
                                    height: 30.h,
                                    width: 35.w,
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(90),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: detaildatamodal
                                              ?.data
                                              ?.event?[index2]
                                              .eventProfilePic ??
                                              "",
                                          progressIndicatorBuilder:
                                              (context, url,
                                              progress) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url,
                                              error) =>
                                              Image.asset(
                                                  "assets/user.png",
                                                  color:
                                                  Colors.white)),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Container(
                                // height:180.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.66),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child:Column(
                                  children: [
                                    SizedBox(height: 10.h,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: 20.w,),
                                        Padding(
                                          padding:  EdgeInsets.only(top:10.h),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Image.asset("assets/img 4.png",color: Colors.black,height: 70.h,width: 100.w,),
                                              Text("让体验成为一项人民基本权利",style: TextStyle(
                                                  fontFamily: "simsan",
                                                  color: Colors.black,
                                                  fontSize: 14.sp),)
                                            ],
                                          ),
                                        ),
                                        Container(

                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(

                                                  child: Image.asset("assets/barcode.png",color: Colors.black,height: 138.h,width: 138.w,)),
                                              Container(
                                                padding: EdgeInsets.only(left: 15.w),
                                                width: 138.w,
                                                child: Text("长按/扫码进入APP",style: TextStyle(
                                                    fontFamily: "simsan",
                                                    color: Colors.black,
                                                    fontSize: 14.sp),),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 15.w),
                                                width: 138.w,

                                                child: Text("下载界面",style: TextStyle(
                                                    fontFamily: "simsan",
                                                    color: Colors.black,
                                                    fontSize: 14.sp),),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h,),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.h,),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),

    );
  }







  ideadetailap()     {
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

            List<String> elements =input.replaceAll('[', '').replaceAll(']', '').split(',');
            setState(() {
              commaSeparated = elements.join(',');
            });
            Uint8List? imageBytes = await captureScaffoldToImage();
            saveCapturedImage(imageBytes!);

            print(detaildatamodal?.data?.event?[0].rating);
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












  displayemotionap(){
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
          } else {

          }
        });
      } else {
        setState(() {});
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }


  TextStyle textstyle = TextStyle(
    color: Colors.white,
    fontSize: 11.sp,
    fontFamily:"simsan",
    decoration:TextDecoration.underline,
  );

}
