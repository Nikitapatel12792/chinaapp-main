
import 'package:chet/payment.dart';
import 'package:chet/provider/authprovider.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/1.dart';
import 'package:chet/screens/NotificationScreen.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


import 'screens/ChatListing.dart';

void main() {
  configLoading();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => authprovider()),
              ChangeNotifierProvider(create: (context) => ideaprovider()),
            ],
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: First(),
              builder: EasyLoading.init(),
            ),
          );
        });
  }

}
