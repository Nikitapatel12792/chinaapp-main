import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chet/Modal/UserProfileModal.dart';
import 'package:chet/Modal/generatepdfmodal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/19.dart';
import 'package:chet/screens/2.dart';
import 'package:chet/screens/FollowScreen.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

class Twentythree extends StatefulWidget {
  String? user;
  int? set;
  Twentythree({Key? key,this.user,this.set}) : super(key: key);

  @override
  State<Twentythree> createState() => _TwentythreeState();
}

class _TwentythreeState extends State<Twentythree> {

  double ? per;
  bool isLoading=true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GeneratePdfModal? pdfmodal;
  double? per1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generatepdfap();

  }
  bool? _isLoading = true;
  Timer? _timer;
  getdata()async{

    Uint8List? imageBytes = await captureScaffoldToImage();
    saveCapturedImage(imageBytes!);
  }
  Future<Uint8List?> captureScaffoldToImage() async {
    setState(() {
      _isLoading = true;
      EasyLoading.show(status: '保存..');
    });
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

    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/captured_image.png';
    File(imagePath).writeAsBytesSync(imageBytes);

    // Save the image to the gallery
    final result = await ImageGallerySaver.saveImage(imageBytes, name: 'captured_image');

    if (result['isSuccess']) {
      setState(() {
        _isLoading = false;
        EasyLoading.showSuccess(
            '图像已保存',);
      });
      Timer(Duration(seconds: 5), () {
        widget.set ==1 ?Get.to(Nineteen(user: widget.user,)) :Get.to(Nineteenone(user: widget.user,));
      });
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
      child:commanScreen(
        isLoading: isLoading,
        scaffold: Scaffold(
          extendBodyBehindAppBar: true,
          body:isLoading? Container(): GestureDetector(

            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/img23.jpg"
                      ),
                      fit: BoxFit.cover
                  )
              ),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffb777777).withOpacity(0.3),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0.h,
                        left: 0.w,
                        right: 0.w,),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h,),
                            Padding(
                              padding: EdgeInsets.only(left:15.w),
                              child: Image.asset("assets/img 4.png",width: 60.w,height: 34.h,),
                            ),
                            SizedBox(height: 10.h,),
                            Container(

                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 80.w,
                                    // width: 80.w,
                                    alignment: Alignment.center,
                                    child: Text(pdfmodal?.data?.name==null?"姓名":pdfmodal?.data?.name ?? "",style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontFamily: "simsan"
                                    ),),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.w),
                                    child: GestureDetector(
                                      onTap: (){
                                        // Get.to(TwentyFour());
                                      },
                                      child: Container(
                                        height: 80.w,
                                        width: 80.w,

                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [Colors.blue, Colors.pink],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(80),
                                          child: CachedNetworkImage(
                                              imageUrl: (pdfmodal?.data?.profilePicture).toString(),
                                              imageBuilder: (context, imageProvider) => Container(height: 60.w,width: 60.w,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(90.sp),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  gradient: LinearGradient(
                                                    colors: [Colors.blue, Colors.pink],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) => CircularProgressIndicator(),
                                              errorWidget: (context, url, error) =>
                                                  Icon(
                                                    Icons.person,
                                                    color: Colors.white.withOpacity(0.59),
                                                    size: 50.sp,
                                                  )
                                            // Icon(Icons.person,size: 35.sp,color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              // height:230.h ,
                              padding: EdgeInsets.all(15.w),
                              margin: EdgeInsets.only(left: 20.w),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.63),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("截至今天,我已经在嘛呢。",style: TextStyle(
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
                                        Text("体验了",style: textstyle,),
                                        Text(pdfmodal?.data?.exprienceCount==""||pdfmodal?.data?.exprienceCount==null?"0":(pdfmodal?.data?.exprienceCount).toString(),style: textstyle1),
                                        Text("个点子",style: textstyle),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.w),
                                    child: Row(
                                      children: [
                                        Text("个点子",style: textstyle),
                                        Text(pdfmodal?.data?.collectedCount== ""||pdfmodal?.data?.collectedCount==null?"0":(pdfmodal?.data?.collectedCount).toString(),style:textstyle1),
                                        Text("个点子",style: textstyle),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.w),
                                    child: Row(
                                      children: [
                                        Text("体验数超过了",style: textstyle),
                                        Text(pdfmodal?.data?.exprienceCount==""||pdfmodal?.data?.exprienceCount==null?"0":(per1?.toStringAsFixed(2)).toString() + "%",style:textstyle1),
                                        Text("的嘛呢用户",style: textstyle),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Text(" 因为你的存在让我们这一物种变得更加有趣！",style: textstyle),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Text("我最近体验过的5个点子是...",style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontFamily: "simsan",
                              ),),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                // height:160.h,
                                padding: EdgeInsets.all(15.w),
                                margin: EdgeInsets.only(right: 25.w),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.77),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30))
                                ),
                                child:pdfmodal?.data?.expriencedIdeas?.length == 0?Container(
                                    height: 20.h,child:Center(
                                  child: Text("没有想法经验",style:TextStyle(  color: Colors.black,
                                      fontSize: 11.sp,
                                      fontFamily: "simsan")),
                                )):
                                    Column(
                                      children:[
                                        for(int index=0;index<(pdfmodal?.data?.expriencedIdeas?.length ?? 0);index++)...[
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text((index+1).toString() + " . ", style: TextStyle(
                                                    color: Color(0xffb333333),
                                                    fontSize: 14.sp,
                                                    fontFamily: "simsan"
                                                ),),
                                                Expanded(
                                                  child: Text((pdfmodal?.data?.expriencedIdeas?[index].ideaTitle == null || pdfmodal?.data?.expriencedIdeas?[index].ideaTitle == ''?'N/A':pdfmodal?.data?.expriencedIdeas?[index].ideaTitle).toString(),
                                                    style: TextStyle(
                                                        color: Color(0xffb333333),
                                                        fontSize: 14.sp,
                                                        fontFamily: "simsan"
                                                    ),),
                                                ),
                                              ],
                                            ),
                                          )
                                        ]
                                      ]
                                    )

                            ),
                            SizedBox(height: 20.h,),
                            // Container(
                            //     margin: EdgeInsets.symmetric(horizontal: 15.w),
                            //     width: MediaQuery.of(context).size.width,
                            //     height:100.h,
                            //     color:Colors.white.withOpacity(0.78),
                            //     child: Row(
                            //       children: [
                            //         Column(
                            //           crossAxisAlignment: CrossAxisAlignment.end,
                            //           children: [
                            //             Image.asset("assets/barcode.png",height:72.w,width: 72.w,),
                            //             Text("长按/扫码进入APP下载界面",style: TextStyle(color: Color(0xffb3B3A3A),fontFamily: "simsan",fontSize: 8.sp),)
                            //           ],
                            //         ),
                            //         SizedBox(width: 10.w,),
                            //         Column(
                            //           children: [
                            //             Image.asset("assets/img25.png",height: 80.h,width: 87.w,),
                            //           ],
                            //         ),
                            //         SizedBox(width: 10.w,),
                            //         VerticalDivider(),
                            //         SizedBox(
                            //           width: 110.w,
                            //           child: Column(
                            //             crossAxisAlignment: CrossAxisAlignment.start,
                            //             children: [
                            //               Image.asset("assets/img 4.png",width: 60.w,height: 34.h,color: Colors.black,),
                            //               Text("超过30,000+人类体验点子，用15分钟体验一个新奇好玩的点子这个世界哪里无聊了?",maxLines: 4,style: TextStyle(
                            //                   fontSize: 10.sp,
                            //                   color: Colors.black,
                            //                   fontFamily: "simsan"
                            //               ),)
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     )
                            // )
                          ],
                        ),
                      ))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  TextStyle textstyle = TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontFamily:"sfproreg"
  );
  TextStyle textstyle1 =  TextStyle(
      color: Colors.white,
      fontSize: 35.sp,
      fontFamily:"sfproreg"
  );
  TextStyle textstyle2 = TextStyle(
      color: Color(0xffb121212),
      fontSize: 14.sp,
      fontFamily:"sfproreg"
  );

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

            getdata();
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
