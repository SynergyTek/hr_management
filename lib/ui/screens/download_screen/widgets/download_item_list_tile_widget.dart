import 'package:flutter/material.dart';

class DownloadItemListTileWidget extends StatelessWidget {
  final String title;
  final String downloadURL;
  final Function handleDownloadOnPressed;

  const DownloadItemListTileWidget({
    @required this.title,
    @required this.downloadURL,
    @required this.handleDownloadOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        // Type of download ???
        // Generally map ???
        leading: Icon(
          Icons.video_call_sharp,
        ),
        title: Text(title ?? ""),
        trailing: IconButton(
          icon: Icon(Icons.download_outlined),
          onPressed: () => handleDownloadOnPressed(
            title: title,
            downloadURL: downloadURL,
          ),
        ),
      ),
    );
  }
}
