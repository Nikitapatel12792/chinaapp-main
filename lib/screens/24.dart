import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chet/Modal/UserProfileModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/25.dart';
import 'package:chet/screens/28.dart';
import 'package:chet/screens/ChatListing.dart';
import 'package:chet/screens/NotificationScreen.dart';
import 'package:chet/screens/SelfIdeaCreated.dart';
import 'package:chet/screens/profilePage.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class TwentyFour extends StatefulWidget {
  const TwentyFour({Key? key}) : super(key: key);

  @override
  State<TwentyFour> createState() => _TwentyFourState();
}

class _TwentyFourState extends State<TwentyFour> {
  Userprofile? userprofile;
  @override
  TextEditingController _changename = TextEditingController();
  bool isLoading=true;

  void initState() {
    // TODO: implement initState
    super.initState();
    userpfdata();

  }

  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;
  File? selectedimage;
  var photo = "";

  @override
  Widget build(BuildContext context) {
    return commanScreen(
        isLoading: isLoading,
        scaffold: Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Bottomnavbar(sel: 3),
      body:isLoading?Container(): SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imag24.jpg"), fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(width: 140.w,),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      height: 85.w,
                      width: 85.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.pink, Colors.blue],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                (userprofile?.data?.profilePicture).toString(),
                            progressIndicatorBuilder: (context, url, progress) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(
                                  Icons.person,
                                  color: Colors.white.withOpacity(0.59),
                                  size: 50.sp,
                                )
                            // Image
                            //     .asset(
                            //   'assets/user.png',
                            //   color: Colors
                            //       .black,
                            // ),
                            ),
                      ),
                    ),
                  ),

                  SizedBox(
                   width: 5.w,
                  ),
                  TextButton(onPressed: (){Get.to(profilePage());}, child:Text("编辑头像&用户名",style: TextStyle(
                    color: Color(0xffbffffff),
                    fontFamily: "simsan",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,

                    decoration: TextDecoration.underline,
                  ),))
                ],
              ),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      userprofile?.data?.username==""|| userprofile?.data?.username== null?"姓名":userprofile?.data?.username ?? "",
                      style: TextStyle(
                        color: Color(0xffbffffff),
                        fontFamily: "simsan",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(userprofile?.data?.noOfExperienced==""||userprofile?.data?.noOfExperienced==null?"0":(userprofile?.data?.noOfExperienced).toString(),
                            style: textstyle),
                        Text("已体验", style: textstyle),
                      ],
                    ),
                    Column(
                      children: [
                        Text(userprofile?.data?.noOfCollected==""||userprofile?.data?.noOfCollected==null?"0":(userprofile?.data?.noOfCollected).toString(),
                            style: textstyle),
                        Text("已收藏", style: textstyle),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(SelfIdeaCreted());
                      },
                      child: Column(
                        children: [
                          Text(userprofile?.data?.noOfOwned==""||userprofile?.data?.noOfOwned==null?"0":(userprofile?.data?.noOfOwned).toString(),
                              style: textstyle),
                          Text("已认领", style: textstyle),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 350.h,
                // padding: EdgeInsets.all(15.w),
                margin: EdgeInsets.only(right: 25.w),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.59),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(NotificationScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                        padding: EdgeInsets.all(15.w),
                        margin: EdgeInsets.only(right: 25.w),
                        decoration: BoxDecoration(
                            color: Color(0xffb252323).withOpacity(0.72),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.chat_bubble_2,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "站内消息",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontFamily: "simsan"),
                                ),
                              ],
                            ),
                            // messagenotificationmodal?.data == 0 ?Container():
                            // Positioned(
                            //     top: 0.h,
                            //     left: 165.h,
                            //     child: Icon(Icons.circle,size: 10.sp,color:Color(0xffFFB600))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(ChatListPage());
                        // qrcodescan();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                        padding: EdgeInsets.all(15.w),
                        margin: EdgeInsets.only(right: 25.w),
                        decoration: BoxDecoration(
                            color: Color(0xffb252323).withOpacity(0.72),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child:Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.message_rounded,
                                  color: Colors.white,
                                  // size: 17.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "|发起会话",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontFamily: "simsan"),
                                ),
                              ],
                            ),
                            messagenotificationmodal?.data == 0 ?Container():
                            Positioned(
                                top: 0.h,
                                left: 165.h,
                                child: Icon(Icons.circle,size: 10.sp,color:Color(0xffFFB600))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Twentyeight());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                        padding: EdgeInsets.all(15.w),
                        margin: EdgeInsets.only(right: 25.w),
                        decoration: BoxDecoration(
                            color: Color(0xffb252323).withOpacity(0.72),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.travel_explore,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "人类体验库系统信息",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontFamily: "simsan"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        qrcodescan();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                        padding: EdgeInsets.all(15.w),
                        margin: EdgeInsets.only(right: 25.w),
                        decoration: BoxDecoration(
                            color: Color(0xffb252323).withOpacity(0.72),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.headphones,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "联系客服",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontFamily: "simsan"),
                            ),
                          ],
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: Text(
                        "Singapore Eveforce Technology Pte. Ltd. 2021",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "@All Rights Reserved",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
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
        )
    );
  }
  TextStyle textstyle =
      TextStyle(color: Colors.white, fontSize: 14.sp, fontFamily: "simsan");

  userpfdata() {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? "";
    data['login_user_id'] = userdata?.userData?.id ?? "";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().userprofileapi(data).then((response) async {
          userprofile = Userprofile.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && userprofile?.status == "success") {
            print(userprofile?.data?.isFollow);
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
        buildErrorDialog(context, '错误 ', "需要互联网");
      }
    });
  }

  profileedit() {
    AlertDialog alert = new AlertDialog(
      backgroundColor: Colors.white.withOpacity(0.59),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      actions: [
        Container(
          height: 256.h,
          width: 250.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            // color: Colors.black.withOpacity(0.59),
          ),
          child: Column(
            children: [
              Text(
                "设置用户头像",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 100.w,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.pink],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                margin: EdgeInsets.all(2.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: selectedimage != null
                      ? ClipRRect(borderRadius: BorderRadius.circular(90),
                        child: Image.file(
                            selectedimage!,
                            height: 100.w,
                            width: 100.w,fit: BoxFit.cover,
                          ),
                      )
                      : CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: '',
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                                Icons.person,
                                color: Colors.white.withOpacity(0.59),
                                size: 50.sp,
                              )
                          // Image
                          //     .asset(
                          //   'assets/user.png',
                          //   color: Colors
                          //       .black,
                          // ),
                          ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextButton(
                  onPressed: () {
                    profilephotoalert();
                  },
                  child: Text(
                    "点我更换",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  )),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "输入用户名",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50.w),
                decoration: BoxDecoration(),
                child: TextFormField(
                  controller: _changename,
                  style: TextStyle(fontSize: 20.0, color: Colors.black54),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9.0),
                    hintStyle: TextStyle(color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(color: Colors.black, thickness: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "取消",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        )),
                    VerticalDivider(
                      thickness: 2,
                      color: Colors.black, // Color of the vertical line
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "确定上传",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  profilephotoalert() {
    AlertDialog alert = new AlertDialog(
      backgroundColor: Colors.white.withOpacity(0.59),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      actions: [
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () async {
                        XFile? photo =
                            await _picker.pickImage(source: ImageSource.camera);
                        selectedimage = File(photo!.path);
                        setState(() {
                          selectedimage = File(photo!.path);
                        });

                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                      )),
                  Text(
                    "相机",
                    style: TextStyle(color: Colors.black45, fontSize: 10.sp),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () async {
                        XFile? photo = await _picker.pickImage(
                            source: ImageSource.gallery);
                        selectedimage = File(photo!.path);
                        setState(() {
                          selectedimage = File(photo!.path);
                        });
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.browse_gallery,
                      )),
                  Text(
                    "画廊",
                    style: TextStyle(color: Colors.black45, fontSize: 10.sp),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
  qrcodescan() {
    AlertDialog alert = new AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      actions: [
        Container(
          height: 265.h,
          width: 250.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            // color: Colors.black.withOpacity(0.59),
          ),
          child: Column(
            children: [
             Image.asset("assets/barcode.png",fit: BoxFit.cover,),

              Text("长按扫描二维码添加嘛呢人工客服",style: TextStyle(
                fontFamily: "simsan",
                color: Colors.black,
                fontSize: 16.sp,

              ),)
            ],
          ),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

}
