
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


buildErrorDialog(BuildContext context,String title, String contant,
    {VoidCallback? callback, String? buttonname}) {
  Widget okButton = GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //     shape: BoxShape.rectangle,
      //     borderRadius: BorderRadius.circular(20.0),
      //     // color: Color(0xffb4776e6)
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(buttonname ?? '好的',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize: 17.sp,

                    color: Color(0xffb14559E),
                    decorationColor: Colors.black,
                    fontFamily: 'simsan')),
          ),
        ],
      ),
    ),
    onTap: () {
      // if (callback == null) {
      Navigator.of(context).pop();
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
            // height: 120.h,
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h,),
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
                SizedBox(height: 5.h),
             okButton,
                SizedBox(height: 5.h,),
              ],
            ),
          ),
        );
      },
    );

  // show the dialog
}


buildErrorDialog1(BuildContext context,String title, String contant,VoidCallback callback1, String buttonname1,VoidCallback callback, String buttonname,Color color1,Color color2) {
  Widget okButton1= GestureDetector(
    child: Container(
      alignment: Alignment.center,
      // width: MediaQuery.of(context).size.width/2,
      child: Center(
        child: Text(buttonname,
            textAlign: TextAlign.center,
            style:  TextStyle(
                fontSize: 17.sp,

                color: Color(0xffb14559E),
                decorationColor: color1,
                fontFamily: 'simsan')),
      ),
    ),
    onTap:callback,
  );
  Widget okButton2= GestureDetector(
    child: Container(
      alignment: Alignment.center,
      // width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(buttonname1,
            textAlign: TextAlign.center,
            style:  TextStyle(
                fontSize: 17.sp,

                color: Color(0xffb14559E),
                decorationColor: color2,
                fontFamily: 'simsan')),
      ),
    ),
    onTap:callback1
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
          // height: 120.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal:3.w),
                child: Text(
                  contant,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decorationColor: Colors.black,
                      fontFamily: 'simsan'),
                ),
              ),
              SizedBox(height: 10.h),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  okButton1,
                  VerticalDivider(),
                  okButton2
                ],
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      );
    },
  );

  // show the dialog
}
buildErrorDialog2(BuildContext context,String title, String contant,VoidCallback callback1, String buttonname1,VoidCallback callback, String buttonname,Color color1,Color color2) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          width: 300.w,
          // height: 135.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.h),
              title != "" ?Column(children: [
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
                SizedBox(height: 30.h),
              ],) :Container(),
              (contant != "")?
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:3.w),
                    child: Text(
                      contant,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          decorationColor: Colors.black,
                          fontFamily: 'simsan'),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ):Container(),



              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      child: Container(

                        width:150.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(right: BorderSide(color: Color(0xffbDFDEDE)),top:BorderSide(color: Color(0xffbDFDEDE)) )
                        ),
                        child: Center(
                          child: Text(buttonname,
                              textAlign: TextAlign.center,
                              style:  TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                  fontFamily: 'simsan')),
                        ),
                      ),
                      onTap:callback
                  ),
                  GestureDetector(
                      child: Container(

                        width:150.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(left: BorderSide(color: Color(0xffbDFDEDE)),top:BorderSide(color: Color(0xffbDFDEDE)) )
                        ),
                        child: Center(
                          child: Text(buttonname1,
                              textAlign: TextAlign.center,
                              style:  TextStyle(
                                  fontSize: 17.sp,

                                  color: Color(0xffb14559E),

                                  fontFamily: 'simsan')),
                        ),
                      ),
                      onTap:callback1
                  )
                ],
              ),

            ],
          ),
        ),
      );
    },
  );// show the dialog
}