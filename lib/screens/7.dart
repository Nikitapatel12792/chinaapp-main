import 'dart:convert';

import 'package:chet/Modal/Experincemodal.dart';
import 'package:chet/Modal/FilterideaModal.dart';
import 'package:chet/Modal/collectionModal.dart';
import 'package:chet/screens/10.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../provider/ideaprovider.dart';
import '../widgets/botamnavbar.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';
import '8.dart';

class Seventh extends StatefulWidget {
  String? city;
  String? weather;
  String? fees;
  String? lenght;
  String? cate;

  Seventh(
      {super.key, this.weather, this.cate, this.city, this.fees, this.lenght});

  @override
  State<Seventh> createState() => _SeventhState();
}

List text = [
  '格耳机音星调小倫听旁人谈话',
  '尝试坐公交从头到尾不扶扶手',
  '花时间认真给一颗草莓去籽',
  '将一张A4纸剪成连续不断的直线',
  '明天早上和邻层主动说声早安',
  '换一条回家路线',
  '去雍和宫踩落叶',
  '和公司同事/学校同学穿同样的T恤',
  '抱着路边—颗树和它倾诉衷肠',
  '尝试打响指直到出声',
  '在上班路上拍摄所有你能看到的政冶悬窗标',
  '其他…',
];
List sel = [
  false,
  true,
  false,
  false,
  false,
  true,
  true,
  true,
  false,
  false,
  false,
  false,
];
List heart = [
  false,
  false,
  true,
  false,
  false,
  false,
  false,
  true,
  true,
  true,
  true,
  false,
];
int selected = 2;
int? col;
int? exp;
bool isLoading = true;

class _SeventhState extends State<Seventh> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            : Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/img6.png', fit: BoxFit.cover),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.h,
                            width: 355.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Colors.white.withOpacity(0.7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black54,
                                    )),
                                Text(
                                  '犗索结果',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                SizedBox(
                                  width: 27.w,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 568.h,
                        child: filter?.data?.length == 0 ||
                                filter?.data?.length == null
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                height: 568.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  '无可用数据',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22.sp,
                                      fontFamily: "simsan"),
                                )))
                            : ListView.builder(
                                padding: EdgeInsets.only(top: 5.h),
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2.h),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        alignment: Alignment.center,
                                        color: Colors.white.withOpacity(0.7),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 2.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap:(){
                                                Get.to(Tenth(
                                                  id: filter
                                                      ?.data?[index].ideaId,
                                                ));
                                              },
                                              child: SizedBox(
                                                width: 250.w,
                                                child: Text(
                                                  filter?.data?[index]
                                                          .ideaTitle ??
                                                      '',
                                                  maxLines: 2,
                                                  style:
                                                      TextStyle(fontSize: 16.sp),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      exp = index;
                                                    });
                                                    experincebuttonap(filter
                                                        ?.data?[index]
                                                        .ideaId ??
                                                        '');

                                                  },
                                                  icon: filter?.data?[index]
                                                              .experienced ==
                                                          1
                                                      ? Icon(
                                                          Icons.check_circle,
                                                          size: 26.sp,
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .check_circle_outline_rounded,
                                                          size: 26.sp,
                                                        ),
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      col = index;
                                                    });
                                                    collectedbuttonap(filter
                                                        ?.data?[index]
                                                        .ideaId ??
                                                        '');
                                                  },
                                                  icon: filter?.data?[index]
                                                              .collected ==
                                                          1
                                                      ? Icon(
                                                          Icons
                                                              .favorite_rounded,
                                                          size: 26.sp,
                                                          color: Color(0xffbD52525),
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .favorite_border_rounded,
                                                          size: 26.sp),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                itemCount: filter?.data?.length,
                              ),
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  DispideaAp() {
    final Map<String, String> data = {};

    data["city[]"] = widget.city.toString();
    data["experience_weather[]"] = widget.weather.toString();
    data["experience_fees[]"] = widget.fees.toString();
    data["experience_length[]"] = widget.lenght.toString();
    data["experience_category[]"] = widget.cate.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().Filteridiaap(data).then((response) async {
          filter = FilterIdeaModal.fromJson(json.decode(response.body));
          print('Display data status : ' + ' ${display?.status}');
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

  experincebuttonap(String? value) {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['idea_id'] = value.toString();
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().experincebuttonapi(data).then((response) async {
          experincemodal = ExperinceModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              experincemodal?.status == "success") {
            DispideaAp();
            filter?.data?[exp!].experienced == 0 ?
            buildErrorDialog(context, "经验", "你已经体验过这个想法"):buildErrorDialog(context, "经验", "你已经消除了这个想法");

            // Get.off(Four());
            // setState(() {
            //   isLoading = false;
            // });
          } else {
            // setState(() {
            //   isLoading = false;
            // });
          }
        });
      } else {
        // setState(() {
        //   isLoading = false;
        // });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }

  collectedbuttonap(String? value) {
    final Map<String, String> data = {};
    data['user_id'] = userdata?.userData?.id ?? '';
    data['idea_id'] = value.toString();

    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().collectionbuttonapi(data).then((response) async {
          collectionmodal =
              CollectionModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              collectionmodal?.status == "success") {
            filter?.data?[col!].collected == 0 ?
            buildErrorDialog(context, "收藏", "这个想法已添加到您的收藏中"):buildErrorDialog(context, "收藏", "此创意已从您的收藏中删除");
            DispideaAp();
            // setState(() {
            //   isLoading = false;
            // });
          } else {
            // setState(() {
            //   isLoading = false;
            // });
          }
        });
      } else {
        // setState(() {
        //   isLoading = false;
        // });
        buildErrorDialog(context, '错误', "需要互联网");
      }
    });
  }
}
