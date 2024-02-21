

import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:chet/widgets/Dropdown2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustCointainer extends StatelessWidget {
  double? val;
   CustCointainer({super.key,required this.val});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(00, 8),
                blurRadius: 30,
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Image.asset(
                  'assets/img12.png',
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 130.h,
                  left: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '创建新的体验点子',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "simsan"
                        ),
                      ),
                      SizedBox(
                        height: 17.sp,
                      ),
                      Text(
                        '创建你的体验,获得现金收益,0平台抽成 \n*大概1分20秒完成创建',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                            fontFamily: "simsan"
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(height: 30.h),
        SizedBox(
          height: 40.h,
          width: 45.w,
          child: CircularCappedProgressIndicator(
              strokeCap: StrokeCap.round,
              value: this.val,
              color: Colors.red.shade700,
              backgroundColor: Colors.black12,
              strokeWidth: 6.sp),
        ),
      ],
    );
  }
}
class customtext extends StatelessWidget {
  String? selitem;
  List<String> item;
   ValueChanged<String?>? change;
   String? hint;
   String? title;
   String? contant;
   customtext({Key? key,this.selitem,required this.item,this.change,this.hint,this.title,this.contant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          alignment: Alignment.centerRight,
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
            title ?? "",
            style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold,fontFamily: "simsan"),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        SizedBox(
          width: 200.w,
          height: 40.h,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Drpdown(
                hint: hint ?? "",
                value: selitem,
                dropdownItems: item,
                onChanged: change,
              ),
            ],
          ),
        )
      ],
    );
  }
}
