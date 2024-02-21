import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class commentpage extends StatefulWidget {
  const commentpage({Key? key}) : super(key: key);

  @override
  State<commentpage> createState() => _commentpageState();
}

class _commentpageState extends State<commentpage> {
  TextEditingController _comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:true,
      body: Column(
        children: [
          SizedBox(height: 50.h,),
          Padding(
            padding:  EdgeInsets.all(15.w),
            child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(30.0),
                child: TextField(
                  maxLines: 6,
                  decoration:  InputDecoration(
                    hintText: "#将耳机音量调小偷听旁人谈话 \n \n记录下你的体验感受...",
                    hintMaxLines: 4,
                    hintStyle: TextStyle(color:Color(0xffb2B59A2)),
                    enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none
                    ) ,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      )
                  ),
                  controller: _comment,
                  onSubmitted: (String value) {
                    debugPrint(value);
                  },
                )),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  EdgeInsets.all(15.w),
            child: Row(
              children: [
                Container(
                  height: 100.w,
                  width: 100.w,
                  child: Image.asset("assets/img11.png"),
                ),
                SizedBox(width: 15.w,),
                Container(
                  height: 100.w,
                  width: 100.w,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffb333333),width: 1)
                  ),
                  child: Image.asset("assets/add.png" ,height: 80.w,color: Color(0xffb333333),fit: BoxFit.cover,
                    width: 80.w,),
                )
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding:  EdgeInsets.all(15.w),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined,color: Color(0xffbBE1313),),
                SizedBox(width: 15.w,),
               Text("北京西城区北航大厦202号",style: TextStyle(color: Color(0xffbBE1313),fontSize: 14.sp,fontFamily: "simsan"),)
              ],
            ),
          ),
          SizedBox(height: 200.h,),
          Container(
            alignment: Alignment.center,
            height: 50.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffbBE1313)
            ),
            child: Text("发布",style: TextStyle(color: Colors.white,fontFamily: "simsan",fontSize: 17.sp),),
          )
        ],
      ),
    );
  }
}
