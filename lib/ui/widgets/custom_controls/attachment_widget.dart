import 'package:flutter/material.dart';

class DynamicAttchmentWidget extends StatelessWidget {
  final String fileId;
  final String labelName;
  final String fieldName;
  final VoidCallback callBack;
  final VoidCallback callBack1;
  final VoidCallback callBack2;
  final TextEditingController controller;
  final bool readOnly;

  const DynamicAttchmentWidget(
      this.labelName,
      this.fieldName,
      this.controller,
      this.callBack,
      this.callBack1,
      this.callBack2,
      this.fileId,
      this.readOnly);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  new TextFormField(
                      readOnly: readOnly,
                      style: TextStyle(fontSize: 15),
                      key: new Key(fieldName),
                      controller: controller,
                      textInputAction: TextInputAction.done,
                      cursorColor: Theme.of(context).primaryColor,
                      enabled: false,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 12.0)),
                      maxLines: 1),
                ],
              ),
            ),
            Visibility(
              visible: true, //fileId == null ? false : true,
              child: IconButton(
                icon: Icon(
                  Icons.attach_file,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  callBack();
                },
              ),
            ),
            Visibility(
              visible: fileId == null ? false : true,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_downward,
                  color: Colors.green,
                ),
                onPressed: () {
                  callBack1();
                },
              ),
            ),
            Visibility(
              visible: fileId == null ? false : true,
              child: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                onPressed: () {
                  callBack2();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
