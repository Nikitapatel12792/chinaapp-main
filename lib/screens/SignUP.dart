import 'dart:convert';
import 'package:chet/Modal/signupmodal%20(1).dart';
import 'package:chet/Modal/usermodal.dart';
import 'package:chet/provider/authprovider.dart';
import 'package:chet/screens/4.dart';
import 'package:chet/screens/login.dart';
import 'package:chet/screens/profilePage.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/sharedpreferance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirmpass = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _user = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int type=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          // background image
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage('assets/loginpage.jpg'), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Container(
                // background image
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              Container(
                // background image
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70.sp,
                      ),
                      // first image above back ground

                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon(Icons.login,color: Colors.white,size: 26.sp,),
                                SizedBox(
                                  width: 10.w,
                                ),
                                //text Sign up
                                Text(
                                  '注册账号',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.w,
                            ),
                            // for user name
                            // Container(
                            //   margin: EdgeInsets.symmetric(horizontal: 50.w),
                            //   decoration: BoxDecoration(),
                            //   child: TextFormField(
                            //     controller: _user,
                            //     validator: (value) {
                            //       if (value!.isEmpty) {
                            //         return "输入用户名";
                            //
                            //       }
                            //       return null;
                            //     },
                            //     // style: TextStyle(fontSize: 20.0, color: Colors.black54),
                            //     decoration: InputDecoration(
                            //         contentPadding: EdgeInsets.all(9.0),
                            //
                            //         hintText: "用户名",
                            //         hintStyle: TextStyle(color: Colors.black54),
                            //         focusedBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(color: Colors.white),
                            //           borderRadius: BorderRadius.circular(10.0),
                            //         ),
                            //         enabledBorder: UnderlineInputBorder(
                            //           borderSide: BorderSide(color: Colors.white),
                            //           borderRadius: BorderRadius.circular(10.0),
                            //         ),
                            //         errorBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(color: Colors.red),
                            //           borderRadius: BorderRadius.circular(10.0),
                            //         ),
                            //         filled: true,
                            //         fillColor: Colors.white),
                            //   ),
                            // ),
                            // //for email
                            // SizedBox(
                            //   height: 15.w,
                            // ),
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

                                    hintText: "电子邮件",
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
                            SizedBox(
                              height: 15.w,
                            ),
                            //for phone number
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 50.w),
                                decoration: BoxDecoration(),
                                child: IntlPhoneField(
                                  controller: _phone,
                                  disableLengthCheck: true,
                                  showDropdownIcon: false,
                                  showCountryFlag: false,
                                  validator: (value) {
                                    print(value);
                                    if (value!.number.isEmpty){
                                      return "输入电话号码";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(9.0),
                                      hintText: "电话号码",
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
                                )),
                            SizedBox(
                              height: 15.w,
                            ),
                            //for password
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 50.w),
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "输入密码";

                                  }
                                  return null;
                                },
                                controller: _pass,
                                expands: false,
                                // style: TextStyle(fontSize: 20.0, color: Colors.black54),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(9.0),

                                    hintText: "密码",
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
                            SizedBox(
                              height: 15.w,
                            ),
                            // for confirm password
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 50.w),
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "输入密码";

                                  }
                                  return null;
                                },
                                obscureText: true,
                                controller: _confirmpass,
                                expands: false,
                                // style: TextStyle(fontSize: 20.0, color: Colors.black54),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(9.0),

                                    hintText: "确认密码",
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
                            // signup button
                            SizedBox(
                              height: 25.w,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    type=1;
                                  });
                                  Signupap();
                                },
                                child: Container(
                                  height: 33.h,
                                  width: 170.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.black.withOpacity(0.55)),
                                  child: Text(
                                    '注册',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 75.w),
                              child: Divider(color: Colors.black,thickness: 1.5),
                            ),
                            SizedBox(height: 10.h,),
                            GestureDetector(
                                onTap: () {},
                                child: Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                                    width: 250.w,
                                    decoration: BoxDecoration(
                                      color: Color(0xcb2c8f32),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/logo/wl.png",
                                            height: 40.h, width: 80.h),
                                      ],
                                    ))),
                            SizedBox(
                              height: 10.h,
                            ),
                            GestureDetector(
                                onTap:()async{
                                  GoogleSignIn _googleSignIn = GoogleSignIn();
                                  print(_googleSignIn.clientId);
                                  try{
                                    var result=await _googleSignIn.signIn();
                                    print(result?.displayName.toString());
                                    print(result?.serverAuthCode.toString());
                                    print(result?.id.toString());
                                    _user.text = result?.displayName ?? "";
                                    _email.text =result?.email ?? "";
                                    setState(() {
                                      type=2;
                                    });
                                    Signupap();
                                  }
                                  catch(error){
                                    print(error);
                                  }
                                },
                                child: Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                                    width: 250.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/logo/ggl.png",
                                            height: 40.h, width: 50.h),
                                      ],
                                    ))),
                            SizedBox(
                              height: 10.h,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                                    width: 250.w,
                                    decoration: BoxDecoration(
                                      color: Color(0xe03f6dae),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/logo/fbl.png",
                                            height: 35.h, width: 50.h),
                                      ],
                                    ))),
                            // already account
                            Padding(
                              padding: EdgeInsets.all(15.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text(
                                  //   "已有账户？",
                                  //   style: TextStyle(
                                  //       color: Colors.black,
                                  //       fontWeight: FontWeight.normal,
                                  //       fontSize: 20.sp),
                                  // ),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(login());
                                    },
                                    child: Text(
                                      "返回",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  InputDecoration inputDecoration({
    required Icon icon1,
    required String hint,
  }) {
    return InputDecoration(
        contentPadding: EdgeInsets.all(9.0),
        prefixIcon: Padding(
          padding: EdgeInsets.all(9.0),
          child: icon1,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black54),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(32.0),
        ),
        filled: true,
        fillColor: Colors.white);
  }
  Signupap(){
    if(type==1){
      print("123456");
      if (_formKey.currentState!.validate()) {
        final Map<String, String> data = {};
        data['name'] = _user.text.trim().toString();
        data['email'] = _email.text.trim().toString();
        data['phone_no'] = _phone.text.trim().toString();
        data['password'] = _pass.text.trim().toString();
        data['confirm_password'] = _confirmpass.text.trim().toString();
        data['login_type'] = type.toString();

        print(data);
        if(_pass.text == _confirmpass.text){
          checkInternet().then((internet) async {
            if (internet) {
              authprovider().signupapi(data).then(( response) async {
                userdata = UserModal.fromJson(json.decode(response.body));

                if (response.statusCode == 200 && userdata?.status == "success") {
                  Get.to(login());
                  print(userdata?.status);

                  print(userdata?.message);

                  setState(() {
                    // isLoading = false;
                  });
                } else {

                }
              });
            } else {
              setState(() {
                // isLoading = false;
              });
              buildErrorDialog(context, '错误', "需要互联网");
            }
          });
        }
        else{
          buildErrorDialog(context, '错误', "密码和确认密码必须相同.");
        }
      }
    }
    else{
      print("fsdfdsf");
      final Map<String, String> data = {};
      data['name'] = _user.text.trim().toString();
      data['email'] = _email.text.trim().toString();
      data['login_type'] = type.toString();

      print(data);

        checkInternet().then((internet) async {
          if (internet) {
            authprovider().signupapi(data).then(( response) async {
              userdata = UserModal.fromJson(json.decode(response.body));
              print(signupdata?.status);
              if (response.statusCode == 200 && userdata?.status == "success") {
                print(signupdata?.status);
                print(signupdata?.message);
                Get.to(profilePage());
                SaveDataLocal.saveLogInData(userdata!);

                setState(() {

                  // isLoading = false;
                });
              } else {
                buildErrorDialog(context, '错误', "您的帐户已全部注册");
              }
            });
          } else {
            setState(() {
              // isLoading = false;
            });
            buildErrorDialog(context, '错误', "需要内部人员");
          }
        });
      }
    }
  }

