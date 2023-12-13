import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/image_path_constants.dart';
import '../internet_bloc.dart';

class InternetConnectivityWidget extends StatelessWidget {
  final Widget child;

  const InternetConnectivityWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetDisconnectedState) {
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(CONNECT_TO_INTERNET_IMAGE),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    "Please connect to Internet to continue.",
                    style: TextStyle(
                      color: Colors.blue,
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
        return const Center(
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
