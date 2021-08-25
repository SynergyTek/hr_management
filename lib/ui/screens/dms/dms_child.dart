import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/doc_files_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_doc_api_bloc.dart';
import 'package:hr_management/ui/screens/dms/widget/dms_child_body.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';

class DMSChild extends StatelessWidget {
  final String parentName;
  final Cwd parentModel;
  final String parentPath;
  final OnTapPressedCallBack callBack;
  final List<String> pathList;
  final List<String> parentPathList;
  final List<Cwd> parentModelList;
  const DMSChild(
      {Key key,
      this.parentName,
      this.parentModel,
      this.parentPath,
      this.callBack,
      this.pathList,
      this.parentPathList,
      this.parentModelList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
        callBack(true, null, null);
        pathList.removeLast();
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
                  callBack(true, null, null);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            title: Text(parentName),
          ),
          body: DMSChildBody(
            parentModel: parentModel,
            parentPath: parentPath,
            path: pathList,
            parentPathList: parentPathList,
            parentModelList: parentModelList,
            parentName: parentName,
          )),
    );
  }
}
