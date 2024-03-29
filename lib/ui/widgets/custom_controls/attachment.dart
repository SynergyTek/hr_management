import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/attacment/attachment_model.dart';
import 'package:hr_management/data/models/attacment/video_file.dart';
import 'package:hr_management/logic/blocs/attachment_nts_bloc/attachment_nts_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import 'package:mime_type/mime_type.dart';
import 'package:video_player/video_player.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/light_theme.dart';
import '../custom_icons.dart';
import '../snack_bar.dart';
import 'body_layout_widget.dart';
import 'label.dart';
import 'package:synergy_nts/synergy_nts.dart';

typedef OnTapPressedCallBack = void Function(
  dynamic key,
  dynamic key2,
  dynamic key3,
);

class SelectAttachment extends StatefulWidget {
  final dynamic selectedModel;
  final NTSType? ntstype;
  final OnTapPressedCallBack? onListTap;
  final String? ntsId;

  SelectAttachment({
    Key? key,
    this.selectedModel,
    this.ntstype,
    this.onListTap,
    this.ntsId,
  }) : super(key: key);

  _SelectAttachmentState createState() => _SelectAttachmentState();
}

class _SelectAttachmentState extends State<SelectAttachment> {
  TextEditingController _descriptionController = new TextEditingController();
  var _formStateKey = GlobalKey<FormState>();
  String? _fileName;
  String? _path;
  List<String?>? _paths;
  FilePickerResult? filePickerResult;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool loading = false;

  MediaFileType? _pickingType;
  late FileType _fileType;
  String _documentType = "";
  TextEditingController _controller = new TextEditingController();
  RecordingFormat _recordingFormat = new RecordingFormat();
  AnimationController? animationController;
  Animation<double>? animation;
  bool _isBusy = false;
  XFile? _imageFile;

  @override
  void initState() {
    _controller.addListener(() => _extension);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: _isBusy,
      child: Scaffold(
          appBar: AppBar(
            title: Label(
              text: "Attachments",
              fontSize: 18.0,
            ),
          ),
          body: BodyLayout(
            childWidget: Form(
              key: _formStateKey,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  loading = !loading;
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Text('CHOOSE ATTACHMENT'),
                                  Icon(Icons.attach_file),
                                ],
                              ))),
                      ElevatedButton(
                        onPressed: () {
                          if (_pickingType != null) {
                            uploadAttachment();
                          } else {
                            displaySnackBar(
                                text: "No attachment found", context: context);
                          } // uploadAttachment();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        child: Label(
                          text: "Upload",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      new Builder(
                        builder: (BuildContext context) => _loadingPath
                            ? Center(
                                child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: CircularProgressIndicator(
                                      backgroundColor: LightTheme()
                                          .lightThemeData()
                                          .primaryColor,
                                    )),
                              )
                            : _path != null || _paths != null
                                ? new Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                    child: new Scrollbar(
                                        child: new ListView.separated(
                                      itemCount:
                                          _paths != null && _paths!.isNotEmpty
                                              ? _paths!.length
                                              : 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final bool isMultiPath =
                                            _paths != null &&
                                                _paths!.isNotEmpty;
                                        final String name = 'File $index: ' +
                                            (isMultiPath
                                                ? _paths!.toList()[index]!
                                                : _fileName ?? '...');
                                        // final path = isMultiPath
                                        //     ? _paths.values
                                        //         .toList()[index]
                                        //         .toString()
                                        //     : _path;

                                        return new ListTile(
                                          title: new Text(
                                            name,
                                          ),
                                          // subtitle: new Text(path),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              new Divider(),
                                    )),
                                  )
                                : new Container(),
                      ),
                      IgnorePointer(
                        ignoring: !loading,
                        child: AnimatedOpacity(
                          opacity: loading ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: attachmentWidget()),
                        ),
                      ),
                    ],
                  ),
                  // AttachmentList(
                  //   attachmentId: _ntsId,
                  //   attachmentType: _ntstype,
                  // ),
                  Visibility(
                      visible: _isBusy,
                      child: Center(child: CustomProgressIndicator())),
                ],
              ),
            ),
          )),
    );
  }

  _handleNoteDetailsQueryparams({
    String? templatecode,
    String? noteId,
    String? userid,
  }) {
    return {
      'templatecode': templatecode,
      'noteId': noteId,
      'userid': userid,
    };
  }

  void _openFileExplorer() async {
    if (_pickingType == MediaFileType.VIDEO) {
      _fileType = FileType.video;
    } else if (_pickingType == MediaFileType.AUDIO) {
      _fileType = FileType.audio;
    } else if (_pickingType == MediaFileType.IMAGE) {
      _fileType = FileType.image;
    } else if (_pickingType == MediaFileType.CAPTURE_IMAGE) {
      _fileType = FileType.image;
    } else if (_pickingType == MediaFileType.CUSTOM) {
      _fileType = FileType.custom;
    } else if (_pickingType == MediaFileType.ANY) {
      _fileType = FileType.any;
    }
    setState(() => _loadingPath = true);
    try {
      if (_multiPick) {
        _path = null;
        filePickerResult = await FilePicker.platform.pickFiles(
            allowMultiple: true,
            type: _fileType,
            allowedExtensions: (_extension?.isNotEmpty ?? false)
                ? _extension?.replaceAll(' ', '').split(',')
                : null);
        _paths = filePickerResult!.paths;
      } else {
        _paths = null;
        filePickerResult = await FilePicker.platform.pickFiles(
            type: _fileType,
            allowedExtensions: (_extension?.isNotEmpty ?? false)
                ? _extension?.replaceAll(' ', '').split(',')
                : null);
        _path = filePickerResult?.files.single.path;
      }
    } on Exception catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _path != null
          ? _path!.split('/').last
          : _paths != null
              ? _paths.toString()
              : '...';
    });
  }

  Future<Uint8List?> _readFileByte(String filePath) async {
    Uri myUri = Uri.parse(filePath);
    File mediaFile = new File.fromUri(myUri);
    Uint8List? bytes;
    await mediaFile.readAsBytes().then((value) {
      bytes = Uint8List.fromList(value);
    }).catchError((onError) {
      print('Exception Error while reading audio from path:' +
          onError.toString());
    });
    return bytes;
  }

  String resultMsg = '';
  void uploadAttachment() async {
    try {
      setState(() {
        _isBusy = true;
      });
      Uint8List? mediaFileByte;
      await _readFileByte(_path!).then((bytesData) {
        mediaFileByte = bytesData;
      });

      var post = Attachment();

      post.userId =
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '';

      if (_pickingType == MediaFileType.IMAGE ||
          _pickingType == MediaFileType.CAPTURE_IMAGE) {
        _documentType = "image";
        post.name = 'Image';
        createPostModel(post, mediaFileByte!);
      } else if (_pickingType == MediaFileType.AUDIO ||
          _recordingFormat.type == "Audio") {
        _documentType = "audio";
        post.name = 'Audio';
        createPostModel(post, mediaFileByte!);
      } else if (_pickingType == MediaFileType.VIDEO ||
          _recordingFormat.type == "Video") {
        _documentType = "video";
        post.name = 'Video';
        createPostModel(post, mediaFileByte!);
        post.fileType = "mp4";
      } else if (_pickingType == MediaFileType.CUSTOM ||
          _pickingType == MediaFileType.ANY) {
        post.name = _fileName;
        createPostModel(post, mediaFileByte!);
      }

      String result = await attachmentNTSBloc.postAttachmentDocumentData(
        attachmentData: post,
      );

      print(result);
      if (result.isNotEmpty) {
        setState(() {
          _isBusy = false;
        });
        resultMsg = "File Uploaded";
      } else {
        setState(() {
          _isBusy = false;
        });
        resultMsg = "File Not Uploaded";
      }
      displaySnackBar(text: resultMsg, context: context);
      // var result = await imageUploadRequest(post, context);
      if (result != null) {
        widget.onListTap!(result, _fileName, _pickingType);
      }

      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  void createPostModel(Attachment post, Uint8List mediaFileByte) {
    post.ntsId = widget.ntsId;
    post.userId = context.read<UserModelBloc>().state.userModel?.id ?? '';
    //'45bba746-3309-49b7-9c03-b5793369d73c';
    post.fileType = ("." + _path!.split(".")[_path!.split(".").length - 1])
        .replaceAll(".", "");
    post.isNtsComments = false;
    // post.ntsId = _ntsId; // only for comments we need to send
    post.ntsType = widget.ntstype == NTSType.service
        ? 'NTS_Service'
        : widget.ntstype == NTSType.task
            ? 'NTS_Task'
            : 'NTS_Note';
    post.comment = _descriptionController.text;
    var mediaFile = new VideoFile();
    mediaFile.fileName = _path!.split('/').last;
    mediaFile.imageData = "";
    mediaFile.mimeType = mime(_path);
    mediaFile.stringData = base64Encode(mediaFileByte);
    post.images = [];
    post.images!.add(mediaFile);
  }

  void getRecordedAVPath(dynamic value, dynamic value2) {
    _recordingFormat = value;
    _path = _recordingFormat.path;
    setState(() => _loadingPath = true);
    // print(_path);
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _path != null
          ? _path!.split('/').last
          : _paths != null
              ? _paths.toString()
              : '...';
    });
  }

  VideoPlayerController? _vcontroller;
  bool isVideo = false;
  void _onImageButtonPressed(ImageSource source) async {
    if (_vcontroller != null) {
      await _vcontroller!.setVolume(0.0);
    }
    try {
      _imageFile = await ImagePicker().pickImage(
          source: source, maxWidth: 300, maxHeight: 300, imageQuality: 50);
      _path = _imageFile!.path;
      setState(() => _loadingPath = true);
      // print(_path);
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path!.split('/').last
            : _paths != null
                ? _paths.toString()
                : '...';
      });
    } catch (e) {
      // _pickImageError = e;
    }
    // }
  }

  Widget attachmentWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      height: 30.h,
      width: double.infinity,
      decoration: new BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: GridView(
        padding: EdgeInsets.symmetric(horizontal: 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 10),
        children: <Widget>[
          fabIconText(CustomIcons.image, "IMAGE", Colors.deepPurple, '1',
              MediaFileType.IMAGE),
          fabIconText(CustomIcons.file_audio, "AUDIO", Colors.deepOrange, '2',
              MediaFileType.AUDIO),
          fabIconText(CustomIcons.video, "VIDEO", Colors.blue, '3',
              MediaFileType.VIDEO),
          fabIconText(CustomIcons.camera, "CAPTURE IMAGE", Colors.amber, '4',
              MediaFileType.CAPTURE_IMAGE),
          // fabIconText(CustomIcons.file_audio, "RECORD AUDIO", Colors.indigo,
          //     '5', MediaFileType.RECORD_AUDIO),
          // fabIconText(CustomIcons.video_plus, "RECORD VIDEO", Colors.cyan, '6',
          //     MediaFileType.RECORD_VIDEO),
          // fabIconText(CustomIcons.file_pdf, "PDF", Colors.redAccent, '7',
          //     MediaFileType.CUSTOM),
          fabIconText(CustomIcons.file_plus, "ANY", Colors.green, '8',
              MediaFileType.ANY)
        ],
      ),
    );
  }

  fabIconText(
      IconData icon, String label, var color, String tag, MediaFileType type) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: color,
          heroTag: tag,
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _pickingType = type;
              _controller.text = _extension = '';
              // if (_pickingType == MediaFileType.RECORD_AUDIO) {
              //   pushtoRecordAudioVideo(context, getRecordedAVPath, "Audio");
              // } else if (_pickingType == MediaFileType.RECORD_VIDEO) {
              //   pushtoRecordAudioVideo(context, getRecordedAVPath, "Video");
              // } else
              if (_pickingType == MediaFileType.CAPTURE_IMAGE) {
                _onImageButtonPressed(ImageSource.camera);
              } else if (_pickingType == MediaFileType.CUSTOM) {
                _controller.text = _extension = 'pdf';
                _openFileExplorer();
              } else {
                _openFileExplorer();
              }
              loading = !loading;
            });
          },
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

enum MediaFileType {
  IMAGE,
  CAPTURE_IMAGE,
  AUDIO,
  VIDEO,
  RECORD_AUDIO,
  RECORD_VIDEO,
  CUSTOM,
  ANY
}

class RecordingFormat {
  String? path;
  String? type;
}
