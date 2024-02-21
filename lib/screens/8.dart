
import 'dart:convert';

import 'package:chet/Modal/MapExplorationModal.dart';
import 'package:chet/provider/ideaprovider.dart';
import 'package:chet/screens/10.dart';
import 'package:chet/widgets/botamnavbar.dart';
import 'package:chet/widgets/buildErrorDialog.dart';
import 'package:chet/widgets/const.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Eight extends StatefulWidget {
  const Eight({Key? key}) : super(key: key);

  @override
  State<Eight> createState() => _EightState();
}

class _EightState extends State<Eight> {
  final locations = const [
    LatLng(21.1959, 72.7933),
    LatLng(21.1901, 72.8139),
    LatLng(21.2266, 72.8312),
    LatLng(21.2510, 72.7954),
    LatLng(21.2021, 72.8673),
  ];
  List<String> img = [
    "https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg",
    "https://cdn.statusqueen.com/dpimages/thumbnail/dp_images_8-1279.jpg",
    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1080213/pexels-photo-1080213.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://as1.ftcdn.net/v2/jpg/04/15/47/46/1000_F_415474633_0Q1hAKF0U1Xiots9CXgzpttuIlJVHGS7.jpg",
  ];
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(21.1702, 72.8311), //location to show in map
    zoom: 14,
  );
   // late List<MarkerData> _customMarkers;
  List<MarkerData> _customMarkers = [];



  @override
  void initState() {
    super.initState();
      mapexpo();
      print(mapexplorationmodal?.data?.length);



    //
    // _customMarkers = [
    //   MarkerData(
    //       marker: Marker(
    //           onTap: () {
    //             print("jdkc");
    //             alert();
    //           },
    //           markerId: const MarkerId('id-1'),
    //           position: locations[0]),
    //       child: _customMarker(img[0], Colors.blue)),
    //   MarkerData(
    //       marker: Marker(
    //           onTap: () {
    //             print("jdkc");
    //             alert();
    //           },
    //           markerId: const MarkerId('id-2'),
    //           position: locations[1]),
    //       child: _customMarker(img[1], Colors.red)),
    //   MarkerData(
    //       marker: Marker(
    //           onTap: () {
    //             print("jdkc");
    //             alert();
    //           },
    //           markerId: const MarkerId('id-3'),
    //           position: locations[2]),
    //       child: _customMarker(img[2], Colors.green)),
    //   MarkerData(
    //       marker: Marker(
    //           onTap: () {
    //             print("jdkc");
    //             alert();
    //           },
    //           markerId: const MarkerId('id-4'),
    //           position: locations[3]),
    //       child: _customMarker(img[3], Colors.purple)),
    //   MarkerData(
    //       marker: Marker(
    //           onTap: () {
    //             print("jdkc");
    //             alert();
    //           },
    //           markerId: const MarkerId('id-5'),
    //           position: locations[4]),
    //       child: _customMarker(img[4], Colors.blue)),
    // ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(sel:1),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomGoogleMapMarkerBuilder(
            //screenshotDelay: const Duration(seconds: 4),
            customMarkers: _customMarkers,
            builder: (BuildContext context, Set<Marker>? markers) {
              if (markers == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return GoogleMap(
                mapToolbarEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: _kGoogle,
                markers: markers,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                compassEnabled: true,
              );
            },
          ),
          Positioned(
            top: 530.h,
              left: 300.w,
              child: Column(
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),

                    child: Icon(Icons.location_searching_outlined)),
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.directions,color: Colors.white,),
                        Text("Go",style: TextStyle(color: Colors.white),)
                      ],
                    )),
              ),
            ],
          ))
        ],
      ),
    );
  }
  _customMarker(String symbol, Color color) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
        ),
        Positioned(
          left: 7,
          top: 22,
          child: Icon(
            Icons.location_on,
            color: Colors.grey.shade900,
            size: 30,
          ),
        ),
        Positioned(
            left: 0,
            top: 0,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(symbol),
            ))
      ],
    );
  }
  alert() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.black.withOpacity(0.4),
          child: GestureDetector(
            onTap: (){
              Get.to(Tenth());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 340.h,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "##将耳机音量调小偷听旁人谈话",
                    style: TextStyle(
                      fontFamily: "simsan",
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                       ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "已体验：312 | 已收藏： 89",
                    style: TextStyle(
                      fontFamily: "simsan",
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                       ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.currency_yen,
                                color: Colors.black,
                              )),
                          SizedBox(
                            width: 3.h,
                          ),
                          Text(
                            "12元",
                            style: TextStyle(
                              fontFamily: "simsan",
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                               ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 3.h,
                          ),
                          Text(
                            "已休验",
                            style: TextStyle(
                              fontFamily: "simsan",
                              color: Color(0xffbA8A8A8),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                               ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red.shade900,
                          ),
                          SizedBox(
                            width: 3.h,
                          ),
                          Text(
                            "收藏",
                            style: TextStyle(
                              fontFamily: "simsan",
                                color: Color(0xffbA8A8A8),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                               ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Container(
                          // height: 30.0,
                          // width: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.watch_later,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 3.h,
                      ),
                      Text(
                        "开始时间",
                        style: TextStyle(
                          fontFamily: "simsan",
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "2022年11月30日 18:00",
                    style: TextStyle(
                      fontFamily: "simsan",
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                       ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 30.0,
                          width: 30.0,
                          child: Icon(
                            Icons.watch_later_outlined,
                            color: Colors.white,
                          )),
                      Text(
                        "体验时长",
                        style: TextStyle(
                          fontFamily: "simsan",
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "15分钟",
                    style: TextStyle(
                      fontFamily: "simsan",
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                       ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 30.0,
                          width: 30.0,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          )),
                      Text(
                        "体验地点",
                        style: TextStyle(
                          fontFamily: "simsan",
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                           ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "中国 陕西西安 桃园南路21号公园天下小",
                    style: TextStyle(
                      fontFamily: "simsan",
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "区南门入口处 710082 | 距您1.2km",
                    style: TextStyle(
                      fontFamily: "simsan",
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                       ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  mapexpo(){
    final Map<String, String> data = {};
    data['user_id'] = "62";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ideaprovider().mapexpolorapi(data).then(( response) async {
          mapexplorationmodal = MapExplorationModal.fromJson(json.decode(response.body));
          print(mapexplorationmodal?.status);
          if (response.statusCode == 200 && mapexplorationmodal?.status == "success") {
            print(mapexplorationmodal?.data?.length);
            for(int i=0;i< int.parse((mapexplorationmodal?.data?.length).toString());i++){

              MarkerData(
                  marker: Marker(
                      onTap: () {
                        print("jdkc");
                        alert();
                      },
                      markerId: const MarkerId('id-1'),
                      position: LatLng(double.parse((mapexplorationmodal?.data?[i].eventLongitude).toString()),double.parse((mapexplorationmodal?.data?[i].eventLatitude).toString()))),
                  child: _customMarker(img[i], Colors.blue));
            }
            // for(int i=0;i< int.parse((mapexplorationmodal?.data?.length).toString()) ;i++){
            //   locations.add(LatLng(double.parse((mapexplorationmodal?.data?[i].eventLongitude).toString()), double.parse((mapexplorationmodal?.data?[i].eventLongitude).toString())));
            //   img.add((mapexplorationmodal?.data?[i].profilePicture ?? ""));
            //   _customMarkers.add( MarkerData(
            //       marker: Marker(
            //           onTap: () {
            //             print("jdkc");
            //             alert();
            //           },
            //           markerId: const MarkerId('id-1'),
            //           position: LatLng(double.parse((mapexplorationmodal?.data?[i].eventLongitude).toString()), double.parse((mapexplorationmodal?.data?[i].eventLongitude).toString()))),
            //       child: _customMarker(mapexplorationmodal?.data?[i].profilePicture ?? "", Colors.blue)),);
            // }

            setState(() {

              // isLoading = false;
            });
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

