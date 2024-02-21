import 'dart:convert';

import 'package:chet/Modal/EventSteptreeModal%20(1).dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/4.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/custcont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../widgets/dropdown.dart';



class Eighteenth extends StatefulWidget {
  String? event;
  String? name;
   Eighteenth({super.key,this.event,this.name});

  @override
  State<Eighteenth> createState() => _EighteenthState();
}

class _EighteenthState extends State<Eighteenth> {
  final List<String> item = [
    '100',
    '50',
    '200',
    '450',
    '231',
    '10',
    '10',
    '50',
  ];
  int selected = 3;
  String? selitem;
  String? select;
  TextEditingController _price =TextEditingController();
  String? grp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustCointainer(val: 1),
            SizedBox(height: 10.h,),
            Center(
              child: Text(
                widget.name.toString(),
                style: TextStyle(color: Color(0xffbBE1313), fontWeight: FontWeight.bold,fontFamily: "simsan",fontSize: 15.sp),
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: 30.h,
                  width: 110.w,
                  padding: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                    color: Color(0xffbBF1B1B),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    '每人体验费用',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp,fontFamily: "simsan",fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                SizedBox(width: 200.w,
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 220.w,
                          height: 35.h,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _price,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              hintText: '请输入0 - 100 的数字',
                              hintStyle: TextStyle(color: Color(0xffb8A8A8A),fontFamily: "simsan",fontSize: 14.sp),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        '*单位为人民币。若为免费体验请输入 0。让我们共同努力让体验成为一项人民基本权利！若单次体验成本过高可以考虑删减体验内容，仅保留精华部分即可。体验费用越低报名人数越多哦！',
                        style: TextStyle(color: Color(0xffb8A8A8A),fontFamily: "simsan",fontSize: 14.sp),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: 30.h,
                  width: 110.w,
                  padding: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                    color: Color(0xffbBF1B1B),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    '限定席位',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp,fontFamily: "simsan",fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                SizedBox(width: 200.w,
                  child: Container(
                      alignment: Alignment.center,
                      width: 220.w,
                      height: 35.h,
                      child:  CustomDropdownButton2(
                        hint: '选择体验时长',
                        dropdownItems: item,
                        value: selitem,
                        onChanged: (value) {
                          setState(() {
                            selitem = value;
                          });
                        },
                      ),),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: 30.h,
                  width: 110.w,
                  padding: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                    color: Color(0xffbBF1B1B),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    '收款途径',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp,fontFamily: "simsan",fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                SizedBox(width: 200.w,
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height:70.h,
                            alignment: Alignment.center,
                            child: Radio(
                              value: "10",
                              groupValue: grp,
                              activeColor: Colors.blue,
                              toggleable: true,
                              onChanged: (val) {

                                setState(() {
                                  if (grp == val) {
                                    print(val);
                                    grp = null; // Uncheck the radio button
                                  } else {
                                    grp = val;
                                  }
                                });
                              },
                            ),
                          ),
                          Image.asset("assets/gpay.jpg",width: 90.w,height: 70.h,fit: BoxFit.cover,)

                        ],
                      ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      Text(
                        '*平台不收取任何费用。用户报名转账会先由平台保管，在每月最后一天完成全部转账，并通过站内消息通知。',
                        style: TextStyle(color: Color(0xffb8A8A8A),fontFamily: "simsan",fontSize: 14.sp),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: (){
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
                      style: TextStyle(color: Colors.white, fontSize: 17.sp,fontFamily: "simsan"),
                    ),
                  ),
                ),
                SizedBox(width: 30.w,),
                InkWell(
                  onTap: (){
                    evtree();
                    // Get.to(Nineteen());
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
                      '完成创建',
                      style: TextStyle(color: Colors.white, fontSize: 17.sp,fontFamily: "simsan"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
  evtree(){
    print(widget.event.toString());
    final Map<String, String> data = {};
    data['event_id'] =widget.event.toString();
    data['event_ticket_price'] =_price.text;
    data['no_of_seats'] =selitem.toString();
    print(_price);
    print(selitem);

    print(data);
    if(_price.text== "" || selitem  == null  ){
      print("jnjnjm");
      buildErrorDialog(context, "", "请选择票价及座位数");
    }

    else{
      checkInternet().then((internet) async {
        if (internet) {
          ideaprovider().eventtreeapi(data).then((response) async {
            eventsteptreemodal = EventSteptreeModal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 &&
                eventsteptreemodal?.status == "success") {
              buildErrorDialog2(context, "恭喜您创建新的体验点子成功！", "稍等片刻整个嘛呢社群就能搜索 到您创建的体验了！", () { Get.to(Four());}, "去看看", () { Get.back();}, "返回", Colors.black, Color(0xffb14559E));
              // Get.to(Four());
              setState(() {

              });
            }
            else {}
          });
        } else {
          setState(() {

          });
          buildErrorDialog(context, '错误', "需要互联网");
        }
      });
    }
  }

}

