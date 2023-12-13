import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
// import 'package:android_path_provider/android_path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

//
class NewDownloadHelper {
  /// handlePermissions:
  /// This method checks whether all the required permissions are provided by the user for download to start.
  /// else it will ask the user to provide the permissions.
  late String _localPath;
  Future<bool>? handlePermissions() async {
    final storagePermissionStatus = await Permission.storage.request();

    if (storagePermissionStatus.isGranted) {
      return true;
    }

    // if the status is of any other type then return false.
    return false;
  }

  /// saveDirectoryPath:
  /// this method returns the path where the downloaded files will be stored.
  Future<String> prepareSaveDir() async {
    _localPath = (await _getSavedDir())!;
    final savedDir = Directory(_localPath);
    if (!savedDir.existsSync()) {
      await savedDir.create();
    }
    return _localPath;
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      // try {
      //   externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      // } catch (err, st) {
      //   print('failed to get downloads path: $err, $st');

        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      // }
    } else if (Platform.isIOS) {
      // var dir = (await _dirsOnIOS)[0]; // temporary
      // var dir = (await _dirsOnIOS)[1]; // applicationSupport
      // var dir = (await _dirsOnIOS)[2]; // library
      // var dir = (await _dirsOnIOS)[3]; // applicationDocuments
      var dir = (await _dirsOnIOS)[4]; // downloads

      dir ??= await getApplicationDocumentsDirectory();
      externalStorageDirPath = dir.absolute.path;
    }
    debugPrint(externalStorageDirPath);

    return externalStorageDirPath;
  }

  Future<List<Directory?>> get _dirsOnIOS async {
    final temporary = await getTemporaryDirectory();
    final applicationSupport = await getApplicationSupportDirectory();
    final library = await getLibraryDirectory();
    final applicationDocuments = await getApplicationDocumentsDirectory();
    final downloads = await getDownloadsDirectory();

    final dirs = [
      temporary,
      applicationSupport,
      library,
      applicationDocuments,
      downloads
    ];

    return dirs;
  }

  Future<String?> requestDownload({
    String? url,
    String? filename,
  }) async {
    return await FlutterDownloader.enqueue(
      url: url!,
      fileName: filename,
      savedDir: await prepareSaveDir(),
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  /// The downloadCallback method to access the progress
  /// and other events pertaining to the download of a task.
  ///
  /// ##### Theory:
  /// This method will be executed in the background isolate and
  /// hence, we cannot just simply access it's value in the main isolate where the UI is being rendered.
  /// We need to setup a duplex inter-isolate communication b/w the main isolate and downloading-background isolate.
  /// For inter-isolate communication ports are required and there are two type of ports namely, SenderPort and ReceiverPort.
  ///  +  ReceiverPort receives data whereas
  ///  +  SenderPort emits data
  ///
  /// Here, we will register a sender port which will emit data to the main isolate
  /// which we can listen to using a ReceivePort in the main isolate.
  ///
  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    int status,
    int progress,
  ) {
    //
    // Accessing the main isolate via it's alias and
    // using it's sendport to send data back to the main isolate.
    //
    final SendPort? sendPort =
        IsolateNameServer.lookupPortByName("mainIsolatePort");
    sendPort?.send(
      {
        "id": id,
        "status": status,
        "progress": progress,
      },
    );
  }

  /// Un-register the isolate mapping to the download port.
  void unbindPortToMainIsolate() {
    IsolateNameServer.removePortNameMapping("mainIsolatePort");
  }
}
