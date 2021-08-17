// Steps:
// 1. flutter_downloader: https://pub.dev/packages/flutter_downloader
// 2. Do platform specific integrations.
// 3. Initialise the plugin:
//  - WidgetsFlutterBinding.ensureInitialized();
//  - await FlutterDownloader.initialize(
//  -   debug: true // optional: set false to disable printing logs to console
//  - );
//

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

/// Download Helper download from a source and
/// downloads it in the background.
class DownloadHelper {
  /// TODO: Need to check for storage permission and also to request permission if they aren't granted yet.
  /// Check for storage permission and Internet access.
  // Future<bool> _checkPermission() async {
  //   if (widget.platform == TargetPlatform.android) {
  //     final status = await Permission.storage.status;
  //     if (status != PermissionStatus.granted) {
  //       final result = await Permission.storage.request();
  //       if (result == PermissionStatus.granted) {
  //         return true;
  //       }
  //     } else {
  //       return true;
  //     }
  //   } else {
  //     return true;
  //   }
  //   return false;
  // }

  /// requestDownload creates a download queue and
  /// takes the downloadURL and saveDirectory as params
  /// and returns the task id as output for the download task that is scheduled.
  Future<String> requestDownload({
    @required String fileName,
    @required String downloadURL,
    String saveDirectoryPath,
  }) async {
    // Guard clause: Can't schedule a download task if no Download URL is present
    if (downloadURL == null || downloadURL.isEmpty)
      return Future.error(
        "Can't schedule a download task if no Download URL is null or empty.",
      );

    if (saveDirectoryPath == null || saveDirectoryPath.isEmpty) {
      saveDirectoryPath = await _prepareSaveDir();
      print("1saveDirectoryPath: $saveDirectoryPath");
    }

    print("--------------------------------------");
    print("2saveDirectoryPath: $saveDirectoryPath");
    print("--------------------------------------");

    return await FlutterDownloader.enqueue(
      fileName: fileName,
      url: downloadURL,
      savedDir: saveDirectoryPath,
      // show download progress in status bar (for Android)
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  /// loadSpecificTaskWithTaskID checks a specific task (using a taskID)
  /// and returns a list of tasks as a future.
  /// if the taskID is null or empty a null value is returned
  Future<List<DownloadTask>> loadSpecificTaskWithTaskID({
    @required String taskID,
  }) async {
    // Guard clause
    if (taskID == null || taskID.isEmpty)
      return Future.error(
        "Can't fetch the task as the taskID is either null or empty.",
      );

    String query = "SELECT * FROM task WHERE task_id = " + taskID;
    return await FlutterDownloader.loadTasksWithRawQuery(query: query);
  }

  /// cancelSpecificTask cancels a download task from the queue
  /// when the download task's id is provided as input param.
  cancelSpecificTask({
    @required String taskID,
  }) {
    // Guard clause
    if (taskID == null || taskID.isEmpty)
      return Future.error(
        "Can't cancel the download task as the taskID is either null or empty.",
      );

    FlutterDownloader.cancel(taskId: taskID);
  }

  /// cancelAllTasks cancels all the download tasks in the queue.
  cancelAllTasks() {
    FlutterDownloader.cancelAll();
  }

  /// retrySpecificTask retries to download a specific task from the queue
  /// when the download task's id is provided as input param.
  retrySpecificTask({
    @required String taskID,
  }) {
    // Guard clause
    if (taskID == null || taskID.isEmpty)
      return Future.error(
        "Can't retry the download task as the taskID is either null or empty.",
      );

    FlutterDownloader.retry(taskId: taskID);
  }

  Future<String> _prepareSaveDir() async {
    String _localPath =
        (await _findLocalPath()) + Platform.pathSeparator + 'HRM_Download';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    return _localPath;
  }

  Future<String> _findLocalPath() async {
    final directory = await getExternalStorageDirectory();
    return directory?.path;
  }
}
