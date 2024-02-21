import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chet/Modal/ProfileEditModal.dart';
import 'package:chet/Modal/UserProfileModal.dart';
import 'package:chet/provider/authprovider.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/24.dart';
import 'package:chet/screens/4.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  Userprofile? userprofile;
  ImagePicker _picker = ImagePicker();
  File? selectedimage;
  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();
  double? _imageSizeInMB;


  List<File> selectedimages = [];
  TextEditingController _changename = TextEditingController();
  List<XFile>? resultList;
  List<XFile>? resultList1;
  List<File> selectedImages = [];
  List<String> imagePaths = [];
  List<XFile> imagesList = <XFile>[];
  String _error = 'No Error Dectected';
  List<String> imageNames = [];
  int maxImageLimit = 9;
  bool? isImageSizeLessThan30MB=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userpfdata();

  }
  Future<void> _loadImageSize() async {
    int fileSizeInBytes = await selectedimage?.length() ?? 0;
    double fileSizeInMB = fileSizeInBytes / (1024 * 1024); // Convert to MB

    setState(() {
      _imageSizeInMB = fileSizeInBytes.toDouble();

       isImageSizeLessThan30MB = _imageSizeInMB != null && _imageSizeInMB! < 30 * 1024  *1024;

  });

  }
   _getImageExtension(String imagePath) {
    return path.extension(imagePath).toLowerCase();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.59),
          ),

          child: Container(
            height: 100.h,
            width: 150.w,


            child: Column(
              children: [
                SizedBox(height: 150.h,),
                Text(
                  "设置用户头像",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 10.h,
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
                        width: 100.w, fit: BoxFit.cover,
                      ),
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                          child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:userprofile?.data?.profilePicture ?? "",
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(
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
                  height: 10.h,
                ),
                TextButton(
                    onPressed: () {
                      profilephotoalert();
                    },
                    child: Text(
                      "点我更换",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: "simsan",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "输入用户名",
                  style: TextStyle(
                      fontFamily: "simsan",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50.w),
                  decoration: BoxDecoration(),
                  child: TextFormField(
                    controller: _changename,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "输入电子邮件";
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
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
                  height: 15.h,
                ),
                Divider(color: Colors.grey, thickness: 1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.to(TwentyFour());
                            },
                            child: Text(
                              "取消",
                              style: TextStyle(
                                  fontFamily: "simsan",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            )),

                        Container(
                          height: 40.h,
                          child: VerticalDivider(
                            color: Colors.black,
                            thickness: 1,

                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              // print(selectedimage?.path ?? '');
                              uploadImage();
                            },
                            child: Text(
                              "确定上传",
                              style: TextStyle(
                                  fontFamily: "simsan",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            )),
                      ],
                    ),
                  ),
                ),
                Divider(color: Colors.grey, thickness: 1),
              ],
            ),
          ),
        ),
      ),

    );
  }


  profilephotoalert() {
    AlertDialog alert = new AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      actions: [
        Container(
          height: 265.w,
          width: 265.w,
          child: Column(
            children: [
              SizedBox(height: 15.h,),
              Text("上传用户头像", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),),
              SizedBox(height: 25.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(
                    children: [
                      Container(
                        height: 70.w,
                        width: 70.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: IconButton(
                            onPressed: () async {
                              // resultList = await ImagePicker().pickMultiImage();
                              //
                              // if (resultList != null) {
                              // if (resultList!.length + selectedImages.length > maxImageLimit) {
                              //
                              // print('Maximum image limit exceeded');
                              // } else {
                              // setState(() {
                              // selectedImages = resultList!.map((XFile file) => File(file.path)).toList()!;
                              // });
                              // }
                              //
                              //                       }
                              XFile? photo =
                              await _picker.pickImage(source: ImageSource.camera);
                              selectedimage = File(photo!.path);
                              setState(() {
                                selectedimage = File(photo!.path);
                              });
                              Navigator.of(context).pop();
                              _loadImageSize();
                              isImageSizeLessThan30MB!?"":  buildErrorDialog2(context, "哎呀", "图片太大，不能超过30MB", () { Get.back();}, "重新上传", () {Get.back(); }, "返回", Colors.black, Color(0xffb14559E));
                              _getImageExtension(selectedimage.toString());
                              String _imageExtension = path.extension(photo!.path).toLowerCase();
                              bool isImageExtensionValid = ['.jpg', '.jpeg', '.png'].contains(_imageExtension);
                              print(isImageExtensionValid);
                              isImageExtensionValid?"":buildErrorDialog2(context, "", "无法识别图像格式 请上传JPG, JPEG, PNG格式图片哦", () { Get.back();}, "重新上传", () {Get.back(); }, "返回", Colors.black, Color(0xffb14559E));

                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 30.sp,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "相机",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontFamily: "simsan"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 70.w,
                        width: 70.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: IconButton(
                            onPressed: () async {
                              XFile? photo = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              selectedimage = File(photo!.path);
                              setState(() {
                                selectedimage = File(photo!.path);
                              });     Navigator.of(context).pop();
                              _loadImageSize();
                              isImageSizeLessThan30MB!?"":  buildErrorDialog2(context, "哎呀", "图片太大，不能超过30MB", () { Get.back();}, "重新上传", () {Get.back(); }, "返回", Colors.black, Color(0xffb14559E));
                              _getImageExtension(selectedimage.toString());
                              String _imageExtension = path.extension(photo!.path).toLowerCase();
                              bool isImageExtensionValid = ['.jpg', '.jpeg', '.png'].contains(_imageExtension);
                              print(isImageExtensionValid);
                              isImageExtensionValid?"":buildErrorDialog2(context, "", "无法识别图像格式 请上传JPG, JPEG, PNG格式图片哦", () { Get.back();}, "重新上传", () {Get.back(); }, "返回", Colors.black, Color(0xffb14559E));


                            },
                            icon: Icon(
                              Icons.browse_gallery,
                              size: 30.sp,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "画廊",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontFamily: "simsan"),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              Divider(color: Colors.grey, thickness: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            print("123");
                            Navigator.pop(context);
                          },
                          child: Text(
                            "取消",
                            style: TextStyle(
                                fontFamily: "simsan",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          )),

                      Container(
                        height: 40.h,
                        child: VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,

                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            print("123");
                            // print(selectedimage?.path ?? '');
                            Navigator.pop(context);
                          },
                          child: Text(
                            "确定上传",
                            style: TextStyle(
                                fontFamily: "simsan",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          )),
                    ],
                  ),
                ),
              ),
              // Divider(color: Colors.grey, thickness: 1),

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

  uploadImage() {
    if (_formKey.currentState!.validate()){
      final Map<String, String> data = {};
      data['user_id'] = userdata?.userData?.id ?? "";
      data['name'] = _changename.text.toString();
      data['profile_pic'] =
      selectedimage?.path == null ? '' : selectedimage?.path ?? "";


      print(data);
      if(_changename.text.length >=20){
        buildErrorDialog2(context, "用户名太长不能超过20字节", "回归者", () { Get.back();}, "返回编辑", () {Get.back(); }, "退出", Colors.black, Color(0xffb14559E));
      } else{
        checkInternet().then((internet) async {

          if (internet) {
            authprovider().profileupdateapi(data).then((response) async {
              profileeditmodal =
                  ProfileEditModal.fromJson(json.decode(response.body));

              if (response.statusCode == 200 &&
                  profileeditmodal?.status == "success") {
                Get.to(Four());
                setState(() {
                  isLoading = false;
                });
              } else {
                buildErrorDialog(
                    context, 'Field Error', (profileeditmodal?.status).toString());
              }
            });
          } else {
            setState(() {
              isLoading = false;
            });
            buildErrorDialog(context, 'Error', "Internate Required");
          }
        });
      }





    }}
  userpfdata(){
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? "";
    data['login_user_id'] = userdata?.userData?.id ?? "";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().userprofileapi(data).then(( response) async {
          userprofile = Userprofile.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && userprofile?.status == "success") {

            setState(() {
              _changename.text = userprofile?.data?.username ?? "";

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


