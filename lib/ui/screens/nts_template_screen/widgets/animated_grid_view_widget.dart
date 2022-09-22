import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/data/helpers/hex_colot_convert.dart';

import '../../../../constants/api_endpoints.dart';
// import '../../../../data/enums/enums.dart';
import '../../../../data/models/nts_template_models/nts_template_model.dart';
// import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../leaves/widget/grid_widget.dart';
import 'package:synergy_nts/synergy_nts.dart';

class AnimatedGridViewWidget extends StatefulWidget {
  final List<NTSTemplateModel>? model;
  final NTSType? ntsType;
  final String? categoryCode;

  AnimatedGridViewWidget({
    required this.model,
    required this.ntsType,
    this.categoryCode,
  });

  @override
  _AnimatedGridViewWidgetState createState() => _AnimatedGridViewWidgetState();
}

class _AnimatedGridViewWidgetState extends State<AnimatedGridViewWidget> {
  List<GlobalKey<FlipCardState>> cardKeys = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 2.2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: widget.model!.length,
      itemBuilder: (context, index) {
        List.generate(widget.model!.length, (index) {
          cardKeys.add(GlobalKey<FlipCardState>());
        });

        return GridViewFlipWidget(
          index: index,
          cardKeys: cardKeys,
          response: widget.model![index],
          ntsType: widget.ntsType,
          categoryCode: widget.categoryCode,
        );
      },
    );
  }
}

class GridViewFlipWidget extends StatefulWidget {
  final int index;
  final List<GlobalKey<FlipCardState>> cardKeys;
  final NTSTemplateModel response;
  final NTSType? ntsType;
  final String? categoryCode;

  GridViewFlipWidget({
    required this.index,
    required this.cardKeys,
    required this.response,
    required this.ntsType,
    this.categoryCode,
  });

  @override
  _GridViewFlipWidgetState createState() => _GridViewFlipWidgetState();
}

class _GridViewFlipWidgetState extends State<GridViewFlipWidget> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: widget.cardKeys[widget.index],
      direction: FlipDirection.HORIZONTAL,
      front: FlipCardWidget(
        widgets: frontWidgets(
          templateName: widget.response.displayName ?? '',
          templateImageCode: widget.response.iconFileId,
          colorCode: widget.response.templateColor ?? '#FFFFFF',
          context: context,
        ),
      ),
      back: FlipCardWidget(
        colorCode: widget.response.templateColor,
        widgets: backWidgets(
          templateName: widget.response.displayName ?? "",
          templateCode: widget.response.code,
          colorCode: widget.response.templateColor ?? '#FFFFFF',
          context: context,
          categoryCode: widget.categoryCode,
        ),
      ),
    );
  }

  List<Widget> frontWidgets({
    required String templateName,
    String? templateImageCode,
    required String colorCode,
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
                        StackTrace? stackTrace) {
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
    String? templateCode,
    required String templateName,
    required String colorCode,
    BuildContext? context,
    String? categoryCode,
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
            print("templateCode: $templateCode");
            serviceBloc.subject.sink.add(null);
            Navigator.pushNamed(
              context!,
              widget.ntsType == NTSType.service
                  ? CREATE_SERVICE_ROUTE
                  : widget.ntsType == NTSType.task
                      ? CREATE_EDIT_TASK_ROUTE
                      : ADD_EDIT_NOTE_ROUTE,
              arguments: ScreenArguments(
                arg1: templateCode,
                arg2: '',
                portalType: PortalType.hr,
                arg4: categoryCode,
              ),
            );
            resetCards();
          },
          child: Text(
            "Create",
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
      ),
    );
    return widgets;
  }

  void resetCards() {
    print(widget.cardKeys.length);
    widget.cardKeys.forEach((element) {
      if (element.currentState != null) {
        if (!element.currentState!.isFront) {
          element.currentState!.toggleCard();
        }
      }
    });
    setState(() {});
  }
}
