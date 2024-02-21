import 'dart:convert';

import 'package:chet/Modal/CityIdeaModal.dart';
import 'package:chet/Modal/DispApiModal.dart';
import 'package:chet/Modal/FilterideaModal.dart';
import 'package:chet/Modal/SearchModal.dart';
import 'package:chet/Modal/SerchfirstIdModal.dart';
import 'package:chet/Modal/catagarymodal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/10.dart';
import 'package:chet/screens/7.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/dropdown.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Sixth extends StatefulWidget {
  const Sixth({super.key});

  @override
  State<Sixth> createState() => _SixthState();
}

class test {
  String title;
  String id;

  test(this.title, this.id);
}

class _SixthState extends State<Sixth> {
  TextEditingController _search = TextEditingController();

  // final List<String> city = [
  //   '昌迪加尔',
  //   '苏拉特',
  //   '阿尔瓦尔',
  //   '比哈里甘吉',
  //   '阿姆罗利',
  //   '奥兰加巴德',
  // ];
  final List<String> weather = [
    '晴',
    '雨雪',
    '雷暴',
    '阴天',
    '随便',
  ];
  final List<String> fees = [
    '不到10元',
    '50元以内',
    '100元以内',
    '自由的',
  ];
  List<test> items = [];
  List<String> citys = [];

  final List<String> length = [
    '5分钟以下',
    '6-20分钟',
    '21-60分钟',
    '1小时以上',
    '随便',
  ];

  List<String> selectedItems = [];
  List<String> selweather = [];
  List<String> selfees = [];
  List<String> sellength = [];
  List<String> selcity = [];
  List<String> selectedIds = [];

  // String? selfees;
  // String? sellength;
  String? selcat;
  String? weath;
  String? fes;
  String? len;
  String? city;
  String? itemid;
  String? iid;
  bool? sea = false;
  bool isLoading = true;

  // List<String> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryapi();
    cityview();
    DispideaAp();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        bottomNavigationBar: Bottomnavbar(sel: 0),
        body: isLoading
            ? Container()
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/img6.png',
                      ),
                      fit: BoxFit.cover),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        alignment: Alignment.center,
                        height: 40.h,
                        // width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: _search,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                sea = false;
                              });
                            } else {
                              setState(() {
                                sea = true;
                                searchap(value);
                              });
                            }
                          },
                          cursorHeight: 20,
                          decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                              ),
                              suffixIcon: Icon(
                                Icons.search,
                                size: 30.sp,
                                color: Colors.white,
                              ),
                              fillColor: Colors.white.withOpacity(0.70),
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15.w),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "simsan",
                                  fontSize: 17.sp),
                              hintText: '  探索你的第一次奇妙体验！'),
                        ),
                      ),
                      sea!
                          ? SizedBox(
                              height: 540.h,
                              child: (searchmodal?.status == "fail")
                                  ? Container(
                                      alignment: Alignment.center,
                                      color: Colors.white.withOpacity(0.7),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      height: 200.h,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                          child: Text(
                                        "没有找到结果",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )))
                                  : ListView.builder(
                                      padding: EdgeInsets.only(top: 10.h),
                                      itemCount: searchmodal?.data?.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(Tenth(
                                              id: searchmodal
                                                  ?.data?[index].ideaId,
                                            ));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 0.1.h),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                alignment: Alignment.center,
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 5.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 250.w,
                                                      child: Text(
                                                        searchmodal
                                                                ?.data?[index]
                                                                .ideaTitle ??
                                                            "",
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontSize: 16.sp),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        searchmodal
                                                                    ?.data?[
                                                                        index]
                                                                    .experienced ==
                                                                1
                                                            ? Icon(
                                                                Icons
                                                                    .check_circle,
                                                                size: 26.sp,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .check_circle_outline_rounded,
                                                                size: 26.sp,
                                                              ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        searchmodal
                                                                    ?.data?[
                                                                        index]
                                                                    .collected ==
                                                                1
                                                            ? Icon(
                                                                Icons
                                                                    .favorite_rounded,
                                                                size: 26.sp,
                                                                color:
                                                                    Colors.red,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .favorite_border_rounded,
                                                                size: 26.sp),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                            )
                          : Container(),
                      SizedBox(
                        height: 50.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          children: [
                            //city
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '城市',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontFamily: "simsan"),
                                ),
                                Container(
                                  // height: 40.h,
                                  width: 250.w,
                                  child: MultiSelectDialogField<String>(
                                    buttonText: Text(city == null || city == ''
                                        ? '选择城市'
                                        : city.toString()),
                                    dialogWidth: 250.w,
                                    dialogHeight: 250.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        color: Colors.white.withOpacity(0.70)),
                                    chipDisplay: MultiSelectChipDisplay.none(),
                                    items: citys
                                        .map((item) =>
                                            MultiSelectItem<String>(item, item))
                                        .toList(),
                                    title: Text('选择城市'),
                                    buttonIcon: Icon(Icons.arrow_drop_down),
                                    onConfirm: (List<String> selectedItems1) {
                                      setState(() {
                                        selcity = selectedItems1;
                                        city = selcity.join(',');

                                        print(selcity);
                                        print(city);
                                      });
                                    },
                                  ),
                                ),
                                // CustomDropdownButton2(
                                //   hint: '选择城市',
                                //   dropdownItems: (cityideamodal?.cities) ?? [],
                                //   value: selcity,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       selcity = value;
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            //weather
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '天气',
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                                Container(
                                  // height: 40.h,
                                  width: 250.w,
                                  child: MultiSelectDialogField<String>(
                                    buttonText: Text(
                                        weath == null || weath == ''
                                            ? '选择天气'
                                            : weath.toString()),
                                    dialogWidth: 250.w,
                                    dialogHeight: 250.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        color: Colors.white.withOpacity(0.70)),
                                    chipDisplay: MultiSelectChipDisplay.none(),
                                    items: weather
                                        .map((item) =>
                                            MultiSelectItem<String>(item, item))
                                        .toList(),
                                    title: Text('选择天气'),
                                    buttonIcon: Icon(Icons.arrow_drop_down),
                                    onConfirm: (List<String> selectedItems1) {
                                      setState(() {
                                        selweather = selectedItems1;
                                        weath = selweather.join(',');

                                        print(selweather);
                                        print(weath);
                                      });
                                    },
                                  ),
                                ),
                                // CustomDropdownButton2(
                                //   hint: '选择天气',
                                //   dropdownItems: weather,
                                //   value: selweather,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       selweather = value;
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            // experience fee
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '体验费用',
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                                Container(
                                  // height: 40.h,
                                  width: 250.w,
                                  child: MultiSelectDialogField<String>(
                                    buttonText: Text(fes == null || fes == ''
                                        ? '选择体验费'
                                        : fes.toString()),
                                    dialogWidth: 250.w,
                                    dialogHeight: 250.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        color: Colors.white.withOpacity(0.70)),
                                    chipDisplay: MultiSelectChipDisplay.none(),
                                    items: fees
                                        .map((item) =>
                                            MultiSelectItem<String>(item, item))
                                        .toList(),
                                    title: Text('选择体验费'),
                                    buttonIcon: Icon(Icons.arrow_drop_down),
                                    onConfirm: (List<String> selectedItems1) {
                                      setState(() {
                                        selfees = selectedItems1;
                                        fes = selfees.join(',');

                                        print(selweather);
                                        print(fes);
                                      });
                                    },
                                  ),
                                ),
                                // CustomDropdownButton2(
                                //   hint: '选择体验费',
                                //   dropdownItems: fees,
                                //   value: selfees,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       selfees = value;
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            //experience length
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '体验时长',
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                                Container(
                                  // height: 40.h,
                                  width: 250.w,
                                  child: MultiSelectDialogField<String>(
                                    buttonText: Text(len == null || len == ''
                                        ? '选择体验时长'
                                        : len.toString()),
                                    dialogWidth: 250.w,
                                    dialogHeight: 250.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        color: Colors.white.withOpacity(0.70)),
                                    chipDisplay: MultiSelectChipDisplay.none(),
                                    items: length
                                        .map((item) =>
                                            MultiSelectItem<String>(item, item))
                                        .toList(),
                                    title: Text('选择体验时长'),
                                    buttonIcon: Icon(Icons.arrow_drop_down),
                                    onConfirm: (List<String> selectedItems1) {
                                      setState(() {
                                        sellength = selectedItems1;
                                        len = sellength.join(',');

                                        print(selweather);
                                        print(len);
                                      });
                                    },
                                  ),
                                ),
                                // CustomDropdownButton2(
                                //   hint: '选择体验时长',
                                //   dropdownItems: length,
                                //   value: sellength,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       sellength = value;
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            // experince catogory
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '体验分类',
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                                Container(
                                  // height: 40.h,
                                  width: 250.w,
                                  child: MultiSelectDialogField<String>(
                                    buttonText: Text(
                                        itemid == null || itemid == ''
                                            ? '选择'
                                            : itemid.toString()),
                                    dialogWidth: 250.w,
                                    dialogHeight: 250.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        color: Colors.white.withOpacity(0.70)),
                                    chipDisplay: MultiSelectChipDisplay.none(),
                                    items: items
                                        .map((item) => MultiSelectItem<String>(
                                            item.title, item.title))
                                        .toList(),
                                    title: Text('选择'),
                                    buttonIcon: Icon(Icons.arrow_drop_down),
                                    onConfirm: (List<String> selectedItems1) {
                                      setState(() {
                                        selectedItems = selectedItems1;
                                        print(selectedItems);
                                        selectedIds =
                                            selectedItems.map((title) {
                                          return items
                                              .firstWhere(
                                                  (item) => item.title == title)
                                              .id;
                                        }).toList();
                                        itemid = selectedItems.join(',');
                                        iid = selectedIds.join(',');
                                        print(iid);
                                      });
                                    },
                                  ),
                                ),

                                // CustomDropdownButton2(
                                //   hint: '选择体验类别',
                                //   dropdownItems: cate,
                                //   value: selcat,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       selcat = value;
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            InkWell(
                              onTap: () {
                                (city == null || city == '') &&
                                        (weath == null || weath == '') &&
                                        (fes == null || fes == '') &&
                                        (len == null || len == '') &&
                                        (iid == null || iid == '')
                                    ? buildErrorDialog(
                                        context, '字段错误', "所有字段必填")
                                    : Checkap();
                              },
                              child: Container(
                                height: 50.h,
                                width: 110.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffbD52525),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                child: Text(
                                  '开始探索',
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      fontSize: 18.sp,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '当前人类体验数据库点子数 :',
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  display?.data?.totalIdeas == 0 ||
                                          display?.data?.totalIdeas == null
                                      ? "0"
                                      : (display?.data?.totalIdeas).toString(),
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '我已体验的点子数 :',
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  (display?.data?.ideaExperiencedCount == 0 ||
                                          display?.data?.ideaExperiencedCount ==
                                              null)
                                      ? "0"
                                      : (display?.data?.ideaExperiencedCount)
                                          .toString(),
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '今天剩余浏览点子数 :',
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  (display?.data?.remainingNoOfIdeas == 0 ||
                                          display?.data?.remainingNoOfIdeas ==
                                              null)
                                      ? "0"
                                      : (display?.data?.remainingNoOfIdeas)
                                          .toString(),
                                  style: TextStyle(
                                      fontFamily: "simsan",
                                      color: Colors.white,
                                      fontSize: 17.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  buildErrorDialog6() {
    Widget okButton = GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text('好的',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Color(0xffb14559E),
                  decorationColor: Colors.black,
                  fontFamily: 'simsan')),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 300.w,
            height: 160.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "没有找到符合条件的结果",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decorationColor: Colors.black,
                        fontFamily: 'simsan'),
                  ),
                ),
                SizedBox(height: 25.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "重新搜索试试吧",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        decorationColor: Colors.black,
                        fontFamily: 'simsan'),
                  ),
                ),
                SizedBox(height: 20.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 10.h),
                okButton,
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        );
      },
    );
    // show the dialog
  }

  searchap(String? value) {
    final Map<String, String> data = {};

    data["search_keyword"] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().searchapi(data).then((response) async {
          searchmodal = SearchModal.fromJson(json.decode(response.body));
          print(searchmodal?.status);
          if (response.statusCode == 200 && searchmodal?.status == "success") {
          } else {}
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  DispideaAp() {
    final Map<String, String> data = {};

    data["login_user_id"] = userdata?.userData?.id ?? '';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().DispAp(data).then((response) async {
          display = DispApiModal.fromJson(json.decode(response.body));
          print(display?.status);
          if (response.statusCode == 200 && display?.status == "success") {
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

  serchidea() {
    print(selectedItems.length);
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? "";
    data["experience_weather"] =
        selweather == null ? "" : selweather.toString();
    data["experience_fees"] = selfees == null ? "" : selfees.toString();
    data["experience_length"] = sellength == null ? "" : sellength.toString();
    data["experience_category[]"] =
        selectedItems.length == 0 ? "" : selectedIds.toString();
    data["city"] = selcity == null ? "" : selcity.toString();

    print(data);

    if (selweather == null ||
        selfees == null ||
        sellength == null ||
        selectedItems == [] ||
        selcity == null) {
      print("jnjnjm");
      buildErrorDialog(context, "", "请选择天气或费用或体验时长或体验类别或城市");
    } else {
      checkInternet().then((internet) async {
        print("ram");
        if (internet) {
          ideaprovider().serchidapi(data).then((response) async {
            print(response.body);
            serchfirstidmodal =
                SerchfirstIdModal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 &&
                serchfirstidmodal?.status == "success") {
              print(serchfirstidmodal?.data?.totalExpericeIdea);
              setState(() {});
              setState(() {
                // isLoading = false;
              });
            } else {}
          });
        } else {
          setState(() {
            // isLoading = false;
          });
          buildErrorDialog(context, '错误', "需要互联网");
        }
      });
    }
  }

  categoryapi() {
    final Map<String, String> data = {};
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().categoryap(data).then((response) async {
          catagrymodal = CatgaryModal.fromJson(json.decode(response.body));
          print(serchfirstidmodal?.status);
          if (response.statusCode == 200 && catagrymodal?.status == "success") {
            for (int i = 0;
                i < int.parse((catagrymodal?.data?.length).toString());
                i++) {
              items.add(test((catagrymodal?.data?[i].categoryName).toString(),
                  ((catagrymodal?.data?[i].categoryId).toString())));
            }
            setState(() {
              items;
              // isLoading = false;
            });
          } else {}
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  cityview() {
    final Map<String, String> data = {};
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().cityapi(data).then((response) async {
          cityideamodal = CityIdeaModal.fromJson(json.decode(response.body));
          print(serchfirstidmodal?.status);
          if (response.statusCode == 200 &&
              cityideamodal?.status == "success") {
            print(cityideamodal?.cities?.length);

            // citys.add(((cityideamodal?.cities).toString()));
            citys = cityideamodal?.cities ?? [];
            setState(() {
              citys;
              print(citys);
              // isLoading = false;
            });
          } else {}
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  Checkap() {
    final Map<String, String> data = {};

    data["city[]"] = city == null || city == '' ? '' : city.toString();
    data["experience_weather[]"] =
        weath == null || weath == '' ? '' : weath.toString();
    data["experience_fees[]"] = fes == null || fes == '' ? '' : fes.toString();
    data["experience_length[]"] =
        len == null || len == '' ? '' : len.toString();
    data["experience_category[]"] =
        iid == null || iid == '' ? '' : iid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().Filteridiaap(data).then((response) async {
          filter = FilterIdeaModal.fromJson(json.decode(response.body));
          print('Display data status : ' + ' ${display?.status}');
          print('Display data status code : ' + ' ${response.statusCode}');
          if (response.statusCode == 200 && display?.status == "success") {
            filter?.data?.length == 0 || filter?.data?.length == null
                ? buildErrorDialog(context, '没有找到符合条件的结果', "重新搜索试试吧！")
                : Get.to(Seventh(
                    cate: iid == null || iid == '' ? '' : iid,
                    city: city == null || city == '' ? '' : city,
                    fees: fes == null || fes == '' ? '' : fes,
                    lenght: len == null || len == '' ? '' : len,
                    weather: weath == null || weath == '' ? '' : weath,
                  ));
            setState(() {
              isLoading = false;
            });
          } else {
            buildErrorDialog(context, '字段错误', "所有字段必填");
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
