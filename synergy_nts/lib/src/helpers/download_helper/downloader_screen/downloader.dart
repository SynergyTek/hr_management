import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/light_theme.dart';
import '../download_helper_new.dart';

class Downloader extends StatefulWidget {
  final String? filename;
  final String? url;

  const Downloader({required this.filename, required this.url, Key? key})
      : super(key: key);

  @override
  _DownloaderState createState() => _DownloaderState();
}

class _DownloaderState extends State<Downloader> {
  String? taskId = "";
  // DownloadTaskStatus? taskStatus = DownloadTaskStatus.undefined;
  int? taskStatus = 0; // DownloadTaskStatus.undefined;
  double? taskProgress = 0.0;

  bool isOverwritePermitted = true;

  // This is being initialised in the main isolate as it will receive
  // the data from the background isolate.
  ReceivePort receivePort = ReceivePort();
  String fileName = "";

  @override
  void initState() {
    super.initState();
    fileName = widget.filename!.replaceAll("\"", "");

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
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
              padding: const EdgeInsets.all(16),
              child: ListTile(
                // leading: Icon(Icons.attach_file),
                title: Text(
                  fileName.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.blue,
                      ),
                ),
                subtitle: Text(
                  taskStatus == 3 //  DownloadTaskStatus.complete
                      ? "Downloaded"
                      : "${taskProgress.toString()} %",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.blue,
                      ),
                ),
                trailing: taskStatus == 3 // DownloadTaskStatus.complete
                    // ? const SizedBox()
                    ? TextButton(
                        child: Text(
                          "View",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppThemeColor.textHeadingColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        onPressed: () => _openfile(),
                      )
                    : SizedBox(
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

      if (taskStatus == 3) {
        // DownloadTaskStatus.complete
        NewDownloadHelper().unbindPortToMainIsolate();
      }
    });
  }

  void _openfile() async {
    String dir = await NewDownloadHelper().prepareSaveDir();
    String savePath = '$dir/$fileName';
    if (await File(savePath).exists()) {
      OpenResult? _openResult = await OpenFile.open(savePath);

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
        const SnackBar(
          content: Text("File couldn't be saved, Pl try again later."),
        ),
      );
    }
  }

  _showAlertDialog() async {
    String dir = await NewDownloadHelper().prepareSaveDir();
    String savePath = '$dir/$fileName';

    // File exists already.
    if (await File(savePath).exists()) {
      isOverwritePermitted = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "File already exists",
            ),
            content: const Text(
              "The file already exists in the device. Do you wish to continue download and overwrite the existing file?",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  _openfile();
                },
                child: const Text("View file"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Download and Overwrite"),
              ),
            ],
          );
        },
      );
    }

    // Download and overwrite the file:
    if (isOverwritePermitted == false) {
      setState(() {
        taskStatus = 3; // DownloadTaskStatus.complete
      });
    } else if (isOverwritePermitted == true) {
      NewDownloadHelper().requestDownload(
        url: widget.url,
        filename: fileName,
      );
    }
  }
}
