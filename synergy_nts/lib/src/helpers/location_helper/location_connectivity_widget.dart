import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/location_bloc.dart';
import '../../../assets/image_path_constants.dart';
import '../../ui/widgets/widgets.dart';

class LocationConnectivityWidget extends StatelessWidget {
  final Widget child;

  const LocationConnectivityWidget({required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationLoadSuccessState) {
          return child;
        }

        return Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(CONNECT_TO_LOCATION_IMAGE),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Please enable to Location to continue.",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),

                //
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
