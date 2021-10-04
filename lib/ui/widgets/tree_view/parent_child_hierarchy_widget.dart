import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/doc_files_model.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';

typedef ActionCallBack = void Function(dynamic key, dynamic value);

class DocumentChildWidget extends StatelessWidget {
  final Cwd documentViewModel;
  final OnTapPressedCallBack onTapPressedCallBack;
  final ActionCallBack onTapListCallBack;
  final bool isArchive;
  final bool showMenu;
  DocumentChildWidget(
      {this.documentViewModel,
      this.onTapPressedCallBack,
      this.onTapListCallBack,
      this.isArchive,
      this.showMenu});

  @override
  Widget build(BuildContext context) {
    var imageUri = '';
    // ApiEnvironment().getHttpUri(GraphQLConfiguration.synergyClient) +
    //     "NtsDownload?fileId=" +
    //     documentViewModel.fileId.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Icon(
            Icons.subdirectory_arrow_right,
            color: Colors.black38,
            size: 30,
          ),
        ),
        Expanded(
          child: Card(
            elevation: 2.0,
            child: ListTile(
              leading: Icon(
                Icons.folder_open,
                color: Colors.yellow,
              ),
              title: InkWell(
                onTap: () {
                  onTapListCallBack(documentViewModel, context);
                  // navigateToChild(context, documentViewModel);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 45,
                        alignment: Alignment.centerLeft,
                        // color: Colors.red,
                        child: Text(
                            documentViewModel.name != null
                                ? documentViewModel.name
                                : "",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ),
                    documentViewModel.count != null
                        ? CircleAvatar(
                            radius: 11,
                            child: Text(
                              documentViewModel.count.toString(),
                              style: TextStyle(fontSize: 12),
                            ))
                        : SizedBox()
                  ],
                ),
              ),
              trailing: IconButton(
                iconSize: 20,
                icon: Icon(
                  Icons.more_vert,
                ),
                onPressed: () {
                  onTapPressedCallBack(context, imageUri, documentViewModel);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  navigateToChild(context, documentViewModel) {
    // pushToDigitalFileDocuments(context, settingInheritedWidget,
    //     documentViewModel, documentViewModel.id);
  }
}

class DocumentParentWidget extends StatelessWidget {
  final Cwd documentViewModel;
  final OnTapPressedCallBack onTapPressedCallBack;
  final ActionCallBack onTapListCallBack;
  final bool isArchive;
  final bool showMenu;
  DocumentParentWidget(
      {this.documentViewModel,
      this.onTapPressedCallBack,
      this.onTapListCallBack,
      this.isArchive,
      this.showMenu});

  @override
  Widget build(BuildContext context) {
    var imageUri = '';
    //     ApiEnvironment().getHttpUri(GraphQLConfiguration.synergyClient) +
    //         "getsnapshot?fileId=" +
    //         documentViewModel.fileId.toString();
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Icon(
          Icons.folder_open,
          color: Colors.yellow,
        ),
        title: InkWell(
          onTap: () {
            onTapListCallBack(documentViewModel, context);
          },
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 45,
                  alignment: Alignment.centerLeft,
                  // color: Colors.red,
                  child: Text(
                      documentViewModel.name != null
                          ? documentViewModel.name
                          : "",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline6),
                ),
              ),
              documentViewModel.count != null
                  ? CircleAvatar(
                      radius: 11,
                      child: Text(
                        documentViewModel.count.toString(),
                        style: TextStyle(fontSize: 12),
                      ))
                  : SizedBox()
            ],
          ),
        ),
        trailing: documentViewModel.templateCode != "LEGALENTITY_FOLDER"
            ? IconButton(
                padding: EdgeInsets.symmetric(horizontal: 0),
                iconSize: 20,
                icon: Icon(Icons.more_vert),
                color: Colors.grey[600],
                onPressed: () {
                  onTapPressedCallBack(context, imageUri, documentViewModel);
                },
              )
            : SizedBox(),
      ),
    );
  }

  navigateToChild(context, documentViewModel) {
    // pushToDigitalFileDocuments(context, settingInheritedWidget,
    //     documentViewModel, documentViewModel.id);
  }
}
