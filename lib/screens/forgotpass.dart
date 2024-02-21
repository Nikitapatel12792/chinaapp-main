import 'dart:convert';

import 'package:chet/Modal/ForgetPasswordModal.dart';
import 'package:chet/provider/authprovider.dart';
import 'package:chet/screens/login.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class Forgetpass extends StatefulWidget {
  const Forgetpass({Key? key}) : super(key: key);

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  TextEditingController  _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          // back ground image
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(

            image: DecorationImage(

                image: AssetImage('assets/loginpage.jpg'),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                // background image
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.3),
                ),

                child: Column(
                  children: [
                    SizedBox(
                      height: 250.h,
                    ),
                    // first image
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 15.w,),
                          // for email
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 50.w),
                            decoration: BoxDecoration(),
                            child: TextFormField(
                              controller: _email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "输入电子邮件";
                                }
                                return null;
                              },
                              // style: TextStyle(fontSize: 20.0, color: Colors.black54),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(9.0),
                                  hintText: '电子邮件',
                                  hintStyle: TextStyle(color: Colors.black54),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(height: 20.w,),
                          // login button
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            child: InkWell(
                              onTap: () {
                                forgotap();
                              },
                              child: Container(
                                height: 33.h,
                                width: 170.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black.withOpacity(0.55)),
                                child: Text(
                                  '登录',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )

    );
  }
  forgotap(){
    if (_formKey.currentState!.validate()) {

      final Map<String, String> data = {};

      data['forgotEmail'] = _email.text.trim().toString();

      checkInternet().then((internet) async {
        if (internet) {
          authprovider().forgotapi(data).then(( response) async {

            ForgetPasswordModal forget =ForgetPasswordModal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && forget?.status  == "success") {
              print(response.statusCode);

              buildErrorDialog1(context, "查看你的电子邮件", "");

              setState(() {

                // isLoading = false;
              });

            }
            else {
              buildErrorDialog(context, '错误', "电子邮件未注册");
            }
          });
        } else {
          // buildErrorDialog(context, '错误', "email is not registered");
          setState(() {

            // isLoading = false;
          });
          buildErrorDialog(context, '错误', "需要互联网");
        }
      });
    }
  }
  buildErrorDialog1(BuildContext context,String title, String contant,
      {VoidCallback? callback, String? buttonname}) {
    Widget okButton = GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //     shape: BoxShape.rectangle,
        //     borderRadius: BorderRadius.circular(20.0),
        //     // color: Color(0xffb4776e6)
        // ),
        child: Center(
          child: Text(buttonname ?? '好的',
              textAlign: TextAlign.center,
              style:  TextStyle(
                  fontSize: 17.sp,

                  color: Color(0xffb14559E),
                  decorationColor: Colors.black,
                  fontFamily: 'simsan')),
        ),
      ),
      onTap: () {
        // if (callback == null) {
       Get.to(login());
        // } else {

        // }
      },
    );


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 250.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0.h,),
                (title != "")?Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:3.w),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                            fontSize: 17.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.black,
                            fontFamily: 'simsan'),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ):Container(),

                Container(
                  padding: EdgeInsets.symmetric(horizontal:3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.black,
                            fontFamily: 'simsan'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 10.h),
                okButton,
                SizedBox(height: 10.h,),
              ],
            ),
          ),
        );
      },
    );

    // show the dialog
  }
}
