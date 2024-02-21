import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chet/Modal/ChatMessagesUserModal.dart';
import 'package:chet/Modal/SendMessageModal.dart';
import 'package:chet/Modal/StatusModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/CarrentLocationChatScreen.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:chet/widgets/load.dart';
import 'package:chet/widgets/video.dart';
import 'package:chet/widgets/webview.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

import '../widgets/audio.dart';

class Twentyfive extends StatefulWidget {
  String? name = "";
  String? photo = "";
  String? user;
  String? from = "";

  Twentyfive({super.key, this.name, this.photo, this.from, this.user});

  @override
  State<Twentyfive> createState() => _TwentyfiveState();
}

class _TwentyfiveState extends State<Twentyfive> {
  FlutterSoundRecorder? _soundRecorder;
  ScrollController _scrollController = ScrollController();
  TextEditingController _chat = TextEditingController();
  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;
  var photo = "";
  bool isloading = false;

  int? type;
  String? senderid;

  bool _isPlaying = false;

  final recorder = FlutterSoundRecorder();
  int? len;

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      print(PermissionStatus.granted);
      throw 'Permission not granted';
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future startRecord() async {
    await recorder.startRecorder(toFile: "music");
  }

  Future stopRecorder() async {
    final filePath = await recorder.stopRecorder();
    setState(() {
      type = 4;
      _pickedFile = File(filePath!);
    });
    measage();
    print('Recorded file path: $_pickedFile');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initRecorder();
    startApiCallLoop();
    // Listen to the stream updates and update the UI
    _notificationStreamController.stream.listen((data) {
      setState(() {
        chatmessagesusermodal = data;
      });
    });
    Future.doWhile(() {
      if (_scrollController.position.extentAfter == 0)
        return Future.value(false);
      return _scrollController
          .animateTo(_scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 100), curve: Curves.linear)
          .then((value) => true);
    });
    senderid = userdata?.userData?.id ?? "";
  }

  @override
  void dispose() {
    _soundRecorder?.closeRecorder();
    _notificationStreamController.close();
    super.dispose();
  }

  StreamController<ChatMessagesUserModal?> _notificationStreamController =
      StreamController<ChatMessagesUserModal?>.broadcast();

  void startApiCallLoop() async {
    while (true) {
      await Future.delayed(Duration(seconds: 10)); // Adjust the delay as needed
      measageuser();
    }
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Bottomnavbar(
          sel: 3,
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: AppBar(
            backgroundColor:Color(0xffb252323),
            leadingWidth: 150.w,
            titleSpacing: 0,
            leading: Padding(
              padding:EdgeInsets.only(left: 10.w,top: 5.h),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  SizedBox(width: 5.w,),
                  Container(
                    width:50.w,
                    height: 50.w,
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
                          imageUrl:widget.photo.toString(),
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
                  SizedBox(width: 5.w,),
                  Text(
                    widget.name.toString(),
                    style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          ),
        ),
        body: isLoading
            ? Container()
            : Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          // ClipRRect(
                          //   borderRadius: BorderRadius.only(
                          //       bottomLeft: Radius.circular(20),
                          //       bottomRight: Radius.circular(20)),
                          //   child: Container(
                          //     height: 300.h,
                          //     width: MediaQuery.of(context).size.width,
                          //     decoration: BoxDecoration(
                          //         image: DecorationImage(
                          //             image: AssetImage("assets/messageback.png")),
                          //         borderRadius: BorderRadius.only(
                          //             bottomLeft: Radius.circular(20),
                          //             bottomRight: Radius.circular(20))),
                          //     child: Container(
                          //       height: 300.h,
                          //       width: MediaQuery.of(context).size.width,
                          //       padding: EdgeInsets.all(35.w),
                          //       decoration: BoxDecoration(
                          //           color: Colors.black.withOpacity(0.5),
                          //           borderRadius: BorderRadius.only(
                          //               bottomLeft: Radius.circular(20),
                          //               bottomRight: Radius.circular(20))),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           SizedBox(
                          //             height: 130.h,
                          //           ),
                          //           Text(
                          //             "站内消息",
                          //             style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontSize: 14.sp,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontFamily: "simsan"),
                          //           ),
                          //           SizedBox(
                          //             height: 5.h,
                          //           ),
                          //           Text(
                          //             " ",
                          //             style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontSize: 14.sp,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontFamily: "simsan"),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          chatmessagesusermodal?.data?.length == 0
                              ? (Container(
                                  height: 300.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text("没有消息."),
                                  ),
                                ))
                              : Container(
                                  // height: 500.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(children: [
                                    for (int index = 0;
                                        index <
                                            (chatmessagesusermodal
                                                    ?.data?.length ??
                                                0);
                                        index++) ...[
                                      (senderid ==
                                              chatmessagesusermodal
                                                  ?.data?[index].fromUserId)
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  left: 150.w,
                                                  right: 3.w,
                                                  top: 0.h),
                                              child: Container(
                                                  width: 200.w,
                                                  margin: EdgeInsets.only(
                                                      left: 5.w,
                                                      top: 5.h,
                                                      bottom: 5.h,
                                                      right: 5.w),
                                                  padding: EdgeInsets.only(
                                                      left: 5.w,
                                                      top: 5.h,
                                                      bottom: 5.h,
                                                      right: 5.w),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffBE1313),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  child:
                                                      (chatmessagesusermodal
                                                                      ?.data?[
                                                                          index]
                                                                      .messageType)
                                                                  .toString() ==
                                                              "1"
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                      chatmessagesusermodal
                                                                              ?.data?[
                                                                                  index]
                                                                              .message ??
                                                                          "",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              12.sp)),
                                                                ),
                                                                Text(chatmessagesusermodal
                                                                        ?.data?[
                                                                            index]
                                                                        .time ??
                                                                    "")
                                                              ],
                                                            )
                                                          : (chatmessagesusermodal
                                                                          ?.data?[
                                                                              index]
                                                                          .messageType)
                                                                      .toString() ==
                                                                  "2"
                                                              ? Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {},
                                                                      child: Image
                                                                          .network(
                                                                        chatmessagesusermodal?.data?[index].message ??
                                                                            "",
                                                                        height:
                                                                            100.h,
                                                                        width:
                                                                            150.w,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomRight,
                                                                      child: Text(
                                                                          chatmessagesusermodal?.data?[index].time ??
                                                                              ""),
                                                                    )
                                                                  ],
                                                                )
                                                              : (chatmessagesusermodal
                                                                              ?.data?[index]
                                                                              .messageType)
                                                                          .toString() ==
                                                                      "3"
                                                                  ? Column(
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {},
                                                                          child:
                                                                              addVideo(videoid: chatmessagesusermodal?.data?[index].message ?? ""),
                                                                        ),
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.bottomRight,
                                                                          child:
                                                                              Text(chatmessagesusermodal?.data?[index].time ?? ""),
                                                                        )
                                                                      ],
                                                                    )
                                                                  : (chatmessagesusermodal?.data?[index].messageType).toString() == "4"
                                                                      ? Column(
                                                                          children: [
                                                                            HomePage(url: chatmessagesusermodal?.data?[index].message ?? ""),
                                                                            Align(
                                                                              alignment: Alignment.bottomRight,
                                                                              child: Text(chatmessagesusermodal?.data?[index].time ?? ""),
                                                                            )
                                                                          ],
                                                                        )
                                                                      : (chatmessagesusermodal?.data?[index].messageType).toString() == "5"
                                                                          ? Column(
                                                                              children: [
                                                                                GestureDetector(
                                                                                    onTap: () async {
                                                                                      final String? url = (chatmessagesusermodal?.data?[index].message);
                                                                                      String fileExtension = path.extension(url!);

                                                                                      if (fileExtension == ".txt") {
                                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                                            builder: (context) => webview(
                                                                                                  data: chatmessagesusermodal?.data?[index].message,
                                                                                                )));
                                                                                      } else {
                                                                                        var response = await http.get(Uri.parse((chatmessagesusermodal?.data?[index].message).toString()));
                                                                                        String fileName = url.toString().split('/').last;
                                                                                        Directory? storageDirectory = Platform.isAndroid ? await getExternalStorageDirectory() : await getDownloadsDirectory();
                                                                                        String directoryPath = storageDirectory!.path;
                                                                                        File file = File('$directoryPath/$fileName');
                                                                                        // Directory directory = await getApplicationDocumentsDirectory();
                                                                                        await file.writeAsBytes(response.bodyBytes);
                                                                                        String filePath = '${storageDirectory.path}/$fileName';

                                                                                        try {
                                                                                          final result = await OpenFile.open(filePath);
                                                                                        } catch (e) {
                                                                                          print(e.toString());
                                                                                        }
                                                                                      }
                                                                                    },
                                                                                    child: Text(chatmessagesusermodal?.data?[index].message ?? "", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 12.sp))),
                                                                                Align(
                                                                                  alignment: Alignment.bottomRight,
                                                                                  child: Text(chatmessagesusermodal?.data?[index].time ?? ""),
                                                                                )
                                                                              ],
                                                                            )
                                                                          : Text("地点")))
                                          : Padding(
                                              padding: EdgeInsets.only(
                                                  left: 3.w,
                                                  top: 1.h,
                                                  right: 150.w),
                                              child: Container(
                                                width: 200.w,
                                                margin: EdgeInsets.only(
                                                    left: 5.w,
                                                    top: 5.h,
                                                    bottom: 5.h,
                                                    right: 5.w),
                                                padding: EdgeInsets.only(
                                                    left: 5.w,
                                                    top: 5.h,
                                                    bottom: 5.h,
                                                    right: 5.w),
                                                decoration: BoxDecoration(
                                                    color: chatmessagesusermodal
                                                                ?.data?[index]
                                                                .readStatus ==
                                                            "0"
                                                        ? Color(0xffBE1313)
                                                        : Color(0xffb909395),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    statsredy(
                                                        chatmessagesusermodal
                                                                ?.data?[index]
                                                                .chatId ??
                                                            "");
                                                  },
                                                  child: (chatmessagesusermodal
                                                                  ?.data?[index]
                                                                  .messageType)
                                                              .toString() ==
                                                          "1"
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(chatmessagesusermodal
                                                                      ?.data?[
                                                                          index]
                                                                      .message ??
                                                                  ""),
                                                            ),
                                                            SizedBox(
                                                                width: 20.w),
                                                            Text(chatmessagesusermodal
                                                                    ?.data?[
                                                                        index]
                                                                    .time ??
                                                                "")
                                                          ],
                                                        )
                                                      : (chatmessagesusermodal
                                                                      ?.data?[
                                                                          index]
                                                                      .messageType)
                                                                  .toString() ==
                                                              "2"
                                                          ? Container(
                                                              child: Column(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      statsredy(
                                                                          chatmessagesusermodal?.data?[index].chatId ??
                                                                              "");
                                                                    },
                                                                    child: Image
                                                                        .network(
                                                                      chatmessagesusermodal
                                                                              ?.data?[index]
                                                                              .message ??
                                                                          "",
                                                                      height:
                                                                          100.h,
                                                                      width:
                                                                          150.w,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomRight,
                                                                      child: Text(
                                                                          chatmessagesusermodal?.data?[index].time ??
                                                                              ""))
                                                                ],
                                                              ),
                                                            )
                                                          : (chatmessagesusermodal
                                                                          ?.data?[
                                                                              index]
                                                                          .messageType)
                                                                      .toString() ==
                                                                  "3"
                                                              ? Column(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        statsredy(chatmessagesusermodal?.data?[index].chatId ??
                                                                            "");
                                                                      },
                                                                      child: addVideo(
                                                                          videoid:
                                                                              chatmessagesusermodal?.data?[index].message ?? ""),
                                                                    ),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomRight,
                                                                        child: Text(chatmessagesusermodal?.data?[index].time ??
                                                                            ""))
                                                                  ],
                                                                )
                                                              : (chatmessagesusermodal
                                                                              ?.data?[
                                                                                  index]
                                                                              .messageType)
                                                                          .toString() ==
                                                                      "4"
                                                                  ? GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        statsredy(chatmessagesusermodal?.data?[index].chatId ??
                                                                            "");
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          HomePage(
                                                                              url: chatmessagesusermodal?.data?[index].message ?? ""),
                                                                          Align(
                                                                              alignment: Alignment.bottomRight,
                                                                              child: Text(chatmessagesusermodal?.data?[index].time ?? ""))
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : (chatmessagesusermodal?.data?[index].messageType)
                                                                              .toString() ==
                                                                          "5"
                                                                      ? Column(
                                                                          children: [
                                                                            GestureDetector(
                                                                                onTap: () async {
                                                                                  statsredy(chatmessagesusermodal?.data?[index].chatId ?? "");

                                                                                  final String? url = (chatmessagesusermodal?.data?[index].message);
                                                                                  String fileExtension = path.extension(url!);

                                                                                  if (fileExtension == ".txt") {
                                                                                    Navigator.of(context).push(MaterialPageRoute(
                                                                                        builder: (context) => webview(
                                                                                              data: chatmessagesusermodal?.data?[index].message,
                                                                                            )));
                                                                                  } else {
                                                                                    var response = await http.get(Uri.parse((chatmessagesusermodal?.data?[index].message).toString()));
                                                                                    String fileName = url.toString().split('/').last;
                                                                                    Directory? storageDirectory = Platform.isAndroid ? await getExternalStorageDirectory() : await getDownloadsDirectory();
                                                                                    String directoryPath = storageDirectory!.path;
                                                                                    File file = File('$directoryPath/$fileName');
                                                                                    // Directory directory = await getApplicationDocumentsDirectory();
                                                                                    await file.writeAsBytes(response.bodyBytes);
                                                                                    String filePath = '${storageDirectory.path}/$fileName';

                                                                                    try {
                                                                                      final result = await OpenFile.open(filePath);
                                                                                    } catch (e) {
                                                                                      print(e.toString());
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: Text(chatmessagesusermodal?.data?[index].message ?? "", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 12.sp))),
                                                                            Align(
                                                                                alignment: Alignment.bottomRight,
                                                                                child: Text(chatmessagesusermodal?.data?[index].time ?? ""))
                                                                          ],
                                                                        )
                                                                      : Text(
                                                                          "地点"),
                                                ),
                                              ),
                                            )
                                    ]
                                  ])
                                  //                             ListView.builder(
                                  //   scrollDirection: Axis.vertical,
                                  //   physics: ScrollPhysics(),
                                  //   reverse: true,
                                  //   shrinkWrap: true,
                                  //   controller: _scrollController,
                                  //   itemCount: chatmessagesusermodal?.data?.length,
                                  //   itemBuilder: (contaxt, index) {
                                  //     return (senderid ==
                                  //             chatmessagesusermodal
                                  //                 ?.data?[index].fromUserId)
                                  //         ? Padding(
                                  //             padding: EdgeInsets.only(
                                  //                 left: 150.w, right: 3.w, top: 0.h),
                                  //             child: Container(
                                  //                 width: 200.w,
                                  //                 margin: EdgeInsets.only(
                                  //                     left: 5.w,
                                  //                     top: 5.h,
                                  //                     bottom: 5.h,
                                  //                     right: 5.w),
                                  //                 padding: EdgeInsets.only(
                                  //                     left: 5.w,
                                  //                     top: 5.h,
                                  //                     bottom: 5.h,
                                  //                     right: 5.w),
                                  //                 decoration: BoxDecoration(
                                  //                     color: Color(0xffBE1313),
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(5.0)),
                                  //                 child:
                                  //                     (chatmessagesusermodal?.data?[index]
                                  //                                     .messageType)
                                  //                                 .toString() ==
                                  //                             "1"
                                  //                         ? Row(
                                  //                             mainAxisAlignment:
                                  //                                 MainAxisAlignment
                                  //                                     .spaceBetween,
                                  //                             children: [
                                  //                               Expanded(
                                  //                                 child: Text(
                                  //                                     chatmessagesusermodal
                                  //                                             ?.data?[index]
                                  //                                             .message ??
                                  //                                         "",
                                  //                                     textAlign:
                                  //                                         TextAlign.left,
                                  //                                     style: TextStyle(
                                  //                                         color:
                                  //                                             Colors.black,
                                  //                                         fontSize: 12.sp)),
                                  //                               ),
                                  //                               Text(chatmessagesusermodal
                                  //                                       ?.data?[index]
                                  //                                       .time ??
                                  //                                   "")
                                  //                             ],
                                  //                           )
                                  //                         : (chatmessagesusermodal
                                  //                                         ?.data?[index]
                                  //                                         .messageType)
                                  //                                     .toString() ==
                                  //                                 "2"
                                  //                             ? Column(
                                  //                                 crossAxisAlignment:
                                  //                                     CrossAxisAlignment
                                  //                                         .start,
                                  //                                 children: [
                                  //                                   GestureDetector(
                                  //                                     onTap: () {
                                  //
                                  //                                     },
                                  //                                     child:
                                  //                                         Image.network(
                                  //                                       chatmessagesusermodal
                                  //                                               ?.data?[
                                  //                                                   index]
                                  //                                               .message ??
                                  //                                           "",
                                  //                                       height: 100.h,
                                  //                                       width: 150.w,
                                  //                                       fit: BoxFit.cover,
                                  //                                     ),
                                  //                                   ),
                                  //                                   Align(
                                  //                                     alignment: Alignment
                                  //                                         .bottomRight,
                                  //                                     child: Text(
                                  //                                         chatmessagesusermodal
                                  //                                                 ?.data?[
                                  //                                                     index]
                                  //                                                 .time ??
                                  //                                             ""),
                                  //                                   )
                                  //                                 ],
                                  //                               )
                                  //                             : (chatmessagesusermodal
                                  //                                             ?.data?[
                                  //                                                 index]
                                  //                                             .messageType)
                                  //                                         .toString() ==
                                  //                                     "3"
                                  //                                 ? Column(
                                  //                                     children: [
                                  //                                       GestureDetector(
                                  //                                         onTap: () {},
                                  //                                         child: addVideo(
                                  //                                             videoid: chatmessagesusermodal
                                  //                                                     ?.data?[index]
                                  //                                                     .message ??
                                  //                                                 ""),
                                  //                                       ),
                                  //                                       Align(
                                  //                                         alignment: Alignment
                                  //                                             .bottomRight,
                                  //                                         child: Text(chatmessagesusermodal
                                  //                                                 ?.data?[
                                  //                                                     index]
                                  //                                                 .time ??
                                  //                                             ""),
                                  //                                       )
                                  //                                     ],
                                  //                                   )
                                  //                                 : (chatmessagesusermodal
                                  //                                                 ?.data?[
                                  //                                                     index]
                                  //                                                 .messageType)
                                  //                                             .toString() ==
                                  //                                         "4"
                                  //                                     ? Column(
                                  //                                         children: [
                                  //                                           HomePage(
                                  //                                               url: chatmessagesusermodal
                                  //                                                       ?.data?[index]
                                  //                                                       .message ??
                                  //                                                   ""),
                                  //                                           Align(
                                  //                                             alignment:
                                  //                                                 Alignment
                                  //                                                     .bottomRight,
                                  //                                             child: Text(
                                  //                                                 chatmessagesusermodal?.data?[index].time ??
                                  //                                                     ""),
                                  //                                           )
                                  //                                         ],
                                  //                                       )
                                  //                                     : (chatmessagesusermodal?.data?[index].messageType).toString() ==
                                  //                                             "5"
                                  //                                         ? Column(
                                  //                                             children: [
                                  //                                               GestureDetector(
                                  //                                                   onTap:
                                  //                                                       () async {
                                  //                                                     final String?
                                  //                                                         url =
                                  //                                                         (chatmessagesusermodal?.data?[index].message);
                                  //                                                     String
                                  //                                                         fileExtension =
                                  //                                                         path.extension(url!);
                                  //
                                  //                                                     if (fileExtension ==
                                  //                                                         ".txt") {
                                  //                                                       Navigator.of(context).push(MaterialPageRoute(
                                  //                                                           builder: (context) => webview(
                                  //                                                                 data: chatmessagesusermodal?.data?[index].message,
                                  //                                                               )));
                                  //                                                     } else {
                                  //                                                       var response = await http.get(Uri.parse((chatmessagesusermodal?.data?[index].message).toString()));
                                  //                                                       String fileName = url.toString().split('/').last;
                                  //                                                       Directory? storageDirectory = Platform.isAndroid ? await getExternalStorageDirectory() : await getDownloadsDirectory();
                                  //                                                       String directoryPath = storageDirectory!.path;
                                  //                                                       File file = File('$directoryPath/$fileName');
                                  //                                                       // Directory directory = await getApplicationDocumentsDirectory();
                                  //                                                       await file.writeAsBytes(response.bodyBytes);
                                  //                                                       String filePath = '${storageDirectory.path}/$fileName';
                                  //
                                  //                                                       try {
                                  //                                                         final result = await OpenFile.open(filePath);
                                  //                                                       } catch (e) {
                                  //                                                         print(e.toString());
                                  //                                                       }
                                  //                                                     }
                                  //                                                   },
                                  //                                                   child: Text(
                                  //                                                       chatmessagesusermodal?.data?[index].message ?? "",
                                  //                                                       textAlign: TextAlign.left,
                                  //                                                       style: TextStyle(color: Colors.black, fontSize: 12.sp))),
                                  //                                               Align(
                                  //                                                 alignment:
                                  //                                                     Alignment.bottomRight,
                                  //                                                 child: Text(chatmessagesusermodal?.data?[index].time ??
                                  //                                                     ""),
                                  //                                               )
                                  //                                             ],
                                  //                                           )
                                  //                                         : Text("地点")))
                                  //         : Padding(
                                  //             padding: EdgeInsets.only(
                                  //                 left: 3.w, top: 1.h, right: 150.w),
                                  //             child: Container(
                                  //               width: 200.w,
                                  //               margin: EdgeInsets.only(
                                  //                   left: 5.w,
                                  //                   top: 5.h,
                                  //                   bottom: 5.h,
                                  //                   right: 5.w),
                                  //               padding: EdgeInsets.only(
                                  //                   left: 5.w,
                                  //                   top: 5.h,
                                  //                   bottom: 5.h,
                                  //                   right: 5.w),
                                  //               decoration: BoxDecoration(
                                  //                   color:chatmessagesusermodal
                                  //                       ?.data?[index]
                                  //                       .readStatus=="0"?Color(0xffBE1313):Color(0xffb909395),
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(5.0)),
                                  //               child: GestureDetector(
                                  //                 onTap: (){
                                  //                   statsredy(chatmessagesusermodal
                                  //                       ?.data?[index].chatId ??"");
                                  //                 },
                                  //                 child: (chatmessagesusermodal
                                  //                                 ?.data?[index]
                                  //                                 .messageType)
                                  //                             .toString() ==
                                  //                         "1"
                                  //                     ? Row(
                                  //                         mainAxisAlignment:
                                  //                             MainAxisAlignment
                                  //                                 .spaceBetween,
                                  //                         children: [
                                  //                           Expanded(
                                  //                             child: Text(chatmessagesusermodal
                                  //                                     ?.data?[index]
                                  //                                     .message ??
                                  //                                 ""),
                                  //                           ),
                                  //                           SizedBox(width:20.w),
                                  //                           Text(chatmessagesusermodal
                                  //                                   ?.data?[index].time ??
                                  //
                                  //
                                  //                               "")
                                  //                         ],
                                  //                       )
                                  //                     : (chatmessagesusermodal?.data?[index]
                                  //                                     .messageType)
                                  //                                 .toString() ==
                                  //                             "2"
                                  //                         ? Container(
                                  //                           child: Column(
                                  //                               children: [
                                  //                                 GestureDetector(
                                  //                                   onTap: () {
                                  //                                     statsredy(chatmessagesusermodal
                                  //                                         ?.data?[index].chatId ??"");
                                  //                                   },
                                  //                                   child: Image.network(
                                  //                                     chatmessagesusermodal
                                  //                                             ?.data?[index]
                                  //                                             .message ??
                                  //                                         "",
                                  //                                     height: 100.h,
                                  //                                     width: 150.w,
                                  //                                     fit: BoxFit.cover,
                                  //                                   ),
                                  //                                 ),
                                  //                                 Align(
                                  //                                     alignment: Alignment
                                  //                                         .bottomRight,
                                  //                                     child: Text(
                                  //                                         chatmessagesusermodal
                                  //                                                 ?.data?[
                                  //                                                     index]
                                  //                                                 .time ??
                                  //                                             ""))
                                  //                               ],
                                  //                             ),
                                  //                         )
                                  //                         : (chatmessagesusermodal
                                  //                                         ?.data?[index]
                                  //                                         .messageType)
                                  //                                     .toString() ==
                                  //                                 "3"
                                  //                             ? Column(
                                  //                                 children: [
                                  //                                   GestureDetector(
                                  //                                     onTap: () {
                                  //
                                  //                                         statsredy(chatmessagesusermodal
                                  //                                             ?.data?[index].chatId ??"");
                                  //
                                  //                                     },
                                  //                                     child: addVideo(
                                  //                                         videoid: chatmessagesusermodal
                                  //                                                 ?.data?[
                                  //                                                     index]
                                  //                                                 .message ??
                                  //                                             ""),
                                  //                                   ),
                                  //                                   Align(
                                  //                                       alignment: Alignment
                                  //                                           .bottomRight,
                                  //                                       child: Text(
                                  //                                           chatmessagesusermodal
                                  //                                                   ?.data?[
                                  //                                                       index]
                                  //                                                   .time ??
                                  //                                               ""))
                                  //                                 ],
                                  //                               )
                                  //                             : (chatmessagesusermodal
                                  //                                             ?.data?[index]
                                  //                                             .messageType)
                                  //                                         .toString() ==
                                  //                                     "4"
                                  //                                 ? GestureDetector(
                                  //                                 onTap: () {
                                  //                                   statsredy(chatmessagesusermodal
                                  //                                       ?.data?[index].chatId ??"");
                                  //                                 },
                                  //                                   child: Column(
                                  //                                       children: [
                                  //                                         HomePage(
                                  //                                             url: chatmessagesusermodal
                                  //                                                     ?.data?[
                                  //                                                         index]
                                  //                                                     .message ??
                                  //                                                 ""),
                                  //                                         Align(
                                  //                                             alignment: Alignment
                                  //                                                 .bottomRight,
                                  //                                             child: Text(chatmessagesusermodal
                                  //                                                     ?.data?[
                                  //                                                         index]
                                  //                                                     .time ??
                                  //                                                 ""))
                                  //                                       ],
                                  //                                     ),
                                  //                                 )
                                  //                                 : (chatmessagesusermodal
                                  //                                                 ?.data?[
                                  //                                                     index]
                                  //                                                 .messageType)
                                  //                                             .toString() ==
                                  //                                         "5"
                                  //                                     ? Column(
                                  //                                         children: [
                                  //                                           GestureDetector(
                                  //                                               onTap:
                                  //                                                   () async {
                                  //
                                  //                                                       statsredy(chatmessagesusermodal
                                  //                                                           ?.data?[index].chatId ??"");
                                  //
                                  //                                                 final String?
                                  //                                                     url =
                                  //                                                     (chatmessagesusermodal
                                  //                                                         ?.data?[index]
                                  //                                                         .message);
                                  //                                                 String
                                  //                                                     fileExtension =
                                  //                                                     path.extension(
                                  //                                                         url!);
                                  //
                                  //                                                 if (fileExtension ==
                                  //                                                     ".txt") {
                                  //                                                   Navigator.of(context).push(MaterialPageRoute(
                                  //                                                       builder: (context) => webview(
                                  //                                                             data: chatmessagesusermodal?.data?[index].message,
                                  //                                                           )));
                                  //                                                 } else {
                                  //                                                   var response =
                                  //                                                       await http.get(Uri.parse((chatmessagesusermodal?.data?[index].message).toString()));
                                  //                                                   String fileName = url
                                  //                                                       .toString()
                                  //                                                       .split('/')
                                  //                                                       .last;
                                  //                                                   Directory?
                                  //                                                       storageDirectory =
                                  //                                                       Platform.isAndroid
                                  //                                                           ? await getExternalStorageDirectory()
                                  //                                                           : await getDownloadsDirectory();
                                  //                                                   String
                                  //                                                       directoryPath =
                                  //                                                       storageDirectory!.path;
                                  //                                                   File
                                  //                                                       file =
                                  //                                                       File('$directoryPath/$fileName');
                                  //                                                   // Directory directory = await getApplicationDocumentsDirectory();
                                  //                                                   await file
                                  //                                                       .writeAsBytes(response.bodyBytes);
                                  //                                                   String
                                  //                                                       filePath =
                                  //                                                       '${storageDirectory.path}/$fileName';
                                  //
                                  //                                                   try {
                                  //                                                     final result =
                                  //                                                         await OpenFile.open(filePath);
                                  //                                                   } catch (e) {
                                  //                                                     print(
                                  //                                                         e.toString());
                                  //                                                   }
                                  //                                                 }
                                  //                                               },
                                  //                                               child: Text(
                                  //                                                   chatmessagesusermodal?.data?[index].message ??
                                  //                                                       "",
                                  //                                                   textAlign:
                                  //                                                       TextAlign
                                  //                                                           .left,
                                  //                                                   style: TextStyle(
                                  //                                                       color:
                                  //                                                           Colors.black,
                                  //                                                       fontSize: 12.sp))),
                                  //                                           Align(
                                  //                                               alignment:
                                  //                                                   Alignment
                                  //                                                       .bottomRight,
                                  //                                               child: Text(
                                  //                                                   chatmessagesusermodal?.data?[index].time ??
                                  //                                                       ""))
                                  //                                         ],
                                  //                                       )
                                  //                                     : Text("地点"),
                                  //               ),
                                  //             ),
                                  //           );
                                  //   },
                                  // )
                                  ),
                          SizedBox(
                            height: 50.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0.w,
                      bottom: 0.h,
                      // top: Platform.isAndroid ? 600.h : 575.h,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        padding: EdgeInsets.all(5.h),
                        height: 50.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 300.w,
                              child: TextField(
                                controller: _chat,
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      selectfile();
                                    },
                                    icon: Icon(Icons.attach_file),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      if (recorder.isRecording) {
                                        await stopRecorder();
                                        setState(() {});
                                      } else {
                                        await startRecord();
                                        setState(() {});
                                      }
                                    },
                                    child: Icon(
                                      recorder.isRecording
                                          ? Icons.stop
                                          : Icons.mic,
                                      size: 30,
                                    ),
                                  ),
                                  hintText: '開始聊天',
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.grey), //<-- SEE HERE
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.grey), //<-- SEE HERE
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.grey), //<-- SEE HERE
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    type = 1;
                                    measage();
                                  });
                                },
                                icon: Icon(
                                  Icons.send,
                                  size: 25.sp,
                                ))
                          ],
                        ),
                      )),
                ],
              ),
      ),
    );
  }

  TextStyle textstyle = TextStyle(
      color: Color(0xffb2A2424), fontSize: 14.sp, fontFamily: "simsan");
  TextStyle textstyle1 = TextStyle(
      color: Color(0xffb182459), fontSize: 14.sp, fontFamily: "simsan");
  TextStyle textstyle2 = TextStyle(
      color: Color(0xffb2A2424),
      fontSize: 17.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "simsan");
  TextStyle textstyle3 = TextStyle(
    color: Color(0xffb383838),
    fontSize: 11.sp,
    fontFamily: "simsan",
  );
  selectfile() {
    AlertDialog alert = new AlertDialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      actions: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.white),
                      child: IconButton(
                          onPressed: () async {
                            print("jfshjfsdf");
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              setState(() {
                                type = 5;
                                _pickedFile =
                                    File(result.files.single.path.toString());
                              });
                            } else {}
                            Navigator.of(context).pop();
                            measage();
                          },
                          icon: Icon(
                            Icons.file_copy_sharp,
                          )),
                    ),
                    Text(
                      "文档",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.white),
                      child: IconButton(
                          onPressed: () async {
                            type = 2;
                            XFile? photo = await _picker.pickImage(
                                source: ImageSource.camera);

                            setState(() {
                              _pickedFile = File(photo!.path);
                              type = 2;
                            });
                            Navigator.of(context).pop();
                            measage();
                          },
                          icon: Icon(
                            Icons.camera_alt,
                          )),
                    ),
                    Text(
                      "相机",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.white),
                      child: IconButton(
                          onPressed: () async {
                            XFile? photo = await _picker.pickImage(
                                source: ImageSource.gallery);
                            _pickedFile = File(photo!.path);
                            setState(() {
                              _pickedFile = File(photo!.path);
                              type = 2;
                            });
                            Navigator.of(context).pop();
                            measage();
                          },
                          icon: Icon(
                            Icons.browse_gallery,
                          )),
                    ),
                    Text(
                      "画廊",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.white),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              type = 6;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CarrentLocationScreen()),
                            );
                            Navigator.of(context).pop();
                            measage();
                          },
                          icon: Icon(
                            Icons.wrong_location_rounded,
                          )),
                    ),
                    Text(
                      "地点",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.white),
                      child: IconButton(
                          onPressed: () async {
                            XFile? photo = await _picker.pickVideo(
                                source: ImageSource.gallery);
                            _pickedFile = File(photo!.path);
                            setState(() {
                              _pickedFile = File(photo!.path);
                              type = 3;
                            });
                            Navigator.of(context).pop();
                            measage();
                          },
                          icon: Icon(
                            Icons.video_call_sharp,
                          )),
                    ),
                    Text(
                      "视频",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  measage() {
    final Map<String, String> data = {};
    data['uid'] = widget.from.toString();
    data['login_user_id'] = userdata?.userData?.id ?? "";
    data['type'] = type.toString();
    data['message'] = type == 1
        ? _chat.text.toString()
        : (type == 2)
            ? _pickedFile?.path ?? ""
            : (type == 3)
                ? _pickedFile?.path ?? ""
                : (type == 4)
                    ? _pickedFile?.path ?? ""
                    : _pickedFile?.path ?? "";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().messagesapi(data).then((response) async {
          sendmessagemodal =
              SendMessageModal.fromJson(json.decode(response.body));
          print(sendmessagemodal?.status);
          if (response.statusCode == 200 &&
              sendmessagemodal?.status == "success") {
            print(sendmessagemodal?.status);
            _chat.text = "";
            measageuser();
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

  measageuser() {
    final Map<String, String> data = {};
    data['uid'] = widget.from.toString();
    data['login_user_id'] = userdata?.userData?.id ?? "";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().messagesuserapi(data).then((response) async {
          chatmessagesusermodal =
              ChatMessagesUserModal.fromJson(json.decode(response.body));
          _notificationStreamController.add(chatmessagesusermodal);
          if (response.statusCode == 200 &&
              chatmessagesusermodal?.status == "success") {
            setState(() {
              len = (chatmessagesusermodal?.data?.length ?? 1) - 1;
            });
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

  statsredy(String value) {
    final Map<String, String> data = {};
    data['uid'] = widget.from.toString();
    data['login_user_id'] = userdata?.userData?.id ?? "";
    data['mid'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().statsapi(data).then((response) async {
          statusmodal = StatusModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && statusmodal?.status == "success") {
            measageuser();
            setState(() {});
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
}
