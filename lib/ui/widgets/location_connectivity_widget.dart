import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/image_path_constants.dart';
import '../../logic/blocs/location_bloc/location_bloc.dart';
import '../../themes/theme_config.dart';
import 'primary_button.dart';

class LocationConnectivityWidget extends StatelessWidget {
  final Widget child;

  const LocationConnectivityWidget({
    required this.child,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationLoadSuccessState) {
          return child;
        }

        return Center(
          child: Container(
            padding: DEFAULT_LARGE_HORIZONTAL_PADDING,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(CONNECT_TO_LOCATION_IMAGE),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Please enable to Location to continue.",
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                PrimaryButton(
                  buttonText: "Enable Location service",
                  handleOnPressed: () async {
                    // Checking whether the Location Permissions are not given.
                    await context
                        .read<LocationBloc>()
                        .checkForLocationPermission();

                    // Asking for Location Service.
                    bool isLocationEnabled = await context
                        .read<LocationBloc>()
                        .isLocationServiceEnabled();

                    if (!!isLocationEnabled) {
                      print(isLocationEnabled);
                      context.read<LocationBloc>().add(LocationStartedEvent());
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
