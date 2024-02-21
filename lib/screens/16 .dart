import 'dart:convert';
import 'dart:io';

import 'package:chet/Modal/EventOneModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/17.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/custcont.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:path_provider/path_provider.dart';


class Sixteenth extends StatefulWidget {
  String? ideaid;
  String? name;
  Sixteenth({super.key, this.ideaid,this.name});

  @override
  State<Sixteenth> createState() => _SixteenthState();
}

int selected = 0;

class _SixteenthState extends State<Sixteenth> {
  TextEditingController _desc = TextEditingController();
  TextEditingController eventname = TextEditingController();
  List<XFile>? resultList;
  List<XFile>? resultList1;
  List<File> selectedImages = [];
  List<String> imagePaths = [];
  List<XFile> imagesList = <XFile>[];
  String _error = 'No Error Dectected';
  List<String> imageNames = [];
  ImagePicker _picker = ImagePicker();
  int maxImageLimit = 9;
  File? selectedimage;

   bool isLoading = false;

  // final ImagePicker _picker = ImagePicker();
  // final  controller = MultiImagePickerController(
  // maxImages: 10,
  // withReadStream: true,
  // allowedImageTypes: ['png', 'jpg', 'jpeg'],
  // );

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading:isLoading,
      scaffold: Scaffold(
        bottomNavigationBar: Bottomnavbar(),
        body:SingleChildScrollView(
          child: SizedBox(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //circle indicator
                CustCointainer(val: 0.7),
               SizedBox(
                  height: 5.h,
                ),
                //text
                Center(
                  child: Text(
                    widget.name.toString(),
                    style: TextStyle(
                        color: Color(0xffbBE1313),
                        fontWeight: FontWeight.bold,
                        fontFamily: "simsan",
                        fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Color(0xffbBF1B1B),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        '活动标题',
                        style: TextStyle(color: Colors.white, fontSize: 17.sp,fontWeight: FontWeight.bold,fontFamily: "simsan"),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                        width: 225.w,
                        height: 35.h,

                        child: TextFormField(
                          controller:eventname ,
                          maxLines: 2,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            hintText: '不超过10个中文字',

                            hintStyle: TextStyle(color:Color(0xffb414040),fontFamily: "simsan"),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey), //<-- SEE HERE
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey), //<-- SEE HERE
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey), //<-- SEE HERE
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                // text field
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Color(0xffbBF1B1B),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        '体验描述',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: "simsan",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                        width: 225.w,
                        child: TextField(
                          controller: _desc,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Color(0xffb8A8A8A), fontFamily: "simsan"),
                            hintText:
                            '*输入体验方式、注意事项、需要准备的东西等等。越细节越能吸引用户参与哦！最多200个中文字。',
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey), //<-- SEE HERE
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey), //<-- SEE HERE
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey), //<-- SEE HERE
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                //event picture
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Color(0xffbBF1B1B),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        '体验照片',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: "simsan",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      // height: 200.h,
                        width: 225.w,
                        child: Column(
                          children: [
                            //for first select
                            selectedImages.isEmpty
                                ? GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(

                                  crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {

                                    resultList = await ImagePicker().pickMultiImage();

                                    if (resultList != null) {
                                      if (resultList!.length + selectedImages.length > maxImageLimit) {

                                        print('Maximum image limit exceeded');
                                      } else {
                                        setState(() {
                                          selectedImages = resultList!.map((XFile file) => File(file.path)).toList()!;
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(3.w),
                                    height: 60.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                        border:
                                        Border.all(color: Colors.grey)),
                                  ),
                                );
                              },
                              itemCount: 9,
                            )
                                : Container(),
                            selectedImages.isEmpty
                                ? Container()
                                :
                            //disply after first selection
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(

                                  crossAxisCount: 3),
                              itemCount: 9,
                              itemBuilder: (context, index) {
                                if(index < selectedImages.length && selectedImages[index] != null){
                                  return Stack(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(3.w),
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              border:
                                              Border.all(color: Colors.grey)),
                                          child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              child: Image.file(selectedImages[index],height: 60.h,
                                                width: 70.w,fit: BoxFit.cover))),
                                      Positioned(
                                        left:50.w,
                                          top:10.h,
                                          child: GestureDetector(
                                           onTap:(){
                                             setState(() {
                                               selectedImages.removeAt(index);
                                             });
                                           } ,
                                            child: Container(
                                              height: 15.w,
                                                width:15.w,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                    color:Colors.white
                                                ),
                                                child: Icon(Icons.close,size: 15.sp,)),
                                          ))
                                    ],
                                  );
                                }
                                else{
                                  //remaining container
                                  return GestureDetector(
                                    onTap: ()async{
                                      resultList1 = await ImagePicker().pickMultiImage(
                                      );
                                      if (resultList1 != null) {
                                        if (resultList1!.length + selectedImages.length > maxImageLimit) {
                                          // Handle maximum image limit exceeded
                                         buildErrorDialog(context, "", "您选择的图像超过 9 张");
                                        } else {
                                          setState(() {
                                            print(selectedImages);
                                            selectedImages.addAll(resultList1!.map((XFile file) => File(file.path)).toList());
                                            imagePaths = resultList1!.map((file) => file.path).toList();
                                          });
                                        }
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(3.w),
                                      height: 60.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          border:
                                          Border.all(color: Colors.grey)),),
                                  );
                                }
                              },
                            )                        ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 45.h,
                        width: 120.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffb8A8A8A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '上一步',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontFamily: "simsan"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    InkWell(
                      onTap: (){
                        // Get.to(Seventeenth());
                        eventstepone();

                      },
                      child: Container(
                        height: 45.h,
                        width: 120.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffbBF1B1B),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '下一歩',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontFamily: "simsan"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  eventstepone(){
    setState(() {
      isLoading = true;
    });
    final Map<String, String> data = {};
    data['idea_id'] =widget.ideaid.toString();
    data['user_id'] = userdata?.userData?.id ?? "";
    data['event_description'] =_desc.text.toString();
    data['event_title'] =eventname.text.toString();
    // data['even_pictures'] =  imagePaths;

    print("image data = ${data}");
    if(_desc.text == ""  ||  selectedImages.length ==0||eventname.text==""){
      buildErrorDialog(context, "", "请输入活动描述和ev请输入活动描述和活动图片");
    }
    else if(_desc.text.length >=200 || _desc.text.length <=10){

      buildErrorDialog2(context, "输入字符超过200个中文字", "请返回修改", () { Get.back();}, "返回编辑", () {Get.back(); }, "退出", Colors.black, Color(0xffb14559E));
    }

    else{
      checkInternet().then((internet) async {
        if (internet) {
          ideaprovider().eventone(data,selectedImages).then((response) async {

            eventonemodal = EventOne.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && eventonemodal?.status == "success") {
              print(response.statusCode);
              print("abc");
              setState(() {
                isLoading = false;
              });

              List<File> selectedImages = [];
              List<String> imagePaths = [];
              List<XFile> imagesList = <XFile>[];
              Get.to(Seventeenth(eventid: eventonemodal?.data?.eventId.toString(),name:widget.name.toString()));
            }
            else {
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


}
