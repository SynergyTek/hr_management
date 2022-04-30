import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../../../synergy_nts.dart';
import '../../../bloc/nts_comments/nts_comments_bloc.dart';
import '../../../helpers/snackbar_helper/snackbar_helper.dart';
import '../../../models/nts_comments/nts_comments.dart';
import '../../../models/nts_comments/nts_comments_response.dart';
import '../../../theme/light_theme.dart';
import '../../widgets/custom_progress_indicator.dart';
import '../../widgets/empty_list_widget.dart';
import '../../widgets/listizer.dart';
import 'package:sizer/sizer.dart';

class NTSCommentsBody extends StatefulWidget {
  const NTSCommentsBody({Key? key, this.ntsId, this.userId}) : super(key: key);
  final String? ntsId;
  final String? userId;
  @override
  _NTSCommentsBodyState createState() => _NTSCommentsBodyState();
}

class _NTSCommentsBodyState extends State<NTSCommentsBody> {
  var dateformatter = DateFormat("dd MMM yyyy");

  @override
  void initState() {
    // ntsCommentBloc.subjectGetComments.sink.add(null);
    ntsCommentBloc.getCommentsData(
      ntsId: widget.ntsId,
    );
    super.initState();
  }

  final TextEditingController _commentController = TextEditingController();
  PostComment comment = PostComment();
  List<Comment>? _commentsList = [];
  final List<Comment> _filteredCommentsList = [];
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
                padding: const EdgeInsets.only(bottom: 80),
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
                      ],
                    );
                  },
                ),
              );
            } else {
              return const Center(
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
                        comment.ntsTaskId = widget.ntsId;

                        comment.comment = _commentController.text;
                        comment.commentToUserId = null;

                        setState(() {
                          isVisible = true;
                        });
                        String? resultMsg = '';
                        PostResponse result =
                            await ntsCommentBloc.postCommentData(
                          ntsId: widget.ntsId,
                          comment: comment,
                          userid: widget.userId,
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
                    backgroundColor: LightTheme().lightThemeData().primaryColor,
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

  // _handleDeleteOnPressed({
  //   required Comment data,
  // }) {
  //   ntsCommentBloc.deleteData(
  //     queryparams: {
  //       'Id': data.id,
  //     },
  //     ntsId: widget.ntsId ?? '',
  //     ntsType: widget.ntsType ?? NTSType.service,
  //   );
  // }
}
