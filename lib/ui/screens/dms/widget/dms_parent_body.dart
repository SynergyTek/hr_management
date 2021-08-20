import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/dms_files_response.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';
import 'package:hr_management/data/models/dms/doc_files_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_doc_api_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/custom_icons.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';

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
      userId: "45bba746-3309-49b7-9c03-b5793369d73c",
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<DMSFilesResponse>(
        stream: dmsBloc.subjectReadDependnetResponse.stream,
        builder: (context, AsyncSnapshot<DMSFilesResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            childList = snapshot.data.data.files;
            return ExpansionTile(
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
                        elevation: 4,
                        child: ListTile(
                            leading: Icon(
                              CustomIcons.folder,
                              color: Colors.blue,
                            ),
                            title: Text(
                              childList[index].name,
                            )),
                      );
                    },
                  ),
                ),
              ],
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
}
