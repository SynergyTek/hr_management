import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/data/helpers/download_helper/download_helper.dart';
import 'package:hr_management/ui/widgets/attachment_view_webview.dart';

import '../../../../data/enums/enums.dart';
import '../../../../data/models/attachment_nts_models/attachment_nts_model.dart';
import '../../../../data/models/attachment_nts_models/attachment_nts_response.dart';
import '../../../../logic/blocs/attachment_nts_bloc/attachment_nts_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

class AttachmentNTSBodyWidget extends StatefulWidget {
  final NTSType ntsType;
  final String ntsId;

  AttachmentNTSBodyWidget({
    @required this.ntsType,
    @required this.ntsId,
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
        ntsId: widget?.ntsId,
        ntsType: widget?.ntsType,
      );

    _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback);

    _isLoading = true;
    _permissionReady = false;

    // TODO: Need to check for preparing Save Directory.
    // _prepare();
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

  Widget _attachmentListWidget(List<AttachmentNTSModel> data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return ListView.builder(
      itemCount: data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _eachListTile(
          data: data.elementAt(index),
        );
      },
    );
  }

  Widget _eachListTile({
    @required AttachmentNTSModel data,
  }) {
    return ListTile(
      onTap: () => _handleViewOnPressed(data: data),
      leading: Icon(Icons.attachment_outlined),
      title: Text(
        data?.fileName ?? '-',
        style: TextStyle(
          color: Theme.of(context).textHeadingColor,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(data?.size ?? '-'),
          Text(data?.createdDateDisplay ?? '-'),
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
    @required AttachmentNTSModel data,
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
    @required AttachmentNTSModel data,
  }) {
    Navigator.of(context).pop();
    attachmentNTSBloc
      ..deleteData(
        queryparams: {
          'Id': data.id,
        },
        ntsId: widget?.ntsId ?? '',
        ntsType: widget?.ntsType ?? NTSType.service,
      );
  }

  _handleViewOnPressed({
    @required data,
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

  // -------------------------------------------------- //
  //            Download code goes here.                //
  // -------------------------------------------------- //

  List _tasks;
  List _items;
  bool _isLoading;
  bool _permissionReady;
  ReceivePort _port = ReceivePort();

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );

    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }

    _port.listen((dynamic data) {
      print("data: $data");

      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      if (_tasks != null && _tasks.isNotEmpty) {
        final task = _tasks.firstWhere((task) => task.taskId == id);
        setState(() {
          task.status = status;
          task.progress = progress;
        });
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  _handleDownloadOnPressed({
    @required AttachmentNTSModel data,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Download queued."),
      ),
    );

    DownloadHelper().requestDownload(
      fileName: data?.fileName ?? '-',
      downloadURL:
          'https://webapidev.aitalkx.com/CHR/query/DownloadAttachment?fileId=${data?.id ?? ''}',
    );
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }
}
