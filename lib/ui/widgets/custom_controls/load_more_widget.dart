import 'package:flutter/material.dart';

import '../progress_indicator.dart';

class LoadMoreWidget extends StatefulWidget {
  LoadMoreWidget({Key key, this.callBack, this.isVisible, this.isLoading})
      : super(key: key);
  final void Function() callBack;
  final bool isVisible;
  final bool isLoading;
  @override
  _LoadMoreWidgetState createState() => _LoadMoreWidgetState();
}

class _LoadMoreWidgetState extends State<LoadMoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: widget.isLoading
                ? Center(child: CustomProgressIndicator())
                : TextButton(
                    child: Text('Load More'),
                    onPressed: widget.callBack,
                  ),
          )
        ],
      ),
    );
  }
}
