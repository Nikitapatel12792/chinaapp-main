import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chet/Modal/ChatListModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/25.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';



class ChatListPage extends StatefulWidget {
  String? user;
  ChatListPage({super.key,this.user});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}




class _ChatListPageState extends State<ChatListPage> {

  @override
  bool isloding=true;
  void initState() {
    // TODO: implement initState
    super.initState();
    chatlist();
  }
  var outputDate;
  @override
  Widget build(BuildContext context) {
    return
      commanScreen(
        isLoading:isloding,
        scaffold: Scaffold(
        bottomNavigationBar: Bottomnavbar(
          sel: 3,
        ),
          body:
          isloding?Container():
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                 Container(
                     color: Color(0xffb252323).withOpacity(0.72),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding:EdgeInsets.only(top: 5.h,bottom: 5.h),
                         child: Text(
                           "嘛呢",
                           style: TextStyle(
                               fontSize: 30,
                               fontWeight: FontWeight.bold,
                               color: Colors.grey,
                               fontFamily: "simsan"),
                         ),
                       ),
                     ],
                   ),
                 ),

                  chatlistmodal?.status == "fail"?Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child:Center(child: Text("关注一个用户开始聊天吧",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "simsan"))),
                  ) :Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.symmetric(horizontal: 3.w,vertical:1.h),

                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount:chatlistmodal?.messagesData?.length,

                        itemBuilder: (context, index) {
                          // if(chatlistmodal
                          //     ?.messagesData?[index].createdAt != ""){
                          //   DateTime parseDate = DateFormat(
                          //       "dd-MM-yyyy hh:mm:ss")
                          //       .parse(chatlistmodal
                          //       ?.messagesData?[index].createdAt ??
                          //       "");
                          //   var outputFormat2 = DateFormat('hh:mm');
                          //   outputDate = (parseDate == "")?"":outputFormat2
                          //       .format(parseDate);
                          // }
                          // else{
                          //   outputDate="";
                          // }
                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>Twentyfive(
                                  photo: chatlistmodal?.messagesData?[index].profilePicture??"",
                                  name: chatlistmodal?.messagesData?[index].username??"",
                                  from:chatlistmodal?.messagesData?[index].uid??"" ,
                                )),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.w,vertical:1.5.h),
                              child: Column(

                                children: [
                                  SizedBox(height: 10.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 50.w,
                                                width: 50.w,
                                              ),
                                              Container(
                                                width:40.w,
                                                height: 40.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                    colors: [Colors.blue, Colors.pink],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                ),
                                                child:ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(80),
                                                  child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl:(chatlistmodal?.messagesData?[index].profilePicture)
                                                          .toString(),
                                                      progressIndicatorBuilder: (context,
                                                          url, progress) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context, url,
                                                          error) =>
                                                          Icon(
                                                            Icons.person,
                                                            color: Colors.white.withOpacity(0.59),
                                                            size: 25.sp,
                                                          )
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 30.w,
                                                child: chatlistmodal?.messagesData?[index].messageCount==0?Container():Container(
                                                  alignment: Alignment.center,
                                                  height: 15.w,
                                                  width: 15.w,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.red
                                                  ),
                                                  child:Text((chatlistmodal
                                                      ?.messagesData?[index].messageCount).toString(), style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: Colors.white,
                                                      fontFamily: "simsan",
                                                      fontWeight: FontWeight.bold),) ,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(chatlistmodal?.messagesData?[index].username??"", style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontFamily: "simsan",
                                                  fontWeight: FontWeight.bold),),

                                              SizedBox(height: 5.h,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 150.w,
                                                    child: Text(chatlistmodal?.messagesData?[index].message==""?"没有留言":chatlistmodal?.messagesData?[index].type=="1"?(chatlistmodal?.messagesData?[index].message).toString(): chatlistmodal?.messagesData?[index].type=="2"?"图片":chatlistmodal?.messagesData?[index].type==3?"视频":chatlistmodal?.messagesData?[index].type=="4"?"声音的":chatlistmodal?.messagesData?[index].type=="5"?"文件":chatlistmodal?.messagesData?[index].type=="6"?"位置":"",style: TextStyle(
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 15.sp,
                                                        color: Colors.black38,
                                                        fontFamily: "simsan"),),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(chatlistmodal?.messagesData?[index].msgTime==""?"12.00 PM":chatlistmodal?.messagesData?[index].msgTime??"",style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12.sp,
                                            color: Colors.black38,
                                            fontFamily: "simsan"))),

                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    thickness: 0.40.sp,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),

                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            ),
          ),

        ),
      );
    

  }
  chatlist()
  {
    final Map<String, String> data = {};
    data['uid'] =userdata?.userData?.id ?? "";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().chatlistapi(data).then((response) async {
          chatlistmodal =
              ChatListModal.fromJson(json.decode(response.body));
          print(chatlistmodal?.status);
          print(chatlistmodal?.messagesData?.length);
          if (response.statusCode == 200 &&
              chatlistmodal?.status == "success") {
            print(chatlistmodal?.messagesData?.length);

            setState(() {
              isloding=false;
            });
          } else {
            setState(() {
              isloding=false;
            });
          }
        });
      } else {
        setState(() {
          isloding=false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
