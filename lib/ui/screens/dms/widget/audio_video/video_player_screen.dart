// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:open_file/open_file.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:photo_view/photo_view.dart';

// class AudioVideoScreen extends StatefulWidget {
//   final String? fromScreen;
//   final String? tag;
//   final String? mediaSrc;
//   final String? mediaType;

//   AudioVideoScreen({
//     this.mediaSrc,
//     this.tag,
//     this.mediaType,
//     this.fromScreen,
//   });

//   @override
//   _AudioVideoScreenState createState() => _AudioVideoScreenState();
// }

// class _AudioVideoScreenState extends State<AudioVideoScreen> {
//   String corruptedPathPDF = "";
//   int pages = 0;
//   bool isReady = false;
//   String errorMessage = '';
//   final Completer<PDFViewController> _controller =
//       Completer<PDFViewController>();

//   int _stackToView = 1;

//   void _handleLoad(String value) {
//     setState(() {
//       _stackToView = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.grey,
//         child: SafeArea(
//           child: Container(
//             color: Colors.black,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                     // popBack(context);
//                   },
//                 ),
//                 Expanded(
//                   child: Center(
//                     child: Container(
//                       color: Colors.black,
//                       height: MediaQuery.of(context).size.height - 100,
//                       width: MediaQuery.of(context).size.width,
//                       child:
//                           Hero(tag: widget.tag!, child: getChildByMediaType()),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FutureBuilder<PDFViewController>(
//         future: _controller.future,
//         builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
//           if (snapshot.hasData) {
//             return FloatingActionButton.extended(
//               label: Text("Go to ${pages ~/ 2}"),
//               onPressed: () async {
//                 await snapshot.data?.setPage(pages ~/ 2);
//               },
//             );
//           }

//           return Container();
//         },
//       ),
//     );
//   }

//   Widget getChildByMediaType() {
//     if (widget.mediaType == 'PHOTO') {
//       return widget.fromScreen != "DigitalDocuments"
//           ? PhotoView(
//               imageProvider: NetworkImage(widget.mediaSrc!),
//             )
//           : Image.file(File(widget.mediaSrc!));
//     } else if (widget.mediaType == 'VIDEO' || widget.mediaType == "AUDIO") {
//       return WebView(
//         initialUrl: widget.mediaSrc,
//         javascriptMode: JavascriptMode.unrestricted,
//         initialMediaPlaybackPolicy:
//             AutoMediaPlaybackPolicy.require_user_action_for_all_media_types,
//       );
//     } else if (widget.mediaType == 'DOCFILES') {
//       OpenFile.open(widget.mediaSrc);
//     } else if (widget.mediaType == 'PDF') {
//       // return widget.fromScreen != "DigitalDocuments"
//       //     ?
//       return PDFView(
//         filePath: widget.mediaSrc,
//         enableSwipe: true,
//         swipeHorizontal: true,
//         autoSpacing: true,
//         pageFling: true,
//         onRender: (_pages) {
//           setState(() {
//             pages = _pages!;
//             isReady = true;
//           });
//         },
//         onError: (error) {
//           setState(() {
//             errorMessage = error.toString();
//           });
//           // print(error.toString());
//         },
//         onPageError: (page, error) {
//           setState(() {
//             errorMessage = '$page: ${error.toString()}';
//           });
//           // print('$page: ${error.toString()}');
//         },
//         onViewCreated: (PDFViewController pdfViewController) {
//           _controller.complete(pdfViewController);
//         },
//         // onPageChanged: (int page, int total) {
//         //   // print('page change: $page/$total');
//         // },
//       );
//       // : WebView(
//       //     initialUrl: widget.mediaSrc,
//       //     javascriptMode: JavascriptMode.unrestricted,
//       //     initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy
//       //         .require_user_action_for_all_media_types,
//       //   );
//     } else if (widget.mediaType == 'URL') {
//       return IndexedStack(
//         index: _stackToView,
//         children: [
//           Column(
//             children: <Widget>[
//               Expanded(
//                   child: WebView(
//                 javascriptMode: JavascriptMode.unrestricted,
//                 initialUrl: widget.mediaSrc,
//                 onPageFinished: _handleLoad,
//               )),
//             ],
//           ),
//           Container(
//             color: Colors.white,
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//         ],
//       );
//     }
//     return Container();
//   }
// }
