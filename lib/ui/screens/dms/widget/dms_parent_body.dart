import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/dms/dms_files_response.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';
import 'package:hr_management/data/models/dms/doc_files_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_doc_api_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/manage_document/document/widgets/document_bottom_sheet_widget.dart';
import 'package:hr_management/ui/widgets/custom_icons.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../../../../themes/theme_config.dart';

class DMSParentBody extends StatefulWidget {
  DMSParentBody({Key key}) : super(key: key);

  @override
  _DMSParentBodyState createState() => _DMSParentBodyState();
}

class _DMSParentBodyState extends State<DMSParentBody> {
  List<Cwd> childList = [];
  List<Cwd> filterChildList = [];
  @override
  void initState() {
    dmsBloc.postGetDMSFilesData(
        dmsPostModel: DmsPostModel(
      action: "read",
      path: "/",
      showHiddenItems: false,
      data: [],
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
        stream: dmsBloc.subjectDMSGetFilesResponse.stream,
        builder: (context, AsyncSnapshot<DMSFilesResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            childList = snapshot.data.data.files;
            return Card(
              elevation: 4,
              child: ExpansionTile(
                initiallyExpanded: true,
                leading: Icon(CustomIcons.user),
                title: Text('Administrator'),
                children: [
                  Container(
                    height: 78.h,
                    child: ListView.builder(
                      itemCount: childList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Icon(
                              CustomIcons.folder,
                              color: Colors.blue,
                            ),
                            title: Text(
                              childList[index].name,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                childList[index].count != null
                                    ? CircleAvatar(
                                        radius: 11,
                                        child: Text(
                                          childList[index].count,
                                          style: TextStyle(fontSize: 12),
                                        ))
                                    : SizedBox(),
                                IconButton(
                                  onPressed: () =>
                                      bottomSheet(childList[index].name),
                                  icon: Icon(Icons.more_vert_rounded),
                                )
                              ],
                            ),
                            onTap: () {
                              String parentPath = snapshot.data.data.cwd.id +
                                  '/' +
                                  childList[index].id +
                                  '/';
                              dmsBloc.subjectDMSGetFilesChildResponse.sink
                                  .add(null);
                              Navigator.pushNamed(
                                context,
                                DMS_CHILD,
                                arguments: ScreenArguments(
                                    arg1: childList[index].name,
                                    arg2: parentPath,
                                    dmsParentModel: childList[index],
                                    callBack: (dynamic value, dynamic value2,
                                        dynamic value3) {
                                      dmsBloc
                                          .subjectDMSGetFilesChildResponse.sink
                                          .add(null);
                                    }),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  bottomSheet(String title) {
    showDocumentBottomSheet(
      bottomSheetDataList: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: title,
                subtitle: 'Folder Name',
                isHeading: true,
              ),
            )
          ],
        ),
        ListTile(
          leading: Icon(CustomIcons.trash),
          title: Text('Delete'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(CustomIcons.copy),
          title: Text('Copy'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(CustomIcons.expand_arrows),
          title: Text('Move'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(CustomIcons.archive),
          title: Text('Archive'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(CustomIcons.edit),
          title: Text('Rename'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(CustomIcons.search),
          title: Text('Search'),
          onTap: () {},
        ),
      ],
    );
  }

  showDocumentBottomSheet({@required List<Widget> bottomSheetDataList}) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DocumentBottomSheetWidget(
          bottomSheetDataList: bottomSheetDataList ?? [],
        );
      },
    );
  }

  Widget _statisticWidget({
    @required BuildContext context,
    String title,
    String subtitle,
    bool isHeading = false,
  }) {
    return ListTile(
      title: Text(
        title ?? '-',
        style: TextStyle(
          color:
              isHeading ? Theme.of(context).textHeadingColor : Colors.black87,
        ),
      ),
      subtitle: Text(subtitle ?? '-'),
    );
  }
}
