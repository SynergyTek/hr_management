import 'dart:convert';
import 'dart:math';

import 'package:geolocator/geolocator.dart' as geolo;
import 'package:hr_management/logic/blocs/attendance_view_bloc/attendance_view_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';

import '../../../../data/models/login_models/extra_user_information_model.dart';
import '../../../../data/models/user_geo_location_model/user_geo_location_model.dart';
import '../../../../data/models/user_geo_location_model/user_geo_location_response.dart';
import '../../../../data/models/user_location_model.dart';
import '../../../../logic/blocs/access_log_bloc/access_log_bloc.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../widgets/snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart' as geo;

class MarkAttendanceWidget extends StatefulWidget {
  MarkAttendanceWidget();

  @override
  _MarkAttendanceWidgetState createState() => _MarkAttendanceWidgetState();
}

class _MarkAttendanceWidgetState extends State<MarkAttendanceWidget> {
  bool isInternetConnection = false;
  bool isPermissonGranted = false;
  bool isSignInActive = true;

  dynamic isInLocation;

  double signInLatitude = 0.0;
  double signInLongitude = 0.0;

  // signed in/out check
  late bool isSignedIn;

  bool isVisible = true;
  String _location = 'Fetching location...';

  activateSignIn() async {
    UserGeolocationResponse? response =
        await attendanceViewBloc.getUserGeoLocation(queryparams: {
      "userId":
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    });

    if (response != null &&
        response.data != null &&
        response.data!.isNotEmpty) {
      List<UserGeolocationModel>? list = response.data;

      for (var i = 0; i < list!.length; i++) {
        // Check if location is within 20m radius
        isSignInActive = calculateDistance(
          latitude: response.data?[i].latitude ?? 0.00,
          longitude: response.data?[i].longtitude ?? 0.0,
        );
        if (isSignInActive) {
          // Stop checking if location is found to be within 20m radius
          break;
        }
      }
    }

    setState(() {
      isVisible = false;
    });
  }

  @override
  void initState() {
    // activateSignIn();
    _getCurrentPosition();

    isSignedIn = BlocProvider.of<UserModelBloc>(context)
            .state
            .extraUserInformation
            ?.isSignedIn ??
        false;

    super.initState();
    bg.BackgroundGeolocation.onLocation(_onLocation);
    bg.BackgroundGeolocation.onMotionChange(_onMotionChange);
    bg.BackgroundGeolocation.onActivityChange(_onActivityChange);
    bg.BackgroundGeolocation.onProviderChange(_onProviderChange);
    bg.BackgroundGeolocation.onConnectivityChange(_onConnectivityChange);
    bg.BackgroundGeolocation.onGeofence(_onGeofence);
    bg.BackgroundGeolocation.onHttp(_onHttp);

    // 2.  Configure the plugin
    bg.BackgroundGeolocation.ready(bg.Config(
            desiredAccuracy: bg.Config.DESIRED_ACCURACY_NAVIGATION,
            autoSync: true,
            distanceFilter: 10.0,
            stopOnTerminate: false,
            stopTimeout: 5,
            startOnBoot: true,
            debug: true,
            enableHeadless: true,
            logLevel: bg.Config.LOG_LEVEL_VERBOSE,
            heartbeatInterval: 60,
            backgroundPermissionRationale: bg.PermissionRationale(
                title:
                    "Allow {applicationName} to access this device's location even when the app is closed or not in use.",
                message:
                    "This app collects location data to enable recording your trips to work and calculate distance-travelled.",
                positiveAction: 'Change to "{backgroundPermissionOptionLabel}"',
                negativeAction: 'Cancel'),
            reset: true))
        .then((bg.State state) {
      if (state.schedule!.isNotEmpty) {
        bg.BackgroundGeolocation.startSchedule();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Opacity(
                              opacity: isSignInActive ? 1.0 : 0.4,
                              child: AbsorbPointer(
                                absorbing: !isSignInActive,
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
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: AbsorbPointer(
                              absorbing: !isSignInActive,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.red[800],
                        size: 28,
                      ),
                      title: Text(
                        _location,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
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
                  ),
                ),
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
    if (!isSignedIn) {
      setState(() {
        isVisible = true;
      });
      bg.BackgroundGeolocation.start();
      bg.BackgroundGeolocation.changePace(true);

      geo
          .placemarkFromCoordinates(
        signInLatitude,
        signInLongitude,
      )
          .then((data) async {
        String address =
            "${data.first.name == null || data.first.name!.isEmpty ? '' : data.first.name! + ', '}${data.first.street == null || data.first.street!.isEmpty ? '' : data.first.street! + ', '}${data.first.subLocality == null || data.first.subLocality!.isEmpty ? '' : data.first.subLocality! + ', '}${data.first.locality == null || data.first.locality!.isEmpty ? '' : data.first.locality! + ', '}${data.first.subAdministrativeArea == null || data.first.subAdministrativeArea!.isEmpty ? '' : data.first.subAdministrativeArea! + ', '}${data.first.administrativeArea == null || data.first.administrativeArea!.isEmpty ? '' : data.first.administrativeArea! + ', '}${data.first.postalCode == null || data.first.postalCode!.isEmpty ? '' : data.first.postalCode! + ', '}${data.first.isoCountryCode == null || data.first.isoCountryCode!.isEmpty ? '' : data.first.isoCountryCode! + '.'}";
        await accessLogBloc.getInsertAccessLog(
          latitude: signInLatitude,
          longitude: signInLongitude,
          isSignIn: true,
          userId:
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          location: address,
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
              userModel:
                  BlocProvider.of<UserModelBloc>(context).state.userModel!,
              extraUserInformation: ExtraUserInformationModel(
                isSignedIn: true,
              ),
            ),
          );
        }
      });
    } else
      displaySnackBar(
          text:
              'You are already signed in. Please Sign Out before signing in again.',
          context: context);
  }

  void _handleSignOutOnClick() async {
    if (isSignedIn == true) {
      setState(() {
        isVisible = true;
      });
      bg.BackgroundGeolocation.changePace(false);
      bg.BackgroundGeolocation.stop();

      geo
          .placemarkFromCoordinates(
        signInLatitude,
        signInLongitude,
      )
          .then((data) async {
        String address =
            "${data.first.name == null || data.first.name!.isEmpty ? '' : data.first.name! + ', '}${data.first.street == null || data.first.street!.isEmpty ? '' : data.first.street! + ', '}${data.first.subLocality == null || data.first.subLocality!.isEmpty ? '' : data.first.subLocality! + ', '}${data.first.locality == null || data.first.locality!.isEmpty ? '' : data.first.locality! + ', '}${data.first.subAdministrativeArea == null || data.first.subAdministrativeArea!.isEmpty ? '' : data.first.subAdministrativeArea! + ', '}${data.first.administrativeArea == null || data.first.administrativeArea!.isEmpty ? '' : data.first.administrativeArea! + ', '}${data.first.postalCode == null || data.first.postalCode!.isEmpty ? '' : data.first.postalCode! + ', '}${data.first.isoCountryCode == null || data.first.isoCountryCode!.isEmpty ? '' : data.first.isoCountryCode! + '.'}";

        await accessLogBloc.getInsertAccessLog(
          latitude: signInLatitude,
          longitude: signInLongitude,
          isSignIn: false,
          userId:
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          location: address,
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
              userModel:
                  BlocProvider.of<UserModelBloc>(context).state.userModel!,
              extraUserInformation: ExtraUserInformationModel(
                isSignedIn: false,
              ),
            ),
          );
        }
      });
    } else {
      displaySnackBar(text: 'You have already signed out.', context: context);
    }
  }

  // background location flutter changes

  void _onLocation(bg.Location location) {
    print('[location] - $location');

    apicall(lat: location.coords.latitude, long: location.coords.longitude);
    signInLatitude = location.coords.latitude;
    signInLongitude = location.coords.longitude;
  }

  void _onMotionChange(bg.Location location) {
    print('[motionchange] - $location');
    apicall(lat: location.coords.latitude, long: location.coords.longitude);
    signInLatitude = location.coords.latitude;
    signInLongitude = location.coords.longitude;
  }

  void _onActivityChange(bg.ActivityChangeEvent event) {
    print('[activitychange] - $event');
  }

  void _onProviderChange(bg.ProviderChangeEvent event) {
    print('$event');
  }

  void _onConnectivityChange(bg.ConnectivityChangeEvent event) {
    print('$event.');
  }

  void _onHttp(bg.HttpEvent event) async {
    print('[${bg.Event.HTTP}] - $event');
  }

  void _onGeofence(bg.GeofenceEvent event) async {
    apicall(
        lat: event.location.coords.latitude,
        long: event.location.coords.longitude);
  }

  Future<void> apicall({required double lat, required long}) async {
    String url =
        "https://webapidev.aitalkx.com/taa/attendance/InsertEmployeeTracking";
    var client = http.Client();
    List<UserLocation> list = [
      UserLocation(
          userId:
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          trackingDate: DateTime.now().toIso8601String(),
          latitude: lat,
          longitude: long)
    ];
    try {
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(list.map((e) => e.toJson()).toList()));
      print(response);
    } finally {
      client.close();
    }
  }

  calculateDistance({
    double? latitude,
    double? longitude,
  }) {
    bool result = false;
    final double radius = 0.20;

    // Fetch current location
    final double distance = distanceBetween(
      signInLatitude,
      signInLongitude,
      latitude ?? 0.0,
      longitude ?? 0.0,
    );

    var distanceInkm = distance / 1000;
    distanceInkm < radius ? result = true : result = false;

    return result;
  }

  /// Calculate distance between 2 co-ordinates
  double distanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    var earthRadius = 6378137.0;
    var dLat = _toRadians(endLatitude - startLatitude);
    var dLon = _toRadians(endLongitude - startLongitude);

    var a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) *
            cos(_toRadians(startLatitude)) *
            cos(_toRadians(endLatitude));
    var c = 2 * asin(sqrt(a));

    return earthRadius * c;
  }

  static _toRadians(double degree) {
    return degree * pi / 180;
  }

  Future<void> _getCurrentPosition() async {
    await geolo.Geolocator.getCurrentPosition(
            desiredAccuracy: geolo.LocationAccuracy.high)
        .then((geolo.Position position) {
      signInLatitude = position.latitude;
      signInLongitude = position.longitude;
      activateSignIn();
      getUserAddressFromCoord();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  getUserAddressFromCoord() async {
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
      signInLatitude,
      signInLongitude,
    );

    geo.Placemark place = placemarks[0];
    print(place);

    _location =
        "${place.name == null || place.name!.isEmpty ? '' : place.name! + ', '}\n${place.street == null || place.street!.isEmpty ? '' : place.street! + ', '}${place.subLocality == null || place.subLocality!.isEmpty ? null : place.subLocality! + ', '}${place.locality == null || place.locality!.isEmpty ? null : place.locality! + ', '}\n${place.subAdministrativeArea == null || place.subAdministrativeArea!.isEmpty ? '' : place.subAdministrativeArea! + ', '}${place.administrativeArea == null || place.administrativeArea!.isEmpty ? '' : place.administrativeArea! + ', '}\n${place.postalCode == null || place.postalCode!.isEmpty ? '' : place.postalCode! + ', '}${place.isoCountryCode == null || place.isoCountryCode!.isEmpty ? '' : place.isoCountryCode! + '.'}";
  }
}
