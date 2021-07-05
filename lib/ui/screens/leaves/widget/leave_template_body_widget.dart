import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:location/location.dart';
import '../../../../data/models/leave_models/leave_res_model.dart';
import '../../../../data/models/leave_models/leave_temp_model.dart';
import '../../../../logic/blocs/leave_temp_bloc/leave_temp_api_bloc.dart';
import '../../../../themes/theme_config.dart';

import 'grid_widget.dart';

class LeaveTemplateBody extends StatefulWidget {
  const LeaveTemplateBody({Key key}) : super(key: key);

  @override
  _LeaveTemplateBodyState createState() => _LeaveTemplateBodyState();
}

class _LeaveTemplateBodyState extends State<LeaveTemplateBody> {
  Location location = new Location();
  PermissionStatus _permissionGranted;

  List<GlobalKey<FlipCardState>> cardKeys = [];

  void resetCards() {
    print(cardKeys.length);
    cardKeys.forEach((element) {
      if (element.currentState != null) {
        if (!element.currentState.isFront) {
          element.currentState.toggleCard();
        }
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkPermission();
    leaveTempBloc..getAllowedTemplateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<LeaveTempResponse>(
          stream: leaveTempBloc.subject.stream,
          builder: (context, AsyncSnapshot snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }
              var list = snapshot.data.data;
              List<LeaveTemplateModel> model =
                  list.where((e) => e.templateType == 6).toList();

              //To flip the card to original position
              List.generate(model.length, (index) {
                cardKeys.add(GlobalKey<FlipCardState>());
              });

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 2.2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: model.length ?? 0,
                itemBuilder: (context, index) {
                  LeaveTemplateModel leaveTempResponse = model[index];
                  return FlipCard(
                    key: cardKeys[index],
                    direction: FlipDirection.HORIZONTAL,
                    front: buildFront(
                        templateName: leaveTempResponse.displayName,
                        templateImageCode: leaveTempResponse.iconFileId,
                        colorCode: leaveTempResponse.templateColor,
                        context: context),
                    back: buildRear(
                        templateCode: leaveTempResponse.code,
                        templateName: model[index].displayName,
                        colorCode: leaveTempResponse.templateColor,
                        context: context),
                  );
                },
              );
            } else {
              return Center(
                child: CustomProgressIndicator(),
              );
            }
          }),
    );
  }

  checkPermission() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Widget buildFront(
      {String templateName,
      String templateImageCode,
      String colorCode,
      context}) {
    return Card(
      elevation: 5.0,
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: hexToColor(colorCode),
              child: Center(
                child: templateImageCode != null
                    ? Image.network(
                        APIEndpointConstants.BASE_URL +
                            '/common/query/GetFile?fileId=' +
                            templateImageCode,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace stackTrace) {
                          return Icon(
                            Icons.image,
                            size: MediaQuery.of(context).size.width * 0.28,
                            color: Colors.grey[400],
                          );
                        },
                      )
                    : Icon(
                        Icons.image,
                        size: MediaQuery.of(context).size.width * 0.28,
                        color: Colors.grey[400],
                      ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                templateName,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRear(
      {String templateCode,
      String templateName,
      String colorCode,
      BuildContext context}) {
    Color cardBackground = hexToColor(colorCode);
    Color textColor = cardBackground != null
        ? cardBackground.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white
        : Colors.black;
    return Card(
      elevation: 5.0,
      color: hexToColor(colorCode),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                templateName,
                style: TextStyle(color: textColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(
                  Navigator.pushNamed(
                    context,
                    // HOME_ROUTE,
                    CREATE_SERVICE_ROUTE,
                    arguments: ScreenArguments(
                      arg1: templateCode,
                    ),
                  );
                  resetCards();
                },
                child: Text(
                  "Create",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                )),
          ),
        ],
      ),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
