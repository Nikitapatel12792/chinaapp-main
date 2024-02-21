import 'package:cached_network_image/cached_network_image.dart';
import 'package:chet/screens/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg-img.png'), fit: BoxFit.cover),
        ),
        child:Stack(
          children: [
            Container(
              // background image
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
            ),
            Container(
              padding: EdgeInsets.all(15.w),
              child: Column(
                children: [
                  SizedBox(height: 30.h,),
                  Text("我的简历",style: TextStyle(fontSize: 26.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(height: 20.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //profile pic
                      Container(
                          height: 120.w,
                        width: 120.w,
                        // padding: EdgeInsets.all(1.w),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                              "https://shayariholic.com/wp-content/uploads/2022/09/whatsapp-dp-86-983x1024.jpg",

                            progressIndicatorBuilder: (context, url, progress) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/user.png',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50.w,),
                      // name nad email
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("佐罗纳罗罗纳 ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp,color: Colors.white),),
                            Text("abc@cnmail.com",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16.sp,color: Colors.white),)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  // edit button
                  Container(
                    margin: EdgeInsets.all(15.w),
                    child: InkWell(
                      onTap: () {
                        Get.to(Editprofile());
                      },
                      child: Container(
                        height: 30.h,
                        width: 120.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: Colors.grey),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('编辑个人资料',style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h,),
                  //address
                  Row(
                    children: [
                      Icon(Icons.home,color: Colors.white),
                      SizedBox(width: 20.w,),
                      Text("地址 : ",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("苏拉特阿达詹阿康广场",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  // age
                  Row(
                    children: [
                      Icon(Icons.person,color: Colors.white),
                      SizedBox(width: 20.w,),
                      Text("年龄 : ",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("十",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  //idea
                  Row(
                    children: [
                      Icon(Icons.lightbulb,color: Colors.white),
                      SizedBox(width: 20.w,),
                      Text("总体理念 : ",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("三十",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 15.h,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
