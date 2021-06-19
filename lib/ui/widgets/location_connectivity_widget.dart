import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/image_path_constants.dart';
import '../../logic/blocs/location_bloc/location_bloc.dart';
import '../../themes/theme_config.dart';

class LocationConnectivityWidget extends StatelessWidget {
  final Widget child;

  const LocationConnectivityWidget({
    @required this.child,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
