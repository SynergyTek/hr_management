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
            Flexible(child: Text(subtitle ?? "")),
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
        backgroundImage: NetworkImage(
          APIEndpointConstants.PROFILE_PICTURE_ENDPOINT + profilePicturePath,
        )
        // CachedNetworkImage(
        //   imageUrl:
        //       APIEndpointConstants.PROFILE_PICTURE_ENDPOINT + profilePicturePath,
        //   imageBuilder: (context, imageProvider) => Container(
        //     width: 120.0,
        //     height: 120.0,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        //     ),
        //   ),
        //   placeholder: (context, url) => CircularProgressIndicator(
        //     backgroundColor: LightTheme().lightThemeData().primaryColor,
        //   ),
        //   errorWidget: (context, url, error) => Icon(Icons.error),
        // ),
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
          Text(
            data.personNo ?? '',
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
                title: data.personNo,
                subtitle: "Person No",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.personFullName,
                subtitle: "Person Full Name",
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
                title: data.personalEmail,
                subtitle: "Personal Email ",
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _personalDetailsWidget({
  required BuildContext context,
  required EmployeeProfileModel data,
}) {
  return ExpansionTile(
    initiallyExpanded: false,
    title: Text("Personal Details"),
    leading: Icon(Icons.work_outline),
    children: [
      Container(
        padding: DEFAULT_PADDING,
        alignment: Alignment.topRight,
        child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(
                  context,
                  ADD_EDIT_NOTE_ROUTE,
                  arguments: ScreenArguments(
                    arg1: "HRPerson",
                    arg2: data.personNoteId,
                    arg3: "",
                    val1: false,
                    // portalType: PortalType.hr,
                  ),
                ),
            child: Text('Edit')),
      ),
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.title,
                subtitle: "Title ",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.personFullName,
                subtitle: "Person Full Name ",
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
                title: "Male",
                subtitle: "Gender ",
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
                title: data.nationalityName,
                subtitle: "Nationality Name ",
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
                title: "Single",
                subtitle: "Marital Status ",
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
                subtitle: "Religion ",
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
                    .format(data.dateOfBirth ?? "" as DateTime)
                    .toString(),
                subtitle: "Date of Birth",
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
                title: data.personalEmail,
                subtitle: "Personal Email ",
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
                title: data.contactCountryName,
                subtitle: "Contact Country Name ",
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
                title:
                    '${data.emergencyContactCountryDialCode1} ${data.mobile}',
                subtitle: "Mobile",
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
                subtitle: "Unit Number",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.presentBuildingNumber ?? '-',
                subtitle: "Building Number",
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
                subtitle: "Street Name",
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
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
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
                subtitle: "Unit Number",
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.homeBuildingNumber ?? '-',
                subtitle: "Building Number",
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
                subtitle: "Street Name",
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
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
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
    ],
  );
}

Widget _emergencyContactInfo1Widget({
  required BuildContext context,
  required EmployeeProfileModel data,
}) {
  return ExpansionTile(
    initiallyExpanded: false,
    title: Text("Emergency Contact Info 1"),
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
                subtitle: "Emergency Contact Name1 ",
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
                title: data.emergencyContactCountryName1 ?? '-',
                subtitle: "Emergency Contact Country Name1 ",
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
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.emergencyContactCountryDialCode1 ??
                    '' + ' ' + data.emergencyContactNo1!,
                subtitle: "Emergency Contact No1 ",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.relationship1 ?? '-',
                subtitle: "Relationship1",
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
    title: Text("Emergency Contact Info 2"),
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
                subtitle: "Emergency Contact Name2 ",
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
                title: data.emergencyContactCountryName2 ?? '-',
                subtitle: "Emergency Contact Country Name2 ",
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
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.emergencyContactCountryDialCode1! +
                    ' ' +
                    data.emergencyContactNo2!,
                subtitle: "Emergency Contact No2 ",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.relationship2 ?? '-',
                subtitle: "Relationship2",
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _assignmentWidget({
  required BuildContext context,
  required EmployeeProfileModel data,
}) {
  return ExpansionTile(
    initiallyExpanded: false,
    title: Text("Assignment"),
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
                subtitle: "Department ",
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
                title: data.emergencyContactCountryName2 ?? '-', //TODO
                subtitle: "AssignmentGrade ",
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
      Container(
        padding: DEFAULT_PADDING,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.emergencyContactCountryDialCode1! +
                    ' ' +
                    data.emergencyContactNo2!,
                subtitle: "Job ",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.relationship2 ?? '-',
                subtitle: "AssignmentType ",
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
                title: data.emergencyContactCountryDialCode1! +
                    ' ' +
                    data.emergencyContactNo2!,
                subtitle: "Position ",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.relationship2 ?? '-',
                subtitle: "AssignmentStatus ",
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
                title: data.emergencyContactCountryDialCode1! +
                    ' ' +
                    data.emergencyContactNo2!,
                subtitle: "Location ",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.relationship2 ?? '-',
                subtitle: "DateOfJoin ",
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
                title: data.emergencyContactCountryDialCode1! +
                    ' ' +
                    data.emergencyContactNo2!,
                subtitle: "ProbationPeriod ",
                icon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 18.0,
                ),
              ),
            ),
            Expanded(
              child: _statisticWidget(
                context: context,
                title: data.relationship2 ?? '-',
                subtitle: "NoticePeriod ",
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _hrContactWidget({
  required BuildContext context,
}) {
  return StreamBuilder<HrDirectContractResponseModel?>(
    stream: resignationTerminationBloc.subjectHrDirectContract.stream,
    builder: (BuildContext context,
        AsyncSnapshot<HrDirectContractResponseModel?> snapshot) {
      if (snapshot.hasData) {
        HrDirectContractModel? hrDirectContractModel;
        hrDirectContractModel = snapshot.data?.mapdata;

        return ExpansionTile(
          leading: Icon(
            Icons.work_outline,
          ),
          title: Text(
            'Contract',
          ),
          children: [
            Container(
              padding: DEFAULT_PADDING,
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  ADD_EDIT_NOTE_ROUTE,
                  arguments: ScreenArguments(
                      arg2: hrDirectContractModel?.noteId,
                      arg1: "",
                      arg3: "",
                      val1: false),
                ),
                child: Text('Manage Contract'),
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
                      title: hrDirectContractModel?.contractType,
                      subtitle: "ContractType ",
                      icon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: _statisticWidget(
                      context: context,
                      title: hrDirectContractModel?.sponsorName,
                      subtitle: "Sponsor ",
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
                      title: hrDirectContractModel?.annualLeaveEntitlement,
                      subtitle: "AnnualLeaveEntitlement ",
                      icon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: _statisticWidget(
                      context: context,
                      title: hrDirectContractModel?.contractRenewable,
                      subtitle: "ContractRenewable ",
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      } else {
        return Center(
          child: CustomProgressIndicator(),
        );
      }
    },
  );
  // return widget(
  //   child:

  //   ExpansionTile(
  //     initiallyExpanded: false,
  //     title: Text("HR Contract"),
  //     leading: Icon(Icons.phone),
  //     children: [
  //       Container(
  //         padding: DEFAULT_PADDING,
  //         child: Row(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Expanded(
  //               child: _statisticWidget(
  //                 context: context,
  //                 title: data.emergencyContactName2 ?? '-',
  //                 subtitle: "Emergency Contact Name2 ",
  //                 icon: Icon(
  //                   Icons.person,
  //                   color: Colors.grey,
  //                   size: 18.0,
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: _statisticWidget(
  //                 context: context,
  //                 title: data.emergencyContactCountryName2 ?? '-',
  //                 subtitle: "Emergency Contact Country Name2 ",
  //                 icon: Icon(
  //                   Icons.location_pin,
  //                   color: Colors.grey,
  //                   size: 18.0,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         padding: DEFAULT_PADDING,
  //         child: Row(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Expanded(
  //               child: _statisticWidget(
  //                 context: context,
  //                 title: data.emergencyContactCountryDialCode1! +
  //                     ' ' +
  //                     data.emergencyContactNo2!,
  //                 subtitle: "Emergency Contact No2 ",
  //                 icon: Icon(
  //                   Icons.phone,
  //                   color: Colors.grey,
  //                   size: 18.0,
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: _statisticWidget(
  //                 context: context,
  //                 title: data.relationship2 ?? '-',
  //                 subtitle: "Relationship2",
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}
