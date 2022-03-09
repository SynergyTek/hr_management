import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AttachmentViewWebview extends StatelessWidget {
  // WebViewController _controller;
  final String url;

  AttachmentViewWebview({
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        print(url);
        return WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {},
          gestureNavigationEnabled: true,
        );
      }),
    );
  }
}
