import 'dart:convert';

import 'package:chet/Modal/usermodal.dart';

import 'package:chet/provider/authprovider.dart';
import 'package:chet/screens/4.dart';
import 'package:chet/screens/SignUP.dart';
import 'package:chet/screens/forgotpass.dart';
import 'package:chet/screens/profilePage.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/sharedpreferance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? type;
  Position? _currentPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdata();
  }

  // getdata()async{
  //   bool serviceEnabled = await determinePosition();
  //   getlocation() async {
  //     try {
  //       Position position = await Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.best)
  //           .timeout(const Duration(seconds: 5));
  //       setState(() {
  //
  //         _currentPosition = position;
  //       });
  //       return position;
  //     } catch (e) {
  //       return null;
  //     }
  //   }
  //
  //   // if (serviceEnabled) {
  //   //   Position? position = await getlocation();
  //   // }
  //   // else{
  //   //   buildErrorDialog(context, "", "Please enable your phone location");
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
      // back ground image
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
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 140.sp,
                  ),
                  // first image
                  // Container(
                  //   width: 200.w,
                  //   height:200.h,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: NetworkImage(
                  //               "https://cdn-icons-png.flaticon.com/512/6688/6688863.png"),fit: BoxFit.cover
                  //       )
                  //   ),
                  // ),
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
                            Text(
                              '登录',
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
                        SizedBox(
                          height: 15.w,
                        ),
                        //for password
                        Container(
                          // height: 50.h,
                          // width: 250.w,
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
                                hintText: '密码',
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
                        // forgot password
                        GestureDetector(
                          onTap: () {
                            Get.to(Forgetpass());
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 52.w),
                            alignment: Alignment.topRight,
                            child: Text(
                              "忘记密码 ?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        // login button

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                type = 1;
                              });
                              loginap();
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

                        //
                        // Padding(
                        //   padding:  EdgeInsets.all(15.w),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text("没有帐号？",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 20.sp),),
                        //       TextButton(
                        //         onPressed: (){
                        //           Get.to(Signup());
                        //         },
                        //         child:   Text("报名",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.sp),),)
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(height: 10.h,),
                        // Row(
                        //   children: [
                        //     Divider(),
                        //     Text("OR"),
                        //     Divider(),
                        //   ],
                        // ),
                        SizedBox(
                          height: 30.h,
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 75.w),
                          child: Divider(color: Colors.black, thickness: 1.5),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),
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
                            onTap: () async {
                              GoogleSignIn _googleSignIn = GoogleSignIn();
                              print("ahhdjhsjdhsdj");
                              print(_googleSignIn.serverClientId);
                              print(_googleSignIn.clientId);

                              try {
                                var result = await _googleSignIn.signIn();
                                // print(result?.displayName.toString());
                                // print(result?.serverAuthCode.toString());
                                // print(result?.id.toString());
                                _email.text = result?.email ?? "";
                                setState(() {
                                  type = 2;
                                });
                                loginap();
                              } catch (error) {
                                print(error);
                              }

                              // final _googleSignin = GoogleSignIn();
                              // final user=_googleSignin.signIn();
                              // print("object");
                              // print(user);
                              // print(user.);
                              // if(user==null){
                              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Singn up faild")));
                              // }else{
                              //
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: (context) => Four()));
                              // }


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
                                  Get.to(Signup());
                                },
                                child: Text(
                                  "注册账号",
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  loginap() async {
    print(type);
    if (type == 1) {
      print(1);
      // Position position = await Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.best)
      //     .timeout(const Duration(seconds: 5));
      // setState(() {
      //   _currentPosition = position;
      // });
      // print(_currentPosition);
      if (_formKey.currentState!.validate()) {
        final Map<String, String> data = {};
        data['email'] = _email.text.trim().toString();
        data['password'] = _pass.text.trim().toString();
        data['latitude'] = "";
        data['longitude'] = "";
        data['login_type'] = type.toString();

        print(data);
        checkInternet().then((internet) async {
          if (internet) {
            authprovider().loginapi(data).then((response) async {
              userdata = UserModal.fromJson(json.decode(response.body));
              if (response.statusCode == 200 && userdata?.status == "success") {
                Get.to(profilePage());
                SaveDataLocal.saveLogInData(userdata!);
                setState(() {
                  // isLoading = false;
                });
              } else {
                buildErrorDialog(context, "错误", "邮箱或密码错误 ");
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
    } else {
      print(2);
      // Position position = await Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.best)
      //     .timeout(const Duration(seconds: 5));
      // setState(() {
      //   _currentPosition = position;
      // });
      // print(_currentPosition);

      final Map<String, String> data = {};
      data['email'] = _email.text.trim().toString();

      data['latitude'] = "";
      data['longitude'] = "";
      data['login_type'] = type.toString();
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().loginapi(data).then((response) async {
            userdata = UserModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && userdata?.status == "success") {
              Get.to(profilePage());
              SaveDataLocal.saveLogInData(userdata!);
              setState(() {
                // isLoading = false;
              });
            } else {
              buildErrorDialog(context, "错误", "邮箱或密码错误");
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
   GoogleSignInApi(){
   final _googleSignin = GoogleSignIn();

  Future<GoogleSignInAccount?> login()=>_googleSignin.signIn();
  }
}
