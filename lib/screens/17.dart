
import 'dart:convert';

import 'package:chet/Modal/CreteEventSteptwoModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/18.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/custcont.dart';
import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';



import '../widgets/Dropdown2.dart';

class Seventeenth extends StatefulWidget {
  String? eventid;
  String? name;
   Seventeenth({super.key,this.eventid,this.name});

  @override
  State<Seventeenth> createState() => _SeventeenthState();
}


int selected = 3;
String? selitem;
String? countryValue = "";
String? stateValue = "";
String? cityValue = "";
String? address = "";

class _SeventeenthState extends State<Seventeenth> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController1 = TextEditingController();
  TextEditingController timeController1 = TextEditingController();
  TextEditingController contryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController contryController1 = TextEditingController();
  final List<String> item = [
    '12',
    '24',
    '36',
    '48',
  ];
  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    timeController.text = "";
    dateController1.text = ""; //set the initial value of text field
    timeController1.text = ""; //set the initial value of text field
    contryController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustCointainer(val: 0.8),
            SizedBox(height: 10.h,),
            Center(
              child: Text(
                widget.name.toString(),
                style: TextStyle(color: Color(0xffbBE1313),
                    fontWeight: FontWeight.bold,
                    fontFamily: "simsan",
                    fontSize: 15.sp),
              ),
            ),
            SizedBox(height: 10.h,),
            SingleChildScrollView(
              child: Column(children: [
                //date start
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 5.w),
                      alignment: Alignment.centerRight,
                      height: 30.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        '体验开始时间',
                        style: TextStyle(color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "simsan"),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: 220.w,
                            height: 40.h,
                            child: TextField(
                              controller: dateController,
                              onTap: datepicker,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                suffixIcon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.grey,
                                ),
                                hintText: '不超过30个中文字',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 220.w,
                            height: 40.h,
                            child: TextField(
                              controller: timeController,
                              onTap: timepicker,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                suffixIcon: Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.grey,
                                ),
                                hintText: '不超过30个中文字',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.h,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      alignment: Alignment.centerRight,
                      height: 55.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        '体验截止报名时间',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "simsan"),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 220.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Drpdown(
                              hint: '同体验开始时间',
                              value: selitem,
                              dropdownItems: item,
                              onChanged: (value) {
                                setState(() {
                                  selitem = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            '*体验戒指报名时间到时将自动关闭窗口',
                            style: TextStyle(
                                color: Colors.black45, fontFamily: "simsan"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                //end date
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 5.w),
                      alignment: Alignment.centerRight,
                      height: 30.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        '体验结束时间',
                        style: TextStyle(color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "simsan"),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: 220.w,
                            height: 40.h,
                            child: TextField(
                              controller: dateController1,
                              onTap: datepicker1,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                suffixIcon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.grey,
                                ),
                                hintText: '国家/地区',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 220.w,
                            height: 40.h,
                            child: TextField(
                              controller: timeController1,
                              onTap: timepicker1,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                suffixIcon: Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.grey,
                                ),
                                hintText: '邮政编码',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 5.w),
                      alignment: Alignment.centerRight,
                      height: 30.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        '体验地点',
                        style: TextStyle(color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "simsan"),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 220.w,
                          height: 82.h,
                          child: CSCPicker(

                            disabledDropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(
                                  color: Color(0xffb797979),
                                ),
                                color: Colors.white.withOpacity(0.70)
                            ),
                            dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(
                                  color: Color(0xffb797979),
                                ),
                                color: Colors.white.withOpacity(0.70)
                            ),
                            countryDropdownLabel: "国家",
                            stateDropdownLabel: "状态",
                            cityDropdownLabel: "城市",
                            countrySearchPlaceholder: "国家",
                            stateSearchPlaceholder: "状态",
                            citySearchPlaceholder: "城市",
                            flagState: CountryFlag.DISABLE,
                            dropdownHeadingStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: "simsan",
                                fontWeight: FontWeight.bold),
                            showStates: true,
                            showCities: true,
                            onCountryChanged: (value) {
                              setState(() {
                                print(countryValue);
                                countryValue = value;
                              });
                            },
                            onStateChanged: (value) {
                              setState(() {
                                stateValue = value;
                              });
                            },
                            onCityChanged: (value) {
                              setState(() {
                                cityValue = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 220.w,
                            height: 40.h,
                            child: TextField(

                              controller: pincodeController,


                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                hintText: '邮政编码',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 220.w,
                            height: 65.h,
                            child: TextField(
                              maxLines: 3,
                              controller: contryController,


                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                hintText: '城市街道名（根据邮政编码自动补充）',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 220.w,
                            height: 65.h,
                            child: TextField(
                              maxLines: 3,
                              controller: contryController1,
                              decoration: InputDecoration(

                                hintText: '补充信息（具体见面地点、识别暗号等）',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(onTap: () {
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
                          style: TextStyle(color: Colors.white,
                              fontSize: 17.sp,
                              fontFamily: "simsan"),
                        ),
                      ),
                    ),
                    SizedBox(width: 30.w,),
                    InkWell(
                      onTap: () {
                        crtwoevent();
                        // Get.to(Eighteenth());
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
                          style: TextStyle(color: Colors.white,
                              fontSize: 17.sp,
                              fontFamily: "simsan"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,)
              ],),
            )
          ],
        ),
      ),
    );
  }

  void datepicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //get today's date
        firstDate: DateTime.now().subtract(Duration(days: 1)),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('dd-MM-yyyy').format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(
          formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        dateController.text =
            formattedDate;
        print(dateController.text);//set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  void datepicker1() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //get today's date
        firstDate: DateTime.now().subtract(Duration(days: 1)),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('dd-MM-yyyy').format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(
          formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        dateController1.text =
            formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  void timepicker() async {
    final picked = await showTimePicker(
      context: context,
      initialTime:  TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child??Container(),
        );
      },
    );

    if (picked != null) {
      setState(() {
        timeController.text = DateFormat.Hm().format(
          DateTime(2021, 1, 1, picked.hour, picked.minute),
        );
        // timeController.text = picked.toString();
        print(picked);
        // _selectedTime = picked;
      });
    }
    // final TimeOfDay? time =
    // await showTimePicker(context: context, initialTime: TimeOfDay.now());
    // if (time != null) {
    //   setState(() {
    //     timeController.text = time.format(context);
    //     print(timeController.text);
    //   });
    // }
  }

  void timepicker1() async {
    final picked = await showTimePicker(
      context: context,
      initialTime:  TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child??Container(),
        );
      },
    );

    if (picked != null && picked != TimeOfDay.now()) {
      setState(() {
        timeController1.text = DateFormat.Hm().format(
            DateTime(2021, 1, 1, picked.hour, picked.minute),);
        // timeController1.text = picked.toString();
        print(picked);
        // _selectedTime = picked;
      });
    }
    // final TimeOfDay? time = await showTimePicker(
    //   context: context,
    //   initialTime: TimeOfDay.now(),
    //
    //   builder: (context, child) {
    //     return MediaQuery(
    //       data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
    //       child: child ?? Container(),
    //     );
    //
    //   },
    //
    //
    // );
    // if (time != null) {
    //   setState(() {
    //     timeController1.text = time.format(context);
    //     print(timeController1.text);
    //   });
    // }
    // final TimeOfDay? time =
    // await showTimePicker(context: context, initialTime: TimeOfDay.now());
    //
    // if (time != null) {
    //   setState(() {
    //     timeController1.text = time.format(context);
    //
    //     print(timeController1.text);
    //   });
    // }
  }

  void contrypick() {
    showCountryPicker(
        context: context,
        countryListTheme: CountryListThemeData(

          backgroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
          bottomSheetHeight: 500,
          // Optional. Country list modal height
          //Optional. Sets the border radius for the bottomsheet.
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          //Optional. Styles the search field.
          inputDecoration: InputDecoration(
            labelText: '搜索',
            hintText: '开始输入搜索内容',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFF8C98A8).withOpacity(0.2),
              ),
            ),
          ),
        ),
        onSelect: (Country country) {
          print('Select country: ${country.displayName}');
          setState(() {
            contryController.text = country.name.toString();
            print(contryController.text);
          });
        });
  }
  crtwoevent() async {
    // List<Location> locations = await locationFromAddress(cityValue.toString());
    // Location location = locations.first;
    // setState(() {
    //   print(location.longitude);
    //   print(location.latitude);
    //   // latitude = location.latitude;
    //   // longitude = location.longitude;
    // });
    final Map<String, String> data = {};
      print(widget.eventid.toString());
    data['event_id'] = widget.eventid.toString();
    data['event_start_date'] = dateController.text;
    data['event_end_date'] = dateController1.text;
    data['event_start_time'] = timeController.text;
    data['event_end_time'] = timeController1.text;
    data['registration_end_time'] = selitem.toString();
    data['event_country'] = countryValue.toString();
    data['event_state'] = stateValue.toString();
    data['event_city'] = cityValue.toString();
    data['event_zipcode'] = pincodeController.text;
    data['latitude'] ="";
    data['longitude'] = "";
    data['event_location'] = contryController.text;


    print(data);
    if(dateController.text == '' || dateController1.text == '' || timeController.text  == '' || selitem  == "" || countryValue  =="" ||pincodeController.text==""){
      print("jnjnjm");
      buildErrorDialog(context, "", "请输入和时间、报名结束时间、活动国家");

    }
    else{
      checkInternet().then((internet) async {
        if (internet) {
          ideaprovider().eventtwoapi(data).then((response) async {
            creteeventsteptwomodal =
                CreteEventSteptwoModal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 &&
                creteeventsteptwomodal?.status == "success") {

              Get.to(Eighteenth(event:widget.eventid.toString(),name: widget.name.toString(),));
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