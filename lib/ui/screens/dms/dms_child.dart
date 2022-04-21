import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/dms_source_folder_model/dms_source_folder_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_doc_api_bloc.dart';
import 'package:hr_management/ui/screens/dms/widget/dms_child_body.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';

import '../../../logic/blocs/dms_bloc/dms_source_folders_bloc/dms_source_folders_bloc.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';

class DMSChild extends StatelessWidget {
  final String? parentName;
  final DMSSourceFolderModel? parentModel;
  // final Cwd? parentModel;
  final String? parentPath;
  final OnTapPressedCallBack? callBack;
  final List<String?>? pathList;
  final List<String>? parentPathList;
  final List<DMSSourceFolderModel>? parentModelList;
  // final List<Cwd>? parentModelList;
  final String? sourceId;
  final bool? isCopy;
  final bool? isCut;
  DMSChild({
    Key? key,
    this.parentName,
    this.parentModel,
    this.parentPath,
    this.callBack,
    this.pathList,
    this.parentPathList,
    this.parentModelList,
    this.sourceId,
    this.isCopy,
    this.isCut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
        callBack!(true, null, null);
        pathList!.removeLast();
        parentPathList!.removeLast();
        parentModelList!.removeLast();
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  dmsSourceFolderBloc.subjectChildData.sink.add(null);
                  callBack!(true, null, null);
                  pathList!.removeLast();
                  parentPathList!.removeLast();
                  parentModelList!.removeLast();
                  if (pathList != null &&
                      pathList!.isNotEmpty &&
                      pathList!.length > 1) {
                    Navigator.pushNamed(
                      context,
                      DMS_CHILD,
                      arguments: ScreenArguments(
                          dmsParentModelList: parentModelList,
                          list1: pathList,
                          list2: parentPathList,
                          arg1: pathList!.last,
                          arg2: parentPathList!.last,
                          dmsParentModel: parentModelList!.last,
                          callBack: (dynamic value, dynamic value2,
                              dynamic value3) {}),
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      DMS_PARENT,
                    );
                  }
                },
                icon: Icon(Icons.arrow_back)),
            title: Text(parentName!),
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
