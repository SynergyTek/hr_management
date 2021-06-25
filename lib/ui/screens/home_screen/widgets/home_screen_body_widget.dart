import 'package:flutter/material.dart';

class HomeScreenBodyWidget extends StatefulWidget {
  HomeScreenBodyWidget();

  @override
  _HomeScreenBodyWidgetState createState() => _HomeScreenBodyWidgetState();
}

class _HomeScreenBodyWidgetState extends State<HomeScreenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Welcome home."),
    );
  }
}
