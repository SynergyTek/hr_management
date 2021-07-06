import 'package:flutter/material.dart';
import 'package:hr_management/data/models/access_log/access_log_model.dart';
import 'package:hr_management/themes/theme_config.dart';

class AccessLogBottomSheetWidget extends StatelessWidget {
  final AccessLogModel eachAccessLogModelElement;

  const AccessLogBottomSheetWidget({
    @required this.eachAccessLogModelElement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            16.0,
          ),
          topRight: Radius.circular(
            16.0,
          ),
        ),
      ),
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // For basic details:
          ListTile(
            title: Text(
              eachAccessLogModelElement?.personFullName ?? '',
            ),
            subtitle: Text(
              eachAccessLogModelElement?.personId ?? 'NA',
              style: TextStyle(
                color: Theme.of(context).textHeadingColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  eachAccessLogModelElement?.devicePunchingTypeText ?? 'NA',
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Status"),
              ],
            ),
          ),

          // For the Punching time
          ListTile(
            title: Text(
              "Punching Time",
              // style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              eachAccessLogModelElement?.punchingTime ?? 'NA',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          // For Sponsorship Number
          ListTile(
            title: Text(
              "Sponsorship Number",
              // style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              eachAccessLogModelElement?.sponsorshipNo ?? 'NA',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          // For Biomeric ID and Device name
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    "Device name",
                    // style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    eachAccessLogModelElement?.deviceName ??
                        'NA' +
                            '(${eachAccessLogModelElement?.deviceIpAddress ?? 'NA'})',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    "Biometric ID",
                    // style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    eachAccessLogModelElement?.biometricId ?? 'NA',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),

          // For Sign In Location.
          ListTile(
            title: Text(
              "Sign In Location",
              // style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              eachAccessLogModelElement?.signInLocation ?? 'NA',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
