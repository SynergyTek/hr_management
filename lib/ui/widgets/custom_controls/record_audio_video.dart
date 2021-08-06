// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';
// import 'package:video_player/video_player.dart';

// import '../nts_dropdown_select.dart';

// enum t_MEDIA {
//   FILE,
//   BUFFER,
//   ASSET,
//   STREAM,
// }

// class RecordAudioVideo extends StatefulWidget {
//   RecordAudioVideo({Key key, this.onListTap, this.recordingType})
//       : super(key: key);
//   final ListTapPressedCallBack onListTap;
//   final String recordingType;
//   @override
//   _RecordAudioVideoState createState() => _RecordAudioVideoState();
// }

// class _RecordAudioVideoState extends State<RecordAudioVideo> {
//   bool _isRecording = false;
//   String _path;
//   StreamSubscription _recorderSubscription;
//   StreamSubscription _dbPeakSubscription;
//   StreamSubscription _playerSubscription;
//   FlutterSound flutterSound;
//   String type;
//   String _recorderTxt = '00:00:00';
//   double _dbLevel;

//   double sliderCurrentPosition = 0.0;
//   double maxDuration = 1.0;

//   XFile _cameraVideo;
//   RecordingFormat recordingFormat = new RecordingFormat();
//   VideoPlayerController _cameraVideoPlayerController;
//   t_MEDIA _media = t_MEDIA.FILE;
//   t_CODEC _codec = t_CODEC.CODEC_AAC;
//   @override
//   void initState() {
//     super.initState();
//     flutterSound = new FlutterSound();
//     flutterSound.setSubscriptionDuration(0.01);
//     flutterSound.setDbPeakLevelUpdate(0.8);
//     flutterSound.setDbLevelEnabled(true);
//     initializeDateFormatting();
//   }

//   void startRecorder() async {
//     try {
//       String path = await flutterSound.startRecorder(
//         codec: _codec,
//       );

//       _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
//         DateTime date = new DateTime.fromMillisecondsSinceEpoch(
//             e.currentPosition.toInt(),
//             isUtc: true);
//         String txt = DateFormat('mm:ss:SS', 'en_GB').format(date);

//         this.setState(() {
//           this._recorderTxt = txt.substring(0, 8);
//         });
//       });
//       _dbPeakSubscription =
//           flutterSound.onRecorderDbPeakChanged.listen((value) {
//         setState(() {
//           this._dbLevel = value;
//         });
//       });

//       this.setState(() {
//         this._isRecording = true;
//         this._path = path;
//       });
//     } catch (err) {
//       setState(() {
//         this._isRecording = false;
//       });
//     }
//   }

//   void stopRecorder() async {
//     try {
//       String result = await flutterSound.stopRecorder();

//       if (_recorderSubscription != null) {
//         _recorderSubscription.cancel();
//         _recorderSubscription = null;
//       }
//       if (_dbPeakSubscription != null) {
//         _dbPeakSubscription.cancel();
//         _dbPeakSubscription = null;
//       }
//       recordingFormat.type = "Audio";
//       recordingFormat.path = _path;
//       this.setState(() {
//         this._isRecording = false;
//       });
//     } catch (err) {}
//     this.setState(() {
//       this._isRecording = false;
//     });
//   }

//   Future<bool> fileExists(String path) async {
//     return await File(path).exists();
//   }

//   // In this simple example, we just load a file in memory.This is stupid but just for demonstation  of startPlayerFromBuffer()
//   Future<Uint8List> makeBuffer(String path) async {
//     try {
//       if (!await fileExists(path)) return null;
//       File file = File(path);
//       file.openRead();
//       var contents = await file.readAsBytes();
//       print('The file is ${contents.length} bytes long.');
//       return contents;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   void startPlayer() async {
//     try {
//       String path = null;
//       // if (_media == t_MEDIA.ASSET) {
//       //     Uint8List buffer =  (await rootBundle.load(assetSample[_codec.index])).buffer.asUint8List();
//       //     path = await flutterSound.startPlayerFromBuffer(buffer, codec: _codec,);
//       // } else
//       if (_media == t_MEDIA.FILE) {
//         // Do we want to play from buffer or from file ?
//         if (await fileExists(_path))
//           path = await flutterSound.startPlayer(_path); // From file
//       }
//       if (path == null) {
//         print('Error starting player');
//         return;
//       }
//       print('startPlayer: $path');
//       await flutterSound.setVolume(1.0);

//       _playerSubscription = flutterSound.onPlayerStateChanged.listen((e) {
//         if (e != null) {
//           sliderCurrentPosition = e.currentPosition;
//           maxDuration = e.duration;

//           DateTime date = new DateTime.fromMillisecondsSinceEpoch(
//               e.currentPosition.toInt(),
//               isUtc: true);
//           String txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
//           this.setState(() {
//             //this._isPlaying = true;
//             print(txt.substring(0, 8));
//           });
//         }
//       });
//     } catch (err) {
//       print('error: $err');
//     }
//     setState(() {});
//   }

//   onStartPlayerPressed() {
//     if (_media == t_MEDIA.FILE || _media == t_MEDIA.BUFFER) {
//       if (_path == null) return null;
//     }
//     return flutterSound.audioState == t_AUDIO_STATE.IS_STOPPED
//         ? startPlayer
//         : null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.recordingType + ' Recorder'),
//         actions: appBarActions(),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Visibility(
//             visible: widget.recordingType == "Audio" ? true : false,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Card(
//                   elevation: 5,
//                   margin: EdgeInsets.all(5),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Text(
//                               "Start/Stop Recording",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Theme.of(context).primaryColor),
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                               child: Text(
//                                 this._recorderTxt,
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   color: Colors.black45,
//                                 ),
//                               ),
//                             ),
//                             TextButton(
//                                 onPressed: () {
//                                   if (!this._isRecording) {
//                                     return this.startRecorder();
//                                   }
//                                   this.stopRecorder();
//                                 },
//                                 style: TextButton.styleFrom(
//                                     padding: EdgeInsets.all(8.0)),
//                                 child: CircleAvatar(
//                                   backgroundColor: _isRecording
//                                       ? Colors.red
//                                       : Theme.of(context).primaryColor,
//                                   child: Icon(
//                                     this._isRecording ? Icons.stop : Icons.mic,
//                                     color: Colors.white,
//                                   ),
//                                 )),
//                           ],
//                         ),
//                       ),
//                       Visibility(
//                         visible: _path != null,
//                         child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               primary: Theme.of(context).primaryColor,
//                             ),
//                             onPressed: onStartPlayerPressed(),
//                             child: Label(
//                               text: "Play",
//                               fontSize: 14,
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Visibility(
//             visible: widget.recordingType == "Video" ? true : false,
//             child: Column(
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {
//                     _pickVideoFromCamera();
//                   },
//                   child: Text("Pick Video From Camera"),
//                 ),
//                 if (_cameraVideo != null)
//                   _cameraVideoPlayerController.value.isInitialized
//                       ? AspectRatio(
//                           aspectRatio:
//                               _cameraVideoPlayerController.value.aspectRatio,
//                           child: VideoPlayer(_cameraVideoPlayerController),
//                         )
//                       : Container()
//                 // else
//                 //   Text("Click on Pick Video to select video", style: TextStyle(fontSize: 18.0),),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   _pickVideoFromCamera() async {
//     XFile video = await ImagePicker().pickVideo(source: ImageSource.camera);
//     _cameraVideo = video;

//     recordingFormat.type = "Video";
//     recordingFormat.path = _cameraVideo.path;
//     _path = _cameraVideo.path;
//     _cameraVideoPlayerController = VideoPlayerController.file(_cameraVideo)
//       ..initialize().then((_) {
//         setState(() {});
//         _cameraVideoPlayerController.play();
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     if (flutterSound.isRecording) {
//       flutterSound.stopRecorder();
//     }
//     if (_cameraVideoPlayerController != null) {
//       _cameraVideoPlayerController.dispose();
//     }
//   }

//   List<Widget> appBarActions() {
//     List<Widget> actionWidgets = [];

//     actionWidgets.add(Padding(
//         padding: const EdgeInsets.only(right: 10.0),
//         child: IconSlideAction(
//             caption: 'Done',
//             color: Theme.of(context).primaryColor,
//             icon: Icons.launch,
//             onTap: () {
//               widget.onListTap(recordingFormat, null);
//               Navigator.pop(context);
//             })));

//     return actionWidgets;
//   }
// }

// class RecordingFormat {
//   String path;
//   String type;
// }
