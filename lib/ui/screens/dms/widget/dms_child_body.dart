import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/dms/dms_files_response.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';
import 'package:hr_management/data/models/dms/doc_files_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_doc_api_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';
import 'package:hr_management/ui/widgets/custom_icons.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';

class DMSChildBody extends StatefulWidget {
  final Cwd parentModel;
  final String parentPath;
  final OnTapPressedCallBack callBack;
  const DMSChildBody(
      {Key key, this.parentModel, this.parentPath, this.callBack})
      : super(key: key);

  @override
  _DMSChildBodyState createState() => _DMSChildBodyState();
}

class _DMSChildBodyState extends State<DMSChildBody> {
  List<Cwd> childList = [];
  List<Cwd> filterChildList = [];
  @override
  void initState() {
    dmsBloc.postGetDMSFilesChildData(
        dmsPostModel: DmsPostModel(
      action: "read",
      path: "${widget.parentPath}",
      showHiddenItems: false,
      data: [widget.parentModel],
      userId:
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? '',
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h),
      child: StreamBuilder<DMSFilesResponse>(
        stream: dmsBloc.subjectDMSGetFilesChildResponse.stream,
        builder: (context, AsyncSnapshot<DMSFilesResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            childList = snapshot.data.data.files;
            if (childList.isEmpty) {
              return EmptyFolderWidget();
            }
            return ListView.builder(
              itemCount: childList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(
                      childList[index].templateCode == 'WORKSPACE_GENERAL' ||
                              childList[index].templateCode == 'GENERAL_FOLDER'
                          ? CustomIcons.folder
                          : CustomIcons.file_alt,
                      color: childList[index].templateCode ==
                              'WORKSPACE_GENERAL'
                          ? Colors.blue
                          : childList[index].templateCode == 'GENERAL_FOLDER'
                              ? Colors.yellow
                              : Colors.cyan,
                    ),
                    title: Text(
                      childList[index].name,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        childList[index].count != null &&
                                childList[index].templateCode != 'FILE'
                            ? CircleAvatar(
                                radius: 11,
                                child: Text(
                                  childList[index].count,
                                  style: TextStyle(fontSize: 12),
                                ))
                            : SizedBox()
                      ],
                    ),
                    onTap: () {
                      if (childList[index].templateCode != 'FILE') {
                        dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
                        String parentPath =
                            widget.parentPath + '/' + childList[index].id + '/';
                        Navigator.pushNamed(
                          context,
                          DMS_CHILD,
                          arguments: ScreenArguments(
                              arg1: childList[index].name,
                              arg2: parentPath,
                              dmsParentModel: childList[index],
                              callBack: (dynamic value, dynamic value2,
                                  dynamic value3) {
                                dmsBloc.postGetDMSFilesChildData(
                                    dmsPostModel: DmsPostModel(
                                  action: "read",
                                  path: "${widget.parentPath}",
                                  showHiddenItems: false,
                                  data: [widget.parentModel],
                                  userId:
                                      BlocProvider.of<UserModelBloc>(context)
                                              .state
                                              ?.userModel
                                              ?.id ??
                                          '',
                                ));
                              }),
                        );
                      }
                    },
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        },
      ),
    );
    ;
  }
}
