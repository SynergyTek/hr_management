import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hr_management/data/helpers/download_helper/download_helper.dart';
import '../constants/download_screen_constants.dart';

import 'download_item_list_tile_widget.dart';

class DownloadScreenBodyWidget extends StatefulWidget {
  DownloadScreenBodyWidget();

  @override
  _DownloadScreenBodyWidgetState createState() =>
      _DownloadScreenBodyWidgetState();
}

class _DownloadScreenBodyWidgetState extends State<DownloadScreenBodyWidget> {
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

  @override
  void initState() {
    super.initState();

    _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback);

    _isLoading = true;
    _permissionReady = false;

    // TODO: Need to check for preparing Save Directory.
    // _prepare();
  }

  handleDownloadOnPressed({
    String title,
    String downloadURL,
  }) {
    DownloadHelper().requestDownload(
      fileName: title,
      downloadURL: downloadURL,
    );
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DownloadScreenConstants.DOWNLOAD_CONSTANTS.length,
      itemBuilder: (BuildContext context, int index) {
        return DownloadItemListTileWidget(
          title: DownloadScreenConstants.DOWNLOAD_CONSTANTS
              .elementAt(index)["title"],
          downloadURL: DownloadScreenConstants.DOWNLOAD_CONSTANTS
              .elementAt(index)["downloadURL"],
          handleDownloadOnPressed: handleDownloadOnPressed,
        );
      },
    );
  }
}
