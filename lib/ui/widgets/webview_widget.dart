import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../data/helpers/formio_helper.dart';
import '../../data/models/udf_json_model/udf_json_model.dart';
import '../../themes/theme_config.dart';
import 'primary_button.dart';
import 'progress_indicator.dart';

class WebViewScreen extends StatefulWidget {
  final String json;

  WebViewScreen({
    @required this.json,
  });

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: InAppWebView(
                  initialData: InAppWebViewInitialData(
                    data: FormIOHelper().generateHTML(
                      json: widget?.json,
                    ),
                    baseUrl: Uri.parse('http://localhost'),
                  ),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                  },
                  onLoadStart: (InAppWebViewController controller, Uri url) {
                    _parseJSONToMap();

                    setState(() {
                      isLoading = true;
                    });
                  },
                  onLoadStop: (InAppWebViewController controller, Uri url) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    _finalMap.keys.forEach((element) {
                      if (consoleMessage.message.contains(element)) {
                        if (consoleMessage.message.split('::')[1].isNotEmpty) {
                          _finalMap[element] =
                              consoleMessage.message.split('::')[1].trim();
                        }
                      }
                    });
                  },
                ),
              ),
              isLoading == true
                  ? Container()
                  : PrimaryButton(
                      buttonText: "Submit",
                      handleOnPressed: () => _submitButtonOnPressed(),
                    ),
            ],
          ),
          isLoading == true
              ? CustomProgressIndicator(
                  loadingText: "Loading...",
                )
              : Container(),
        ],
      ),
    );
  }

  void _submitButtonOnPressed() async {
    _webViewController.evaluateJavascript(source: """
      \$('input').each(function (i, item) {
        console.log(item.id, "::", item.value);
      });
    """);

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 5));

    setState(() {
      isLoading = false;
    });

    print("Final Map: ${_finalMap.entries}");

    // TODO
    // String json = jsonEncode(_finalMap);
  }

  Map<String, String> _finalMap = Map<String, String>();
  void _parseJSONToMap() {
    UdfJson _udfJSON = UdfJson.fromJson(jsonDecode(widget.json));

    _udfJSON.components.forEach((element) {
      if (element.columns != null) {
        element.columns.forEach((eachColumn) {
          eachColumn.components.forEach((eachComponent) {
            _finalMap[eachComponent.key] = '';
          });
        });
      }

      if (element.components != null) {
        element.components.forEach((eachComponent) {
          _finalMap[eachComponent.key] = '';
        });
      }
    });
  }
}
