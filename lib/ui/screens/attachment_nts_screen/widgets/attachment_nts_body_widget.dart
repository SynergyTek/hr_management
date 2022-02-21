import 'package:flutter/material.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/data/helpers/download_helper/download_helper_new.dart';
import 'package:hr_management/data/helpers/download_helper/downloader_screen/downloader.dart';
import 'package:hr_management/ui/widgets/attachment_view_webview.dart';

import '../../../../data/enums/enums.dart';
import '../../../../data/models/attachment_nts_models/attachment_nts_model.dart';
import '../../../../data/models/attachment_nts_models/attachment_nts_response.dart';
import '../../../../logic/blocs/attachment_nts_bloc/attachment_nts_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

class AttachmentNTSBodyWidget extends StatefulWidget {
  final NTSType? ntsType;
  final String? ntsId;

  AttachmentNTSBodyWidget({
    required this.ntsType,
    required this.ntsId,
  });

  @override
  _AttachmentNTSBodyWidgetState createState() =>
      _AttachmentNTSBodyWidgetState();
}

class _AttachmentNTSBodyWidgetState extends State<AttachmentNTSBodyWidget> {
  @override
  void initState() {
    super.initState();

    attachmentNTSBloc
      ..getData(
        ntsId: widget.ntsId,
        ntsType: widget.ntsType,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<AttachmentNTSResponse>(
        stream: attachmentNTSBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _attachmentListWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _attachmentListWidget(List<AttachmentNTSModel>? data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return ListView.builder(
      itemCount: data.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _eachListTile(
          data: data.elementAt(index),
        );
      },
    );
  }

  Widget _eachListTile({
    required AttachmentNTSModel data,
  }) {
    return ListTile(
      leading: Icon(Icons.attach_file),
      title: Text(
        data.fileName ?? '-',
        style: TextStyle(
          color: Theme.of(context).textHeadingColor,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(data.createdDateDisplay ?? '-'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _handleDownloadOnPressed(data: data),
            icon: Icon(
              Icons.download_sharp,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () => _deleteDialog(data: data),
            // onPressed: () => _handleDeleteOnPressed(data: data),
            icon: Icon(
              Icons.delete_forever_sharp,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  _deleteDialog({
    required AttachmentNTSModel data,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete attachment?"),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () => _handleDeleteOnPressed(data: data),
            ),
          ],
        );
      },
    );
  }

  void _handleDeleteOnPressed({
    required AttachmentNTSModel data,
  }) {
    Navigator.of(context).pop();
    attachmentNTSBloc
      ..deleteData(
        queryparams: {
          'Id': data.id,
        },
        ntsId: widget.ntsId ?? '',
        ntsType: widget.ntsType ?? NTSType.service,
      );
  }

  _handleViewOnPressed({
    required data,
  }) async {
    if (data == null)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Data is unavailable. Pl try again later."),
        ),
      );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AttachmentViewWebview(
            url: APIEndpointConstants.GET_ATTACHMENT_VIEW_WEBVIEW_URL +
                '${data?.udfValue ?? ''}',
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    NewDownloadHelper().unbindPortToMainIsolate();

    super.dispose();
  }

  // -------------------------------------------------- //
  //            Download code goes here.                //
  // -------------------------------------------------- //

  _handleDownloadOnPressed({
    required AttachmentNTSModel data,
  }) {
    NewDownloadHelper().unbindPortToMainIsolate();

    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      builder: (BuildContext context) {
        return Downloader(
          filename: data.fileName ?? "DEFAULT_FILE_NAME",
          url:
              'https://webapidev.aitalkx.com/CHR/query/DownloadAttachment?fileId=${data?.id ?? ''}',
        );
      },
    );
  }
}
