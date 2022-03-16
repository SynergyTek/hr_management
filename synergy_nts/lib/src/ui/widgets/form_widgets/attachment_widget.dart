import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class DynamicAttachmentWidget extends StatelessWidget {
  final String? fileId;
  final String? labelName;
  final String? fieldName;
  final VoidCallback? callBack;
  final VoidCallback? callBack1;
  final VoidCallback? callBack2;
  final TextEditingController? controller;
  final bool readOnly;
  final bool? isRequired;

  const DynamicAttachmentWidget({
    this.labelName,
    this.fieldName,
    this.controller,
    this.callBack,
    this.callBack1,
    this.callBack2,
    this.fileId,
    this.readOnly = false,
    this.isRequired,

    //
    Key? key,
  }) : super(key: key);
  // final String? latitude;
  // final String? longitude;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: readOnly.toString() == 'true' ? Colors.grey.shade200 : null,
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    TextFormField(
                        textAlign: TextAlign.justify,
                        readOnly: readOnly,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppThemeColor.textColorDark,
                        ),
                        key: Key(fieldName!),
                        controller: controller,
                        textInputAction: TextInputAction.done,
                        cursorColor: Theme.of(context).primaryColor,
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 44, top: 0),
                          prefixText: (isRequired != null && isRequired == true)
                              ? '*\t'
                              : '',
                          errorStyle: const TextStyle(fontSize: 12.0),
                          prefixStyle:
                              const TextStyle(fontSize: 25, color: Colors.red),
                        ),
                        maxLines: 1),
                  ],
                ),
              ),
              Visibility(
                visible: (fileId == null || fileId!.isEmpty) ? false : true,
                child: IconButton(
                  icon: const Icon(
                    Icons.download,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    callBack1!();
                  },
                ),
              ),
              Visibility(
                visible: (readOnly) ? false : true,
                child: IconButton(
                  icon: Icon(
                    Icons.attach_file,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    callBack!();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
