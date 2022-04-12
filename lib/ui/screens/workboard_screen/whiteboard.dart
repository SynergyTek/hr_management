import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_painter/image_painter.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class WhiteBoardWidget extends StatefulWidget {
  final String? imageString;

  const WhiteBoardWidget({Key? key, this.imageString}) : super(key: key);
  @override
  _WhiteBoardWidgetState createState() => _WhiteBoardWidgetState();
}

class _WhiteBoardWidgetState extends State<WhiteBoardWidget> {
  final _imageKey = GlobalKey<ImagePainterState>();
  final _key = GlobalKey<ScaffoldState>();

  bool? eraser = false;

  void saveImage() async {
    final image = await _imageKey.currentState?.exportImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    await Directory('$directory/sample').create(recursive: true);
    final fullPath =
        '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
    final imgFile = File('$fullPath');
    imgFile.writeAsBytesSync(image!);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[700],
        padding: const EdgeInsets.only(left: 10),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Image Exported successfully.",
                style: TextStyle(color: Colors.white)),
            TextButton(
              onPressed: () => OpenFile.open("$fullPath"),
              child: Text(
                "Open",
                style: TextStyle(
                  color: Colors.blue[200],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text("White Board"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt),
            onPressed: saveImage,
          ),
          IconButton(
            key: UniqueKey(),
            icon: const Icon(Icons.phonelink_erase_rounded),
            onPressed: () => setState(() {
              eraser = true;
            }),
          ),
        ],
      ),
      body:
//Provide controller to the painter.
          (widget.imageString == null)
              ? ImagePainter.signature(
                  signatureBgColor: Colors.white,
                  key: _imageKey,
                )
              : ImagePainter.network(
                  widget.imageString ?? '',
                  colorIcon: null,
                  key: _imageKey,
                  scalable: true,
                  colors: (eraser == true) ? [Colors.white] : [Colors.black],
                  initialColor: (eraser == true) ? Colors.white : Colors.black,
                  initialPaintMode: PaintMode.freeStyle,
                ),
    );
  }
}
