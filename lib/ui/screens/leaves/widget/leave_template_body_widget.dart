import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/progress_indicator.dart';
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
                    front: FlipCardWidget(
                      widgets: frontWidgets(
                          templateName: leaveTempResponse.displayName,
                          templateImageCode: leaveTempResponse.iconFileId,
                          colorCode: leaveTempResponse.templateColor,
                          context: context),
                    ),
                    back: FlipCardWidget(
                      colorCode: leaveTempResponse.templateColor,
                      widgets: backWidgets(
                          templateCode: leaveTempResponse.code,
                          templateName: model[index].displayName,
                          colorCode: leaveTempResponse.templateColor,
                          context: context),
                    ),
                    // front:buildFront(
                    //     templateName: leaveTempResponse.displayName,
                    //     templateImageCode: leaveTempResponse.iconFileId,
                    //     colorCode: leaveTempResponse.templateColor,
                    //     context: context),
                    // back:buildRear(
                    //     templateCode: leaveTempResponse.code,
                    //     templateName: model[index].displayName,
                    //     colorCode: leaveTempResponse.templateColor,
                    //     context: context),
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

  List<Widget> frontWidgets({
    String templateName,
    String templateImageCode,
    String colorCode,
    context,
  }) {
    List<Widget> widgets = [];
    widgets.add(
      Expanded(
        flex: 7,
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
    );
    widgets.add(
      Expanded(
        flex: 2,
        child: Center(
          child: Text(
            templateName,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    );
    return widgets;
  }

  List<Widget> backWidgets({
    String templateCode,
    String templateName,
    String colorCode,
    BuildContext context,
  }) {
    List<Widget> widgets = [];
    Color cardBackground = hexToColor(colorCode);
    Color textColor = cardBackground != null
        ? cardBackground.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white
        : Colors.black;

    widgets.add(
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
    );
    widgets.add(
      Container(
        margin: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              serviceBloc.subject.sink.add(null);
              Navigator.pushNamed(
                context,
                CREATE_SERVICE_ROUTE,
                arguments: ScreenArguments(arg1: templateCode, arg2: ''),
              );
              resetCards();
            },
            child: Text(
              "Create",
              textAlign: TextAlign.center,
              maxLines: 1,
            )),
      ),
    );
    return widgets;
  }
}
