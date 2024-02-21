import 'dart:convert';

import 'package:chet/Modal/FirstideaModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/15.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/custcont.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class Fourteenth extends StatefulWidget {
  const Fourteenth({super.key});

  @override
  State<Fourteenth> createState() => _FourteenthState();
}

int selected = 3;

class _FourteenthState extends State<Fourteenth> {
  bool isLoading = false;
  TextEditingController _name =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return commanScreen(
        isLoading: isLoading,
        scaffold: Scaffold(
      bottomNavigationBar: Bottomnavbar(),
      body: (isLoading)?Container():SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //circle indicator
            CustCointainer(val: 0.2),
            SizedBox(height: 20.h,),
            // text field
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 110.w,
                  decoration: BoxDecoration(
                    color: Color(0xffbBF1B1B),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    '体验名称*',
                    style: TextStyle(color: Colors.white, fontSize: 17.sp,fontWeight: FontWeight.bold,fontFamily: "simsan"),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                    width: 225.w,
                    height: 40.h,

                    child: TextFormField(
                      controller:_name ,
                      maxLines: 2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: '不超过30个中文字',

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
            SizedBox(height: 80.h,),
            // button
            InkWell(
              onTap: (){
                    // Get.to(Fifteenth());
              idealfirst();

              },
              child: Container(
                height: 50.h,
                width: 120.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffbBF1B1B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '下一步',
                  style: TextStyle(color: Colors.white, fontSize: 17.sp),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
        )
    );
  }
  //api integration

  idealfirst()async{
    final Map<String, String> data = {};
    data["idea_title"]= _name.text;
    data["user_id"] = (userdata?.userData?.id).toString();
    print(data);
    if(_name.text.length < 30 ){
      checkInternet().then((internet) async {
        if (internet) {
          ideaprovider().idealfirst(data).then(( response) async {
            FirstideaModal   firstideamodal = FirstideaModal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && firstideamodal.status == "success") {
              Get.to(Fifteenth(id:(firstideamodal?.data?.ideaId).toString(),name:_name.text.toString()));
              _name.text ="";
              setState(() {

                isLoading = false;
              });
            } else {setState(() {
              isLoading = false;
            });
              buildErrorDialog2(context, "AI检测到以下体验点子和您的 \n 想法相近：", "在公园吹泡泡 \n 在公园没人的地方吹泡泡\n 吹泡泡在没人的地方 \n\n请更换地名、物体名称、\n修饰语等再试试吧", () {Get.back(); }, "返回编辑", () { Get.back();}, "放弃", Colors.black, Color(0xffb14559E));
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
    else{
      buildErrorDialog2(context, "体验名称超过30个汉字", "", () {Get.back();}, "返回编辑", () {Get.back(); }, "取消", Colors.black, Color(0xffb14559E));
    }

  }
}
