part of './my_profile_body_widget.dart';

Widget _statisticWidget({
  required BuildContext context,
  String? title,
  String? subtitle,
  Widget? icon,
}) {
  return Container(
    padding: DEFAULT_HORIZONTAL_PADDING,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title ?? 'NA',
          style: TextStyle(
            // fontSize: Theme.of(context).textTheme.headline6.fontSize,
            color: Theme.of(context).textHeadingColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(subtitle ?? ""),
            // SizedBox(width: 8.0),
            // icon ?? Container(),
          ],
        ),
      ],
    ),
  );
}

Widget _profilePicture({
  required String profilePicturePath,
}) {
  return Container(
    padding: DEFAULT_LARGE_HORIZONTAL_PADDING,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 64.0,
      child: CachedNetworkImage(
        imageUrl:
            APIEndpointConstants.PROFILE_PICTURE_ENDPOINT + profilePicturePath,
        imageBuilder: (context, imageProvider) => Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    ),
  );
}

Widget _profileInformation({
  required EmployeeProfileModel data,
  required BuildContext context,
}) {
  return Expanded(
    child: ListTile(
      title: Text(
        data.personFullName ?? '',
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16.0,
            ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.personalEmail ?? '',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            data.mobile ?? '',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    ),
  );
}

Widget _basicInformationWidget({
  required BuildContext context,
  required EmployeeProfileModel data,
}) {
  return ExpansionTile(
    initiallyExpanded: true,
    title: Text("Basic Information"),
    leading: Icon(Icons.info_outline),
    children: [
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: "Male",
                subtitle: "Gender",
                // icon: Icon(
                //   Icons.person,
                //   color: Colors.grey,
                //   size: 18.0,
                // ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.religion,
                subtitle: "Religion",
                // icon: Icon(
                //   Icons.person,
                //   color: Colors.grey,
                //   size: 18.0,
                // ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.locationName,
                subtitle: "Location",
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.dateOfBirth == null
                    ? 'NA'
                    : DateFormat.yMMMMd().format(data.dateOfBirth!).toString(),
                subtitle: "D.O.B.",
                icon: Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.nationalityName,
                subtitle: "Nationality",
                // icon: Icon(
                //   Icons.person,
                //   color: Colors.grey,
                //   size: 18.0,
                // ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _jobDetailsWidget({
  required BuildContext context,
  required EmployeeProfileModel data,
}) {
  return ExpansionTile(
    initiallyExpanded: false,
    title: Text("Job Details"),
    leading: Icon(Icons.work_outline),
    children: [
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.personNo,
                subtitle: "Person #",
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.gradeName,
                subtitle: "Grade",
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.jobName,
                subtitle: "Job Name",
                // icon: Icon(
                //   Icons.person,
                //   color: Colors.grey,
                //   size: 18.0,
                // ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.organizationName,
                subtitle: "Organisation Name",
                // icon: Icon(
                //   Icons.person,
                //   color: Colors.grey,
                //   size: 18.0,
                // ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: DateFormat.yMMMMd()
                        .format(data.dateOfJoin ?? "" as DateTime)
                        .toString() ??
                    'NA',
                subtitle: "Date of Joining",
                icon: Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.assignmentTypeName,
                subtitle: "Assignment",
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _presentCountryAddressWidget({
  required BuildContext context,
  required EmployeeProfileModel data,
}) {
  return ExpansionTile(
    initiallyExpanded: false,
    title: Text("Present Country Address"),
    leading: Icon(Icons.location_pin),
    children: [
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.presentUnitNumber ?? '-',
                subtitle: "Unit #",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.presentBuildingNumber ?? '-',
                subtitle: "Building #",
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.presentStreetName ?? '-',
                subtitle: "Street",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.presentCity ?? '-',
                subtitle: "City",
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.presentPostalCode ?? '-',
                subtitle: "Postal Code",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.presentCountryName ?? '-',
                subtitle: "Country",
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.presentAdditionalNumber ?? '-',
                subtitle: "Additional Number",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _homeCountryAddressWidget({
  required BuildContext context,
  required EmployeeProfileModel data,
}) {
  return ExpansionTile(
    initiallyExpanded: false,
    title: Text("Home Country Address"),
    leading: Icon(Icons.location_pin),
    children: [
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.homeUnitNumber ?? '-',
                subtitle: "Unit #",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.homeBuildingNumber ?? '-',
                subtitle: "Building #",
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.homeStreetName ?? '-',
                subtitle: "Street",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.homeCity ?? '-',
                subtitle: "City",
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.homePostalCode ?? '-',
                subtitle: "Postal Code",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.homeCountryName ?? '-',
                subtitle: "Country",
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.homeAdditionalNumber ?? '-',
                subtitle: "Additional Number",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _emergencyContactInfo1Widget({
  required BuildContext context,
  required EmployeeProfileModel data,
}) {
  return ExpansionTile(
    initiallyExpanded: false,
    title: Text("Emergency Contact #1"),
    leading: Icon(Icons.phone),
    children: [
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.emergencyContactName1 ?? '-',
                subtitle: "Name",
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.emergencyContactCountryDialCode1! +
                    ' ' +
                    data.emergencyContactNo1!,
                subtitle: "Number",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.relationship1 ?? '-',
                subtitle: "Relationship",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.emergencyContactCountryName1 ?? '-',
                subtitle: "Country",
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _emergencyContactInfo2Widget({
  required BuildContext context,
  required EmployeeProfileModel data,
}) {
  return ExpansionTile(
    initiallyExpanded: false,
    title: Text("Emergency Contact #2"),
    leading: Icon(Icons.phone),
    children: [
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.emergencyContactName2 ?? '-',
                subtitle: "Name",
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.emergencyContactCountryDialCode1! +
                    ' ' +
                    data.emergencyContactNo2!,
                subtitle: "Number",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.relationship2 ?? '-',
                subtitle: "Relationship",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.emergencyContactCountryName2 ?? '-',
                subtitle: "Country",
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
