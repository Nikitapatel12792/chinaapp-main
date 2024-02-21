import 'package:chet/widgets/botamnavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Twentyeight extends StatefulWidget {
  const Twentyeight({Key? key}) : super(key: key);

  @override
  State<Twentyeight> createState() => _TwentyeightState();
}

class _TwentyeightState extends State<Twentyeight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img28.jpg"
                    ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.all(15.w),
                child: Text(
                  "人类体验信息库",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "sfprobold"
                  ),
                ),
              ),
              // SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  "系统信息",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                      fontFamily: "sfprobold"
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // height:280.h ,
                padding: EdgeInsets.all(15.w),
                margin: EdgeInsets.only(right: 30.w),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.73),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "当前总体验点子数：32,087",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sfproreg"
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "基于机器学习原理的体验分类：23大类",
                      style:textstyle
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "体验时长中位数：13.8分钟",
                      style: textstyle
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "数据库创建时间：2017年7月11日",
                      style:textstyle
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "数据库伺服器地点：中国贵州",
                      style: textstyle
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "数据库备份数：3",
                      style: textstyle
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "数据库IP地址：1.133.45",
                      style: textstyle,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "数据库管理人员：",
                      style: textstyle
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "郑海明（地球籍，2017年至今）",
                        style: textstyle
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "陈典源（地球籍，2020年至今）",
                        style: textstyle
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "大卫 古娜万（地球籍，2019年至今）",
                        style: textstyle
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "数据库迭代备份",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sfproreg"
                          ),
                        ),
                        Text(
                          "我们希望把这个数据库维持下去，并尽我们的人力财力对其持续做迭代备份，也在可能的未来继续收集更多边缘人类的体验，将它们以更加全面流畅的数据上传云端",
                          textAlign: TextAlign.end,
                          style: textstyle1
                        ),
                        SizedBox(height: 20.h,),

                        Text("当自16世纪开始的人文主义思潮逐渐熹微，当人类经济不再需要人的参与，当人类终将发展到不需要肉身便可完成一生，希望这个数据库能成为地球田园时代最后的纪念品——纪念那些人类用血肉之躯体验到的美好与挣扎。感谢您与我们同行，直到这些数据最终宿命的到来。",
                            textAlign: TextAlign.end,
                            style: textstyle1),
                        SizedBox(height: 20.h,),

                      ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  TextStyle textstyle =TextStyle(
      color: Colors.black,
      fontSize: 14.sp,
      fontFamily: "sfproreg"
  );
  TextStyle textstyle1 =TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontFamily: "sfproreg"
  );

}
