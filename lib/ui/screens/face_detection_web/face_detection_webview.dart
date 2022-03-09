import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';

class FaceDeteWebview extends StatefulWidget {
  final String? url;
  final String? urlModuleName;
  const FaceDeteWebview({Key? key, this.url, this.urlModuleName})
      : super(key: key);

  @override
  _FaceDeteWebviewState createState() => _FaceDeteWebviewState();
}

class _FaceDeteWebviewState extends State<FaceDeteWebview> {
  String? _url = '';
  final key = UniqueKey();
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  void initState() {
    _url = widget.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: widget.urlModuleName),
      body: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(_url!)),
          initialUserScripts: UnmodifiableListView<UserScript>([]),
          initialOptions: options,
          onWebViewCreated: (InAppWebViewController controller) {
            webViewController = controller;
          },
          androidOnPermissionRequest: (InAppWebViewController controller,
              String origin, List<String> resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          }),
    );
  }
}
