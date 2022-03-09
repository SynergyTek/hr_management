import 'package:flutter/material.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({Key? key, this.errorMsg}) : super(key: key);
final String? errorMsg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.network_check,
              color: Theme.of(context).primaryColor,
              size: 60,
            ),
            Text(errorMsg!,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

graphqlErrorDisplay(result) {
  if (result.errors.toString().substring(0,20) ==
      "[Failed host lookup: "){//'manpowert.selfip.com': Undefined location]") {
    return NetworkErrorWidget(errorMsg: "No Internet Connection\n  Please try again Later.",);
  } else {
    return  NetworkErrorWidget(errorMsg: "Something went Wrong\n  Please try again Later.",);
  }
}
