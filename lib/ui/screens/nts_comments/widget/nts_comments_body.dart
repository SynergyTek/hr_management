import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../constants/formats.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/api_models/post_response_model.dart';
import '../../../../data/models/nts_comments/nts_comments.dart';
import '../../../../data/models/nts_comments/nts_comments_response.dart';
import '../../../../logic/blocs/nts_comments/nts_comments_bloc.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../widgets/snack_bar.dart';
import '../../../listizer/listizer.dart';
import 'package:sizer/sizer.dart';

class NTSCommentsBody extends StatefulWidget {
  NTSCommentsBody({Key? key, this.ntsType, this.ntsId}) : super(key: key);
  final NTSType? ntsType;
  final String? ntsId;
  @override
  _NTSCommentsBodyState createState() => _NTSCommentsBodyState();
}

class _NTSCommentsBodyState extends State<NTSCommentsBody> {
  @override
  void initState() {
    // ntsCommentBloc.subjectGetComments.sink.add(null);
    ntsCommentBloc.getCommentsData(
      ntsId: widget.ntsId,
      ntsType: widget.ntsType,
    );
    super.initState();
  }

  TextEditingController _commentController = new TextEditingController();
  PostComment comment = PostComment();
  List<Comment>? _commentsList;
  List<Comment> _filteredCommentsList = [];
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<CommentListResponse>(
          stream: ntsCommentBloc.subjectGetComments.stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.list == null ||
                  snapshot.data.list.length == 0) {
                return EmptyListWidget();
              }
              _commentsList = snapshot.data.list;
              return Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Listizer(
                  doAddSeperator: false,
                  listItems: _commentsList,
                  filteredSearchList: _filteredCommentsList,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue[200],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  _commentsList![index].comment!,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black87),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  dateformatter.format(DateTime.parse(
                                      _commentsList![index].commentedDate!)),
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  "Commented by: " +
                                      _commentsList![index]
                                          .commentedByUserName!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () => _handleDeleteOnPressed(
                            data: _commentsList!.elementAt(index),
                          ),
                          icon: Icon(
                            Icons.delete_forever_sharp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: CustomProgressIndicator(),
              );
            }
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Card(
            shadowColor: Colors.pink,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, bottom: 10, top: 10, right: 6),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      minLines: 1,
                      maxLines: 3,
                      controller: _commentController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "Write message...",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      if (_commentController.text != null &&
                          _commentController.text.isNotEmpty) {
                        if (widget.ntsType == NTSType.service)
                          comment.ntsServiceId = widget.ntsId;
                        else if (widget.ntsType == NTSType.task)
                          comment.ntsTaskId = widget.ntsId;
                        else
                          comment.ntsNoteId = widget.ntsId;

                        comment.comment = _commentController.text;
                        comment.commentToUserId = null;

                        setState(() {
                          isVisible = true;
                        });
                        String? resultMsg = '';
                        PostResponse result =
                            await ntsCommentBloc.postCommentData(
                          ntsType: widget.ntsType,
                          ntsId: widget.ntsId,
                          comment: comment,
                          userid: BlocProvider.of<UserModelBloc>(context)
                                  .state
                                  .userModel
                                  ?.id ??
                              '',
                        );
                        if (result.isSuccess!) {
                          setState(() {
                            isVisible = false;
                          });
                          _commentController.text = "";
                          FocusScope.of(context).requestFocus(FocusNode());
                          resultMsg = result.messages;
                        } else {
                          setState(() {
                            isVisible = false;
                          });
                          resultMsg = result.messages;
                        }
                      } else {
                        displaySnackBar(
                            text: 'Please enter some message.',
                            context: context);
                      }
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _handleDeleteOnPressed({
    required Comment data,
  }) {
    ntsCommentBloc
      ..deleteData(
        queryparams: {
          'Id': data.id,
        },
        ntsId: widget.ntsId ?? '',
        ntsType: widget.ntsType ?? NTSType.service,
      );
  }
}
