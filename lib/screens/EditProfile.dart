import 'package:cached_network_image/cached_network_image.dart';
import 'package:chet/screens/10.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';



class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {

  TextEditingController _age = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _user = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          // background image
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg-img.png'), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Container(
                // background image
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.login,color: Colors.white,size: 26.sp,),
                          // SizedBox(width: 10.w,),
                          //text Sign up
                          Text('编辑个人资料',style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26.sp
                          ),),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // profile picture
                      Stack(
                        children: [
                          Container(
                            height: 140.h,
                            width: 140.h,
                            decoration: BoxDecoration(

                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            height: 120.w,
                            width: 120.w,
                            // padding: EdgeInsets.all(1.w),
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                "https://shayariholic.com/wp-content/uploads/2022/09/whatsapp-dp-86-983x1024.jpg",

                                progressIndicatorBuilder: (context, url, progress) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Image.asset(
                                  'assets/user.png',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70.h,
                              left: 80.h,
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.camera_alt),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            // for user name
                            Container(
                              margin: EdgeInsets.symmetric(horizontal:15.w),
                              decoration: BoxDecoration(
                              ),
                              child: TextFormField(
                                  controller: _user,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "输入用户名";
                                    }
                                    return null;
                                  },
                                  // style: TextStyle(fontSize: 20.0, color: Colors.black54),
                                  decoration: inputDecoration(icon1: Icon(
                                    Icons.person,
                                    color: Colors.black54,
                                  ),
                                       hint: "用户名", )
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            //for phone number
                            Container(
                                margin: EdgeInsets.symmetric(horizontal:15.w),
                                decoration: BoxDecoration(
                                ),
                                child: IntlPhoneField(
                                  controller: _phone,
                                  disableLengthCheck: true,
                                  showDropdownIcon: false,
                                  showCountryFlag: false,
                                  validator: (value){
                                    if(value!.number.isEmpty){
                                      return "输入电话号码";
                                    }
                                    return null;
                                  },
                                  decoration: inputDecoration(icon1: Icon(Icons.phone),  hint:"电话号码" ,
                                  ),
                                  initialCountryCode: 'CN',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                )

                            ),
                            SizedBox(
                              height: 15.h,
                            ),

                            // for age
                            Container(
                              margin: EdgeInsets.symmetric(horizontal:15.w),
                              decoration: BoxDecoration(

                              ),
                              child: TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "输入密码";
                                    }
                                    return null;
                                  },
                                  controller: _age,
                                  expands: false,
                                  // style: TextStyle(fontSize: 20.0, color: Colors.black54),
                                  decoration:inputDecoration(icon1: Icon(
                                    Icons.add,
                                    color: Colors.black54,
                                  ),
                                      hint: "密码",
                                      )
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            // Edit button
                            Container(
                              margin: EdgeInsets.symmetric(horizontal:15.w),
                              child: InkWell(
                                onTap: () {
                                  Get.to(Tenth());
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 120.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80),
                                      color: Colors.white.withOpacity(0.55)),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Icon(Icons.login,color: Colors.black,size: 16.sp,),
                                      // SizedBox(width: 5.w,),
                                      Text('编辑个人资料',style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // already account

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )

    );
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
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(32.0),
        ),
        filled: true,
        fillColor: Colors.white);
  }
}
