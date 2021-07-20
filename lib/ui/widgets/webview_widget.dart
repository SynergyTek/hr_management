import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../themes/theme_config.dart';

import '../../data/helpers/formio_helper.dart';
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
  InAppWebViewController webView;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: Stack(
        children: [
          InAppWebView(
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
              webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, Uri url) {
              setState(() {
                isLoading = true;
              });
            },
            onLoadStop: (InAppWebViewController controller, Uri url) {
              setState(() {
                isLoading = false;
              });
            },
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
}
