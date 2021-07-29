import 'package:flutter/material.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/data/models/employee_profile_models/employee_profile_model.dart';
import 'package:hr_management/data/models/employee_profile_models/employee_profile_response.dart';
import 'package:hr_management/logic/blocs/employee_profile_bloc/employee_profile_bloc.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

class MyProfileBody extends StatefulWidget {
  const MyProfileBody({Key key}) : super(key: key);

  @override
  _MyProfileBodyState createState() => _MyProfileBodyState();
}

class _MyProfileBodyState extends State<MyProfileBody> {
  EmployeeProfileModel employeeProfile;
  @override
  void initState() {
    super.initState();
    employeeProfileBloc..getEmployeeProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EmployeeProfileResponse>(
        stream: employeeProfileBloc.subjectEmployeeProfile.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            employeeProfile = snapshot.data.data;
            return SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          APIEndpointConstants.BASE_URL +
                              '/common/query/GetFile?fileId=' +
                              employeeProfile.photoName,
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(employeeProfile.personFullName,
                      style: TextStyle(fontSize: 25, color: Colors.grey[900])),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //     height: 25,
                      //     child: VerticalDivider(color: Colors.black)),
                      Text(
                        employeeProfile.personalEmail,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      employeeProfile.locationName,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //ExpansionTile(title: Text("Personal Details")),

                  createDataRow("Gender:",
                      employeeProfile.gender == 0 ? 'Male' : 'Female'),
                  createDataRow(
                      "Nationality Name:", employeeProfile.nationalityName),
                  createDataRow("Marital Status:",
                      employeeProfile.maritalStatus.toString()),
                  createDataRow(
                    "Religion:",
                    employeeProfile.religion,
                  ),
                  createDataRow(
                      "Date Of Birth:", employeeProfile.dateOfBirth.toString()),

                  createDataRow("Mobile:", employeeProfile.mobile.toString()),
                  SizedBox(height: 20),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      // collapsedBackgroundColor: Colors.grey[350],
                      title: Text(
                        "Job Details",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: Colors.grey[100],
                            child: Column(
                              children: [
                                createDataRow(
                                    "Person No:", employeeProfile.personNo),
                                createDataRow(
                                    "Grade Name:", employeeProfile.gradeName),
                                createDataRow("Organization Name:",
                                    employeeProfile.organizationName),
                                createDataRow(
                                    "Job Name:", employeeProfile.jobName),
                                createDataRow("Position Name:",
                                    employeeProfile.positionName),
                                createDataRow("Assignment Type Name:",
                                    employeeProfile.assignmentTypeName),
                                createDataRow("Date Of Join:",
                                    employeeProfile.dateOfJoin.toString()),
                                createDataRow("Location Name:",
                                    employeeProfile.locationName),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      // collapsedBackgroundColor: Colors.grey[350],
                      title: Text(
                        "Present Country Address",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: Colors.grey[100],
                            child: Column(
                              children: [
                                createDataRow("Unit Number:",
                                    employeeProfile.presentUnitNumber),
                                createDataRow("Building Number:",
                                    employeeProfile.presentBuildingNumber),
                                createDataRow("Street Name:",
                                    employeeProfile.presentStreetName),
                                createDataRow(
                                    "City:", employeeProfile.presentCity),
                                createDataRow("Postal Code:",
                                    employeeProfile.presentPostalCode),
                                createDataRow("Additional Number:",
                                    employeeProfile.presentAdditionalNumber),
                                createDataRow("Country Name:",
                                    employeeProfile.presentCountryName),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      //   collapsedBackgroundColor: Colors.grey[350],
                      title: Text(
                        "Home Country Address",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: Colors.grey[100],
                            child: Column(children: [
                              createDataRow("Unit Number:",
                                  employeeProfile.homeUnitNumber),
                              createDataRow("Building Number:",
                                  employeeProfile.homeBuildingNumber),
                              createDataRow("Street Name:",
                                  employeeProfile.homeStreetName),
                              createDataRow("City:", employeeProfile.homeCity),
                              createDataRow("Postal Code:",
                                  employeeProfile.homePostalCode),
                              createDataRow("Additional Number:",
                                  employeeProfile.homeAdditionalNumber),
                              createDataRow("Country Name:",
                                  employeeProfile.homeCountryName)
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      //  collapsedBackgroundColor: Colors.grey[350],
                      title: Text(
                        "Emergency Contact Info 1",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: Colors.grey[100],
                            child: Column(children: [
                              createDataRow("Emergency Contact Name 1:",
                                  employeeProfile.emergencyContactName1),
                              createDataRow("Emergency Contact Country Name 1:",
                                  employeeProfile.emergencyContactCountryName1),
                              createDataRow("Emergency Contact No 1:",
                                  employeeProfile.emergencyContactNo1),
                              createDataRow("Relationship 1:",
                                  employeeProfile.relationship1)
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      //  collapsedBackgroundColor: Colors.grey[350],
                      title: Text(
                        "Emergency Contact Info 2",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: Colors.grey[100],
                            child: Column(children: [
                              createDataRow("Emergency Contact Name 2:",
                                  employeeProfile.emergencyContactName2),
                              createDataRow("Emergency Contact Country Name 2:",
                                  employeeProfile.emergencyContactCountryName2),
                              createDataRow("Emergency Contact No 2:",
                                  employeeProfile.emergencyContactNo2),
                              createDataRow("Relationship 2:",
                                  employeeProfile.relationship2)
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        });
  }

  Widget createDataRow(text, value) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 15),
        )),
        Flexible(
          child: Text(
            value,
            overflow: TextOverflow.fade,
            maxLines: 5,
            softWrap: true,
            style: TextStyle(fontSize: 15),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
