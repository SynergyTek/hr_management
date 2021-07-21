import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../data/enums/enums.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../../data/helpers/showup.dart';

Widget buildTile(
    {String status,
    Color bgColor,
    BuildContext context,
    String moduleName,
    String tabName,
    int value,
    bool isTile,
    NTSType ntsType,
    Image image,
    String mode}) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
          child: isTile
              ? worklistTileWidget(
                  bgColor: bgColor,
                  value: value,
                  status: status,
                  ntsType: ntsType,
                  image: image,
                  context: context,
                  mode: mode,
                  moduleName: moduleName)
              : worklistHeading(status: status)));
}

Widget worklistTileWidget(
    {Color bgColor,
    int value,
    String status,
    String moduleName,
    String mode,
    NTSType ntsType,
    BuildContext context,
    Image image}) {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Center(
              child: Stack(
                children: [
                  image,
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        value.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: bgColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                    delay: 100,
                  )
                ],
              ),
            ),
            // child: Material(
            //     color: bgColor,
            //     shape: CircleBorder(),
            //     child: Padding(
            //         padding: EdgeInsets.all(16.0),
            //         child: ShowUp(
            //           child: Text(
            //             value.toString(),
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 15.0),
            //           ),
            //           delay: 100,
            //         ))),
            onTap: () {
              if (ntsType == NTSType.task) {
                if (status == "Overdue") {
                  status = "NOTE_STATUS_OVERDUE";
                } else if (status == "Completed") {
                  status = "NOTE_STATUS_COMPLETE";
                } else if (status == 'Pending') {
                  status = 'NOTE_STATUS_INPROGRESS';
                } else if (status == 'Draft') {
                  status = 'NOTE_STATUS_DRAFT';
                }
                Navigator.pushNamed(
                  context,
                  TASK_HOME,
                  arguments: ScreenArguments(
                      arg1: status, arg2: moduleName, arg3: mode),
                );
              } else if (ntsType == NTSType.service) {
                if (status == "Overdue") {
                  status = "SERVICE_STATUS_OVERDUE";
                } else if (status == "Completed") {
                  status = "SERVICE_STATUS_COMPLETE";
                } else if (status == 'Pending') {
                  status = 'SERVICE_STATUS_INPROGRESS';
                } else if (status == 'Draft') {
                  status = 'SERVICE_STATUS_DRAFT';
                }
                Navigator.pushNamed(
                  context,
                  SERVICE_HOME,
                  arguments: ScreenArguments(
                      arg1: status, arg2: moduleName, arg3: mode),
                );
                // Navigator.pushNamed(
                //   context,
                //   SERVICE_HOME,
                // );
              } else if (ntsType == NTSType.note) {
                if (status == "Overdue") {
                  status = "TASK_STATUS_OVERDUE";
                } else if (status == "Completed") {
                  status = "TASK_STATUS_COMPLETE";
                } else if (status == 'Pending') {
                  status = 'TASK_STATUS_INPROGRESS';
                } else if (status == 'Draft') {
                  status = 'TASK_STATUS_DRAFT';
                }
                Navigator.pushNamed(
                  context,
                  NOTE_HOME,
                  arguments: ScreenArguments(
                      arg1: status, arg2: moduleName, arg3: mode),
                );
              }
            },
          ),
          Padding(padding: EdgeInsets.only(bottom: 7.0)),
          Text(status,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0)),
        ]),
  );
}

Widget worklistHeading({String status}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: InkWell(
                  child: Text(status,
                      style: TextStyle(color: Colors.black87, fontSize: 20
                          // decoration: TextDecoration.underline
                          )),
                  onTap: () {}),
            ),
            // ShowUp(
            //   child: Text('10',
            //       style: TextStyle(
            //           color: Colors.black87,
            //           fontWeight: FontWeight.w700,
            //           fontSize: 30.0)),
            //   delay: 100,
            // ),
          ],
        ),
        // Material(
        //     color: Colors.blue,
        //     borderRadius: BorderRadius.circular(24.0),
        //     child: Center(
        //         child: Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Icon(Icons.person, color: Colors.white, size: 30.0),
        //     )))
      ]);
}
