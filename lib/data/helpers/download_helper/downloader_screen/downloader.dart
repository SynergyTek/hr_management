import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hr_management/data/helpers/download_helper/download_helper_new.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import '../../../../themes/light_theme.dart';

class Downloader extends StatefulWidget {
  final String filename;
  final String url;

  Downloader({
    required this.filename,
    required this.url,
  });

  @override
  _DownloaderState createState() => _DownloaderState();
}

class _DownloaderState extends State<Downloader> {
  String? taskId = "";
  DownloadTaskStatus? taskStatus = DownloadTaskStatus.undefined;
  double? taskProgress = 0.0;

  bool? isOverwritePermitted = true;

  // This is being initialised in the main isolate as it will receive
  // the data from the background isolate.
  ReceivePort receivePort = ReceivePort();

  @override
  void initState() {
    super.initState();

    _bindPortToMainIsolate();

    // Registering the callback for the download process with the background isolate.
    FlutterDownloader.registerCallback(NewDownloadHelper.downloadCallback);

    _showAlertDialog();

    // NewDownloadHelper().requestDownload(
    //   url: widget.url,
    //   filename: widget.filename,
    // );
  }

  @override
  void dispose() {
    // Un-register the isolate mapping to the download port.
    NewDownloadHelper().unbindPortToMainIsolate();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InternetConnectivityWidget(
        child: Container(
          padding: DEFAULT_LARGE_PADDING,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Text(
                  "Downloads",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.blue,
                      ),
                ),
              ),
              Divider(
                color: Colors.blue,
                height: 16.0,
                thickness: 1.50,
                indent: MediaQuery.of(context).size.width * 0.25,
                endIndent: MediaQuery.of(context).size.width * 0.25,
              ),
              Container(
                padding: DEFAULT_LARGE_VERTICAL_PADDING,
                child: ListTile(
                  // leading: Icon(Icons.attach_file),
                  title: Text(widget.filename),
                  subtitle: Text(
                    taskStatus == DownloadTaskStatus.complete
                        ? "Downloaded"
                        : "${taskProgress.toString()} %",
                  ),
                  trailing: taskStatus == DownloadTaskStatus.complete
                      ? TextButton(
                          child: Text(
                            "View",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          onPressed: () => _openfile(),
                        )
                      : Container(
                          width: 64,
                          height: 64,
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor:
                                  LightTheme().lightThemeData().primaryColor,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Registering the sending port of the receiving port with the isolate.
  /// and mapping the send port with an alias.
  void _bindPortToMainIsolate() {
    IsolateNameServer.registerPortWithName(
      receivePort.sendPort,
      "mainIsolatePort",
    );

    // listening to the data coming from the background isolate.
    receivePort.listen((dynamic receivedDataFromBackgroundIsolate) {
      setState(() {
        // Setting the task status
        taskId = receivedDataFromBackgroundIsolate['id'];

        // Setting the task status
        taskStatus = receivedDataFromBackgroundIsolate['status'];

        // Setting the task process
        taskProgress = receivedDataFromBackgroundIsolate['progress'].toDouble();
      });

      if (taskStatus == DownloadTaskStatus.complete) {
        NewDownloadHelper().unbindPortToMainIsolate();
      }
    });
  }

  void _openfile() async {
    String dir = (await getExternalStorageDirectory())!.path;
    String savePath = '$dir/${widget.filename}';
    if (await File(savePath).exists()) {
      OpenResult _openResult = await OpenFile.open(savePath);

      if (_openResult.type != ResultType.done) {
        Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: ${_openResult.message}"),
          ),
        );
      }
    } else {
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("File couldn't be saved, Pl try again later."),
        ),
      );
    }
  }

  _showAlertDialog() async {
    String dir = (await getExternalStorageDirectory())!.path;
    String savePath = '$dir/${widget.filename}';

    // File exists already.
    if (await File(savePath).exists()) {
      isOverwritePermitted = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "File already exists",
            ),
            content: Text(
              "The file already exists in the device. Do you wish to continue download and overwrite the existing file?",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  _openfile();
                },
                child: Text("View file"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text("Download and Overwrite"),
              ),
            ],
          );
        },
      );
    }

    // Download and overwrite the file:
    if (isOverwritePermitted == null || isOverwritePermitted == false) {
      setState(() {
        taskStatus = DownloadTaskStatus.complete;
      });
    } else if (isOverwritePermitted != null && isOverwritePermitted == true) {
      NewDownloadHelper().requestDownload(
        url: widget.url,
        filename: widget.filename,
      );
    }
  }
}
