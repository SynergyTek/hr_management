import 'dart:async';

import 'package:boilerplate/logic/blocs/location_bloc/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class MarkAttendanceWidget extends StatefulWidget {
  MarkAttendanceWidget();

  @override
  _MarkAttendanceWidgetState createState() => _MarkAttendanceWidgetState();
}

class _MarkAttendanceWidgetState extends State<MarkAttendanceWidget> {
  bool isInternetConnection = false;
  bool isPermissonGranted = false;
  dynamic isInLocation;
  String _location = "Test Location...";
  // GeoLocationHelper _geoLocationHelper = new GeoLocationHelper();
  Location _locationService = new Location();
  // late StreamSubscription<LocationData> _locationSubscription;
  @override
  void initState() {
    super.initState();

    // if (isPermissonGranted) {
    // getCurrentLocation();
    // }
  }

  calculateDistance(double latitude, double longitude) async {
    bool result = false;
    final double radius = 0.2;

    var currentLatitude = 23.277345657348633; //lalghati
    var currentLongitude = 77.35205841064453;
    var newLatitude = 23.27268409729004; //lalghati square
    var newLongitude = 77.36927032470703;

    print("location:" + latitude.toString() + longitude.toString());

    // for (var i = 0; i <= locationList.length - 1; i++) {
    // print("count:" + i.toString());
    // final double distance = await Geolocator.distanceBetween(
    //     locationList[i].latitude,
    //     locationList[i].longitude,
    //     currentLocation.latitude,
    //     currentLocation.longitude);

    final double distance = await Geolocator.distanceBetween(
        newLatitude, newLongitude, currentLatitude, currentLongitude);

    // print("location:" +
    //     locationList[i].latitude.toString() +
    //     locationList[i].longitude.toString());

    var distanceInkm = distance / 1000;
    // print("distance" + distanceInkm.toString());

    distanceInkm < radius ? result = true : result = false;
    // print(distanceInkm < radius);
    // if (result) {
    return result;
    // }
    // }
  }

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
      print(calculateDistance(
          state.locationData.latitude, state.locationData.latitude));
      return Stack(
        children: <Widget>[
          attendanceTab(),
          Visibility(
            visible: false,
            child: Center(child: new CircularProgressIndicator()),
          ),
        ],
      );
    });
  }

  // getCurrentLocation() async {
  //   isPermissonGranted = await _geoLocationHelper.checkLocationPermission();
  //   bool futureLocation = false;
  //   if (isPermissonGranted) {
  //     _locationSubscription = _locationService.onLocationChanged
  //         .listen((LocationData result) async {
  //       print("latt:" +
  //           result.latitude.toString() +
  //           ",long:" +
  //           result.longitude.toString());

  //       futureLocation = await _geoLocationHelper.calculateDistance();
  //       //(result, settingInheritedWidget.userDetails.enableGeoLacation);
  //       //   futureLocation.then((value) {
  //       //     print(value);
  //       //     // if (mounted) {
  //       setState(() {
  //         isInLocation = true;
  //       });
  //       //     // } else
  //       //     //   return;
  //       //   }, onError: (e) {
  //       //     print(e);
  //       //   });
  //     });
  //   }

  //   return futureLocation;
  // }

  attendanceTab() {
    return //isInternetConnection?

        AbsorbPointer(
      absorbing: false,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Stack(
            children: <Widget>[
              Visibility(
                visible: isPermissonGranted,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 340, 0, 0),
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Card(
                        color: Colors.grey[200],
                        elevation: 0,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Text(
                            "Location to Punch-In:-",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Visibility(
              //   visible: isPermissonGranted,
              //   child: Container(
              //     padding: EdgeInsets.fromLTRB(10, 360, 10, 0),
              //     child: Listizer(
              //       listItems: LocationHelper.locationList,
              //       filteredSearchList: _filteredGeoLocationlist,
              //       itemBuilder: (context, index) {
              //         return ListTile(
              //           title: Text(_filteredGeoLocationlist[index].name),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              Container(
                  child: Column(
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(10),
                    // color: Colors.grey[200],
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      height: 120,
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey[200],
                            child: CircleAvatar(
                              radius: 38,
                              backgroundColor: Colors.white,
                              // backgroundImage: settingInheritedWidget
                              //             .userDetails.imageContent !=
                              //         null
                              //     ? MemoryImage(base64Decode(
                              //         settingInheritedWidget
                              //             .userDetails.imageContent))
                              //     : null,
                              // child: settingInheritedWidget
                              //                 .userDetails.imageContent ==
                              //             null ||
                              //         settingInheritedWidget
                              //                 .userDetails.imageContent ==
                              //             ""?
                              child: Icon(
                                Icons.person,
                                color: Colors.black26,
                                size: 45,
                              ),
                              // : null,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 28,
                              ),
                              Text("User Name"),
                              Text("Email"),
                              Text("Job Name"),
                              // Text(
                              //   settingInheritedWidget
                              //                   .userDetails.username !=
                              //               null ||
                              //           settingInheritedWidget
                              //                   .userDetails.username !=
                              //               ""
                              //       ? settingInheritedWidget
                              //           .userDetails.username
                              //       : "-",
                              //   style: Theme.of(context).textTheme.title,
                              // ),
                              // Text(
                              //   settingInheritedWidget.userDetails
                              //                   .profileDetails.jobName !=
                              //               null ||
                              //           settingInheritedWidget.userDetails
                              //                   .profileDetails.jobName !=
                              //               ""
                              //       ? settingInheritedWidget.userDetails
                              //           .profileDetails.jobName
                              //       : "-",
                              // ),
                              // Text(
                              //   settingInheritedWidget
                              //                   .userDetails.email !=
                              //               null ||
                              //           settingInheritedWidget
                              //                   .userDetails.email !=
                              //               ""
                              //       ? settingInheritedWidget
                              //           .userDetails.email
                              //       : "-",
                              // ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Opacity(
                    opacity: 1, //settingInheritedWidget
                    //     .userDetails.enableGeoLacation
                    // ? 1.0
                    // : isInLocation != null
                    //     ? !isInLocation
                    //         ? 0.3
                    //         : 1.0
                    //     : 0.3,
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  InkWell(
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Colors.green,
                                        child: CircleAvatar(
                                          radius: 33,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.fingerprint,
                                            color: Colors.green,
                                            size: 40.0,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        // sendaccessLogRequest("Checkin");
                                      }),
                                  Text("Sign In",
                                      style: TextStyle(color: Colors.green))
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  InkWell(
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Colors.red,
                                        child: CircleAvatar(
                                          radius: 33,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.power_settings_new,
                                            color: Colors.red,
                                            size: 40.0,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        // sendaccessLogRequest("Checkout");
                                      }),
                                  Text("Sign Out",
                                      style: TextStyle(color: Colors.red))
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red[800],
                            size: 28,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            _location,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          )),
          Visibility(
            visible: !isPermissonGranted,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: new BorderRadius.circular(18.0),
                    // ),
                    // color: Theme.of(context).primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        Text(
                          " Enable Location",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      // await Geolocator.openAppSettings();
// await Geolocator.openLocationSettings();
                    },
                  ),
                  Text(
                    "You'll need to enable your location in order to access attendance.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // : NetworkErrorWidget(
    //     errorMsg: 'No Internet Connection\n Please try again Later.',
    //   );
  }

  appBarWidget() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 100.0, top: 2),
                child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      // color: isInLocation != null
                      //     ? isInLocation
                      //         ? background.evaluate(
                      //             AlwaysStoppedAnimation(_controller.value))
                      //         : Colors.transparent
                      //     : Colors.transparent,)
                    )),
              ),
              Text("Attendance"),
            ],
          ),
          Visibility(
            visible: isInLocation != null
                ? isInLocation
                    ? true
                    : false
                : false,
            child: Text("(You are in range to mark attendance)"),
          ),
        ],
      ),
    );
  }
}
