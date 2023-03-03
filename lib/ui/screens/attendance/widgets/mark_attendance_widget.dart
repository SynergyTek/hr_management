import 'package:geocoding/geocoding.dart' as geo;
import 'package:hr_management/helper/location_database_provider.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';

import '../../../../data/models/login_models/extra_user_information_model.dart';
import '../../../../data/models/user_location_model.dart';
import '../../../../helper/workmanager_helper/workmanager_helper.dart';
import '../../../../logic/blocs/access_log_bloc/access_log_bloc.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../widgets/snack_bar.dart';

import '../../../../logic/blocs/location_bloc/location_bloc.dart';
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

  bool _isLocationServiceEnabled = false;

  dynamic isInLocation;
  String? _location = "Fetching location data...";

  // signed in/out check
  late bool isSignedIn;

  bool isVisible = false;

  _checkLocationService() async {
    setState(
      () {
        LocationBloc().isLocationServiceEnabled().then(
              (value) => _isLocationServiceEnabled = value,
            );
      },
    );
  }

  calculateDistance() {
    bool result = false;
    final double radius = 0.25;

    var officeLatitude = 23.23688;
    var officeLongitude = 77.433565;

    final double distance = Geolocator.distanceBetween(
      BlocProvider.of<LocationBloc>(context).state.locationData?.latitude ??
          0.0,
      BlocProvider.of<LocationBloc>(context).state.locationData?.longitude ??
          0.0,
      officeLatitude,
      officeLongitude,
    );

    var distanceInkm = distance / 1000;
    distanceInkm < radius ? result = true : result = false;

    print(
        "Distance from Office: $distanceInkm & \nis in the proximity of the office: $result, Current location: (${BlocProvider.of<LocationBloc>(context).state.locationData?.latitude}, ${BlocProvider.of<LocationBloc>(context).state.locationData?.longitude})");
    return result;
  }

  @override
  void initState() {
    isSignedIn = BlocProvider.of<UserModelBloc>(context)
            .state
            .extraUserInformation
            ?.isSignedIn ??
        false;

    super.initState();

    _checkLocationService();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        // getUserAddressFromCoord(locationData: state.locationData!);
        return Stack(
          children: <Widget>[
            attendanceTab(),
            Visibility(
              visible: isVisible,
              child: Center(
                child: CustomProgressIndicator(),
              ),
            ),
          ],
        );
      },
    );
  }

  attendanceTab() {
    return AbsorbPointer(
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
                  BlocBuilder<UserModelBloc, UserModelState>(
                    builder: (context, state) {
                      return Container(
                        padding: DEFAULT_LARGE_VERTICAL_PADDING,
                        child: Card(
                          elevation: 16.0,
                          child: ListTile(
                            tileColor: Theme.of(context).textHeadingColor,
                            title: Text(
                              state.userModel?.jobTitle ?? '-',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              state.userModel?.email ?? '-',
                              style: TextStyle(color: Colors.white),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 24,
                              child: Icon(
                                Icons.person,
                                color: Theme.of(context).textHeadingColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
                                    onTap: () => _handleSignInOnClick(),
                                  ),
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
                                    onTap: () => _handleSignOutOnClick(),
                                  ),
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
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Icon(
                  //           Icons.location_on,
                  //           color: Colors.red[800],
                  //           size: 28,
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Text(
                  //           _location!,
                  //           style: TextStyle(fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              )),
            ],
          )),
          // Visibility(
          //   visible: !_isLocationServiceEnabled,
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
          //     child: Column(
          //       children: <Widget>[
          //         ElevatedButton(
          //           // shape: RoundedRectangleBorder(
          //           //   borderRadius: new BorderRadius.circular(18.0),
          //           // ),
          //           // color: Theme.of(context).primaryColor,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: <Widget>[
          //               Icon(
          //                 Icons.settings,
          //                 color: Colors.white,
          //               ),
          //               Text(
          //                 " Enable Location",
          //                 style: TextStyle(color: Colors.white),
          //               ),
          //             ],
          //           ),
          //           onPressed: () async {
          //             // await Geolocator.openAppSettings();
          //             await Geolocator.openLocationSettings();
          //           },
          //         ),
          //         Text(
          //           "You'll need to enable your location in order to access attendance.",
          //           textAlign: TextAlign.center,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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

  void _handleSignInOnClick() async {
    // Check first whether the user has provided the required permissions and also
    // Whether the location services are on.
    // await _checkLocationService();

    // if (calculateDistance() == false) {
    //   displaySnackBar(
    //     context: context,
    //     text: 'Failure: You are not in the proximity of the office.',
    //   );
    //   return;
    // }

    if (!isSignedIn) {
      setState(() {
        isVisible = true;
      });

      // Trying to schedule the get location task in the background every 5 minutes.
      // WorkmanagerHelper().registerGetLocationDataBackgroundPeriodicTask();

      await accessLogBloc.getInsertAccessLog(
        isSignIn: true,
        userId:
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      );

      setState(() {
        isVisible = false;
      });

      print("Sign In isSignIn?: ${accessLogBloc.subject.value.isSignIn}");
      print(
          "Sign In Error?: ${accessLogBloc.subject.value.error}, ${accessLogBloc.subject.value.error.runtimeType}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            accessLogBloc.subject.value.isSignIn == 0 &&
                    accessLogBloc.subject.value.error == null
                ? "Sign in successful!"
                : "An error occured please try again later.",
          ),
        ),
      );
      if (accessLogBloc.subject.value.isSignIn == 0 &&
          accessLogBloc.subject.value.error == null) {
        isSignedIn = true;
        BlocProvider.of<UserModelBloc>(context).add(
          UserModelChangeEvent(
            userModel: BlocProvider.of<UserModelBloc>(context).state.userModel!,
            extraUserInformation: ExtraUserInformationModel(
              isSignedIn: true,
            ),
          ),
        );
      }
    } else
      displaySnackBar(
          text:
              'You are already signed in. Please Sign Out before signing in again.',
          context: context);
  }

  void _handleSignOutOnClick() async {
    // Check first whether the user has provided the required permissions and also
    // Whether the location services are on.
    // await _checkLocationService();

    // if (calculateDistance() == false) {
    //   displaySnackBar(
    //     context: context,
    //     text: 'Failure: You are not in the proximity of the office.',
    //   );
    //   return;
    // }

    if (isSignedIn == true) {
      setState(() {
        isVisible = true;
      });

      // cancel background task on click of sign out

      // WorkmanagerHelper().cancelWorkManager();
      List<UserLocation> locations =
          await LocationDatabaseProvider().getAllUserLocations();
      print(locations);

      await accessLogBloc.getInsertAccessLog(
        isSignIn: false,
        userId:
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      );
      setState(() {
        isVisible = false;
      });

      print("Sign Out isSignIn?: ${accessLogBloc.subject.value.isSignIn}");
      print("Sign Out Error?: ${accessLogBloc.subject.value.error}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            accessLogBloc.subject.value.isSignIn == 1 &&
                    accessLogBloc.subject.value.error == null
                ? "Sign out successful!"
                : "Error occured please try again later.",
          ),
        ),
      );
      if (accessLogBloc.subject.value.isSignIn == 1 &&
          accessLogBloc.subject.value.error == null) {
        isSignedIn = false;
        BlocProvider.of<UserModelBloc>(context).add(
          UserModelChangeEvent(
            userModel: BlocProvider.of<UserModelBloc>(context).state.userModel!,
            extraUserInformation: ExtraUserInformationModel(
              isSignedIn: false,
            ),
          ),
        );
      }
    } else {
      displaySnackBar(text: 'You have already signed out.', context: context);
    }
  }

  // getUserAddressFromCoord({required LocationData locationData}) async {
  //   List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
  //     locationData.latitude!,
  //     locationData.longitude!,
  //   );

  //   geo.Placemark place = placemarks[0];
  //   print(place);

  //   _location =
  //       "${place.name == null || place.name!.isEmpty ? '' : place.name! + ', '}\n${place.street == null || place.street!.isEmpty ? '' : place.street! + ', '}${place.subLocality == null || place.subLocality!.isEmpty ? null : place.subLocality! + ', '}${place.locality == null || place.locality!.isEmpty ? null : place.locality! + ', '}\n${place.subAdministrativeArea == null || place.subAdministrativeArea!.isEmpty ? '' : place.subAdministrativeArea! + ', '}${place.administrativeArea == null || place.administrativeArea!.isEmpty ? '' : place.administrativeArea! + ', '}\n${place.postalCode == null || place.postalCode!.isEmpty ? '' : place.postalCode! + ', '}${place.isoCountryCode == null || place.isoCountryCode!.isEmpty ? '' : place.isoCountryCode! + '.'}";
  // }
}
