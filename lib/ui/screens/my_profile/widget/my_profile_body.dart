import 'package:flutter/material.dart';
import 'package:hr_management/data/models/employee_profile_models/employee_profile_response.dart';
import 'package:hr_management/data/models/udf_json_model/udf_json_model.dart';
import 'package:hr_management/logic/blocs/employee_profile_bloc/employee_profile_bloc.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

class MyProfileBody extends StatefulWidget {
  const MyProfileBody({Key key}) : super(key: key);

  @override
  _MyProfileBodyState createState() => _MyProfileBodyState();
}

class _MyProfileBodyState extends State<MyProfileBody> {
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
            return SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 70,
                      child: Icon(
                        Icons.person,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Jack Dorsey",
                      style: TextStyle(fontSize: 25, color: Colors.grey[900])),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "@jackdorsey",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                          height: 25,
                          child: VerticalDivider(color: Colors.black)),
                      Text(
                        "dorsey.com",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "United Arab Emirates",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //ExpansionTile(title: Text("Personal Details")),

                  createDataRow("Gender:", "Male"),
                  createDataRow("Nationality Name:", "American"),
                  createDataRow("Marital Status:", "Single"),
                  createDataRow("Religion:", "Christian"),
                  createDataRow("Date Of Birth:", "01.05.2000"),

                  createDataRow("Mobile:", "+44 9878987899"),
                  SizedBox(height: 20),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey[350],
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
                              createDataRow("Person No:", "P991"),
                              createDataRow("Grade Name:", "Grade 10"),
                              createDataRow(
                                  "Organization Name:", "Admin Department"),
                              createDataRow("Job Name:", "Human Resource"),
                              createDataRow(
                                  "Position Name:", "Admin Dept GM_1"),
                              createDataRow(
                                  "Assignment Type Name:", "Full Time"),
                              createDataRow("Date Of Join:", "01.06.2021"),
                              createDataRow("Location Name:", "Bur Dubai"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey[350],
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
                              createDataRow("Unit Number:", "12"),
                              createDataRow("Building Number:", "35"),
                              createDataRow("Street Name:", "Rich Street"),
                              createDataRow("City:", "Belburn"),
                              createDataRow("Postal Code:", "608102"),
                              createDataRow("Additional Number:", "9876543210"),
                              createDataRow("Country Name:", "United Kingdom"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey[350],
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
                            createDataRow("Unit Number:", "89"),
                            createDataRow("Building Number:", "115"),
                            createDataRow("Street Name:", "Alice Alan Street"),
                            createDataRow("City:", "Shark"),
                            createDataRow("Postal Code:", "609876"),
                            createDataRow("Additional Number:", "9768587654"),
                            createDataRow("Country Name:", "United Kingdom")
                          ]),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey[350],
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
                            createDataRow("Emergency Contact Name 1:", "Ben"),
                            createDataRow("Emergency Contact Country Name 1:",
                                "United Kingdom"),
                            createDataRow(
                                "Emergency Contact No 1:", "+44 90000890987"),
                            createDataRow("Relationship 1:", "Daughter")
                          ]),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey[350],
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
                            createDataRow("Emergency Contact Name 2:", "Peter"),
                            createDataRow("Emergency Contact Country Name 2:",
                                "United Kingdom"),
                            createDataRow(
                                "Emergency Contact No 2:", "+44 8798765432"),
                            createDataRow("Relationship 2:", "Father")
                          ]),
                        ),
                      ),
                    ],
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
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 18),
        )),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
