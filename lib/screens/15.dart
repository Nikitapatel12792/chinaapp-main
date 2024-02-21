import 'dart:convert';

import 'package:chet/Modal/SecondideaModel.dart';
import 'package:chet/Modal/catagarymodal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/16%20.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/custcont.dart';
import 'package:chet/widgets/load.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';



class Fifteenth extends StatefulWidget {
  String? id;
  String? name;
   Fifteenth({super.key, this.id,this.name});

  @override
  State<Fifteenth> createState() => _FifteenthState();
}
class test{
  String title;
  String id;
  test(this.title,this.id);
}

class _FifteenthState extends State<Fifteenth> {

  List<test> items1 = [];
  final List<String> length = [
    '5分钟以下',
    '6-20分钟',
    '21-60分钟',
    '1小时以上',
    '随便',
  ];
  final List<String> weather = [
    '晴',
    '雨雪',
    '雷暴',
    '阴天',
    '随便',
  ];
  List<String> selectedItems = [];
  List<String> selectedIds = [];
  int selected = 3;
  String? selitem;
  String? selitem2;
  String? selitem3;
  String? selitem4;
  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String? address = "";
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryapi();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
        isLoading: isLoading,
        scaffold: Scaffold(
      bottomNavigationBar: Bottomnavbar(),
      body: isLoading?Container():SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // circle indicator
            CustCointainer(val:0.5),
            SizedBox(height: 10.h,),
            //experince length
            customtext(
              item:length,
                change: (value) {
              setState(() {
                selitem = value;
              });
            },
            hint: "选项 1",
            selitem: selitem,
            title: "推荐体验时长*",
            contant: ""
            ),
            Padding(
              padding:  EdgeInsets.only(left: 115.w),
              child: Text("*时间越短越容易被其他用户体验哦！",style: TextStyle(color: Color(0xffb8A8A8A),fontFamily: "simsan",fontSize: 14.sp),),
            ),
            SizedBox(height: 8.h,),
          // experince cate
          Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Text("体验类别**",
                  style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold,fontFamily: "simsan"),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Container(
                // height: 40.h,
                width: 200.w,
                child: MultiSelectDialogField<String>(
                  dialogWidth: 250.w,
                  dialogHeight: 250.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      color: Colors.white.withOpacity(0.70)
                  ),
                  chipDisplay: MultiSelectChipDisplay.none(),
                  items: items1
                      .map((item) => MultiSelectItem<String>(item.title, item.title))
                      .toList(),
                  title: Text('选择'),
                  buttonIcon: Icon(Icons.arrow_drop_down),

                  onConfirm: (List<String> selectedItems1) {
                    setState(() {
                      selectedItems = selectedItems1;
                      print(selectedItems.length);
                      if(selectedItems.length >3){
                        buildErrorDialog(context, "", "最多选择 3 个创意类别");
                      }
                      else{
                        selectedIds = selectedItems.map((title) {
                          return items1.firstWhere((item) => item.title == title).id;
                        }).toList();
                      }

                      print("length");
                      print(selectedIds.length);


                    });
                  },
                ),
              ),
            ],
          ),
            //second dropdown
            // customtext(
            //     item:item,
            //     change: (value) {
            //       setState(() {
            //         selitem2 = value;
            //       });
            //     },
            //     hint: "选项 1",
            //     selitem: selitem2,
            //     title: "体验类别**",
            //     contant: ""),
            Padding(
              padding:  EdgeInsets.only(left: 0.w),
              child: Text("*最多三个可选",style: TextStyle(color: Color(0xffb8A8A8A),fontFamily: "simsan",fontSize: 14.sp),),
            ),
            SizedBox(height: 8.h,),
     //exp weather
           customtext(
                item:weather,
                change: (value) {
                  setState(() {
                    selitem3 = value;
                  });
                },
                hint: "选项 1",
                selitem: selitem3,
                title: "推荐体验天气**",
                contant: ""),
            SizedBox(height: 8.h,),
            //fourth dropdown
            // customtext(
            //     item:item,
            //     change: (value) {
            //       setState(() {
            //         selitem4 = value;
            //       });
            //     },
            //     hint: "选项 1",
            //     selitem: selitem4,
            //     title: "所在国家城市**",
            //     contant: ""),
             Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
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
                "所在国家城市**",
                style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold,fontFamily: "simsan"),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            SizedBox(
              width: 200.w,
              height: 82.h,
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CSCPicker(
                    dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  color: Color(0xffb797979),
                ),
                color: Colors.white.withOpacity(0.70)
            ),
              countryDropdownLabel: "国家",
                    flagState: CountryFlag.DISABLE,
              stateDropdownLabel: "状态",
              cityDropdownLabel: "城市",
                    countrySearchPlaceholder: "国家",
                    stateSearchPlaceholder: "状态",
                    citySearchPlaceholder: "城市",
                    dropdownHeadingStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: "simsan",
                        fontWeight: FontWeight.bold),
                    showStates: true,
                    showCities: true,
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged:(value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged:(value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),

            SizedBox(height: 8.h,),
            Column(
              children: [
                Text('从下页开始都是远填哦',style: TextStyle(color: Colors.red.shade900),),
                SizedBox(height: 10.h,),
                //button
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(onTap: (){
                      Get.back();

                      // buildErrorDialog2(context, "有未填项哦，请返回查看", "", () { }, "返回编辑", () { }, "", Colors.black, Color(0xffb14559E));
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
                    InkWell(onTap: (){
                      // Get.to(Sixteenth(ideaid: "134",));
                      secondidea();
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
                          style: TextStyle(color: Colors.white, fontSize: 17.sp,fontFamily: "simsan"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 3.h,),
            SizedBox(height: 8.h,),

          ],
        ),
      ),
        ),
    );
  }
  secondidea()async{
    // List<Location> locations = await locationFromAddress(cityValue.toString());
    // Location location = locations.first;
    // setState(() {
    //   print(location.longitude);
    //   print(location.latitude);
    //   // latitude = location.latitude;
    //   // longitude = location.longitude;
    // });
print(selectedIds.length);
    final Map<String, String> data = {};
    data['idea_id'] =widget.id.toString();
    data['recommended_experience_length'] = selitem.toString();
    data['idea_category_id'] =selectedIds.toString();
    data['recommended_experience_weather'] = selitem3.toString();
    data['state'] =stateValue.toString();
    data['country'] = countryValue.toString();
    data['city'] = cityValue.toString();
    data['latitude'] = "";
    data['longitude'] = "";
    print(data);
      if(selitem== null || selitem3 == null || stateValue ==null || countryValue ==null|| cityValue == null||selectedIds.length==0){
        buildErrorDialog2(context, "有未填项哦，请返回查看", "", () { Get.back();}, "返回编辑", () {Get.back(); }, "退出",Colors.black, Color(0xffb14559E));
      }
      else{
        checkInternet().then((internet) async {
          if (internet) {
            ideaprovider().ideasecond(data).then(( response) async {
              secondideamodal = SecondIdea.fromJson(json.decode(response.body));

              if (response.statusCode == 200 && secondideamodal?.status == "success") {
                selitem = "";
                selitem2 = "";
                selitem3 = "";
                selitem4 = "";
                stateValue = "";
                cityValue = "" ;
                countryValue = "";
                Get.to(Sixteenth(ideaid: widget.id.toString(),name:widget.name));

              }
              else {
                // buildErrorDialog(context, "Error", "Email or Password wrong ");
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
  categoryapi(){
    final Map<String, String> data = {};
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().categoryap(data).then(( response) async {
          catagrymodal = CatgaryModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && catagrymodal?.status == "success") {
            for(int i=0;i< int.parse((catagrymodal?.data?.length).toString()) ;i++){
              items1.add(test((catagrymodal?.data?[i].categoryName).toString(), ((catagrymodal?.data?[i].categoryId).toString())));
            }
            setState(() {
              items1;
              isLoading = false;
            });
          }
          else {
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
