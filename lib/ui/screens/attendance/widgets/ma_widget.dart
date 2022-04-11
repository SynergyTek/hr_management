import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/access_log/access_log_response.dart';
import 'package:hr_management/data/models/login_models/extra_user_information_model.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/blocs/access_log_bloc/access_log_bloc.dart';
import '../../../../logic/blocs/location_bloc/location_bloc.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';

class MAWidget extends StatefulWidget {
  MAWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MAWidget> createState() => _MAWidgetState();
}

class _MAWidgetState extends State<MAWidget> {
  bool isLoading = false;
  bool? isSignedIn;

  @override
  void initState() {
    isSignedIn = BlocProvider.of<UserModelBloc>(context)
            .state
            .extraUserInformation
            ?.isSignedIn ??
        false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserModelBloc, UserModelState>(
      builder: (context, userstate) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logged in as Widget:
            _userCardWidget(userstate),

            //
            SizedBox(height: 5.h),

            Visibility(
              visible: isLoading,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

            //
            Visibility(
              visible: !isSignedIn!,
              child: Center(
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
                      onTap: () => _handleSignInOnClick(userstate),
                    ),
                    Text("Sign In", style: TextStyle(color: Colors.green))
                  ],
                ),
              ),
            ),

            //
            Visibility(
              visible: isSignedIn!,
              child: Center(
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
                      onTap: () => _handleSignOutOnClick(userstate),
                    ),
                    Text("Sign Out", style: TextStyle(color: Colors.red))
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _userCardWidget(UserModelState state) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      tileColor: Theme.of(context).textHeadingColor,
      title: Text(
        state.userModel?.jobTitle ?? '-',
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        state.userModel?.email ?? '-',
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.white,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 24,
        child: Icon(
          Icons.person,
          color: Theme.of(context).textHeadingColor,
        ),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Status",
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.white,
            ),
          ),
          Text(
            BlocProvider.of<UserModelBloc>(context)
                        .state
                        .extraUserInformation
                        ?.isSignedIn ==
                    true
                ? "Signed In"
                : "Signed Out",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  calculateDistance() {
    bool result = false;

    // The proximity radius (in kilometers)
    final double radius = 0.25;

    // Google office coordinates:
    // var officeLatitude = 34.09934;
    // var officeLongitude = 74.8139167;

    // Chuna Bhatti coordinates:
    var officeLatitude = 23.201535;
    var officeLongitude = 77.4149217;

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

  void _handleSignOutOnClick(UserModelState userModelState) async {
    // If user is already logged in return
    if (isSignedIn == false) {
      displaySnackBar(
        context: context,
        text: "You are already signed out.",
      );
      return;
    }

    /// Check first whether the user has provided the required permissions and also
    /// Whether the location services are on.
    // await _checkLocationService();

    if (calculateDistance() == false) {
      displaySnackBar(
        context: context,
        text: 'Failure: You are not in the proximity of the office.',
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    AccessLogResponse response = await accessLogBloc.getInsertAccessLog(
      isSignIn: false,
      userId: BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    );

    // Handle error
    if (response.error != null && response.error!.isNotEmpty) {
      displaySnackBar(
        context: context,
        text: "An error occurred, please try again later.",
      );
    } else if (response.isSignIn == 1) {
      BlocProvider.of<UserModelBloc>(context).add(
        UserModelChangeEvent(
          userModel: userModelState.userModel!,
          extraUserInformation: ExtraUserInformationModel(
            // portalType: PortalType.hr,
            isSignedIn: response.isSignIn == 1 &&
                    (response.error == null || response.error!.isEmpty)
                ? false
                : true,
          ),
        ),
      );

      setState(() {
        isSignedIn = response.isSignIn == 1 &&
                (response.error == null || response.error!.isEmpty)
            ? false
            : true;
      });
    }

    setState(() {
      isLoading = false;
    });

    displaySnackBar(
      context: context,
      text: response.isSignIn == 1 &&
              (response.error == null || response.error!.isEmpty)
          ? "Sign out successful!"
          : "An error occured please try again later.",
    );
  }

  void _handleSignInOnClick(UserModelState userModelState) async {
    // If user is already logged in return
    if (isSignedIn == true) {
      displaySnackBar(
        context: context,
        text: "You are already signed in.",
      );
      return;
    }

    /// Check first whether the user has provided the required permissions and also
    /// Whether the location services are on.
    // await _checkLocationService();

    if (calculateDistance() == false) {
      displaySnackBar(
        context: context,
        text: 'Failure: You are not in the proximity of the office.',
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    AccessLogResponse response = await accessLogBloc.getInsertAccessLog(
      isSignIn: true,
      userId: BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    );

    // Handle error
    if (response.error != null && response.error!.isNotEmpty) {
      displaySnackBar(
        context: context,
        text: "An error occurred, please try again later.",
      );
    } else if (response.isSignIn == 0) {
      BlocProvider.of<UserModelBloc>(context).add(
        UserModelChangeEvent(
          userModel: userModelState.userModel!,
          extraUserInformation: ExtraUserInformationModel(
            // portalType: PortalType.hr,
            isSignedIn: response.isSignIn == 0 &&
                    (response.error == null || response.error!.isEmpty)
                ? true
                : false,
          ),
        ),
      );

      setState(() {
        isSignedIn = response.isSignIn == 0 &&
                (response.error == null || response.error!.isEmpty)
            ? true
            : false;
      });
    }

    setState(() {
      isLoading = false;
    });

    displaySnackBar(
      context: context,
      text: response.isSignIn == 0 &&
              (response.error == null || response.error!.isEmpty)
          ? "Sign in successful!"
          : "An error occured please try again later.",
    );
  }
}
