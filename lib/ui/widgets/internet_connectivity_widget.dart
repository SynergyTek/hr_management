import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/image_path_constants.dart';
import '../../logic/blocs/internet_bloc/internet_bloc.dart';
import '../../themes/theme_config.dart';

class InternetConnectivityWidget extends StatelessWidget {
  final Widget child;

  const InternetConnectivityWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetDisconnectedState) {
          return Center(
            child: Container(
              padding: DEFAULT_LARGE_HORIZONTAL_PADDING,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(CONNECT_TO_INTERNET_IMAGE),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Please connect to Internet to continue.",
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
        } else if (state is InternetConnectedState) {
          return child;
        }
        return Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Please ensure you're connected to the internet.",
            ),
          ],
        ));
      },
    );
  }
}
