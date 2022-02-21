import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';

class TagNTSBodyWidget extends StatefulWidget {
  final NTSType? ntsType;
  final String? ntsId;

  TagNTSBodyWidget({
    required this.ntsType,
    required this.ntsId,
  });

  @override
  TagNTSBodyWidgetState createState() => TagNTSBodyWidgetState();
}

class TagNTSBodyWidgetState extends State<TagNTSBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
