import 'package:flutter/material.dart';
import 'package:hr_management/constants/formats.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/api_models/post_response_model.dart';
import 'package:hr_management/data/models/nts_comments/nts_comments.dart';
import 'package:hr_management/data/models/nts_comments/nts_comments_response.dart';
import 'package:hr_management/logic/blocs/nts_comments/nts_comments_bloc.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class NTSCommentsBody extends StatefulWidget {
  NTSCommentsBody({Key key, this.ntsType, this.ntsId}) : super(key: key);
  final NTSType ntsType;
  final String ntsId;
  @override
  _NTSCommentsBodyState createState() => _NTSCommentsBodyState();
}

class _NTSCommentsBodyState extends State<NTSCommentsBody> {
  @override
  void initState() {
    ntsCommentBloc.getCommentsData(
        ntsId: widget.ntsId, ntsType: widget.ntsType);
    super.initState();
  }

  TextEditingController _commentController = new TextEditingController();
  PostComment comment = new PostComment();
  List<Comment> _commentsList = [];
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
                    // print("Snapshot data: ${snapshot.data.data[index].taskNo}");
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: //(messages[index].messageType == "receiver"
                            // ? Alignment.topLeft:
                            Alignment.topRight, //),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: // (messages[index].messageType == "receiver"
                                //? Colors.grey.shade200:
                                Colors.blue[200], //),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                _commentsList[index].comment,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black87),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                dateformatter.format(DateTime.parse(
                                    _commentsList[index].commentedDate)),
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.right,
                              ),
                               Text(
                                "Commented by: "+
                                    _commentsList[index].commentedByUserName,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              // return Visibility(
              //   visible: isVisible,
                return Center(
                  child: CustomProgressIndicator(),
                // ),
              );
            }
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.white,
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
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    comment.comment = _commentController.text;
                    comment.ntsTaskId = widget.ntsId;
                    comment.commentToUserId = null;
                    comment.commentedByUserId =
                        '45bba746-3309-49b7-9c03-b5793369d73c';
                    setState(() {
                      isVisible = true;
                    });
                    String resultMsg = '';
                    PostResponse result = await ntsCommentBloc.postCommentData(
                        ntsType: widget.ntsType,ntsId: widget.ntsId, comment: comment);
                    if (result.isSuccess) {
                      setState(() {
                        isVisible = false;
                      });
                      _commentController.text="";
                      FocusScope.of(context).requestFocus(new FocusNode());
                      resultMsg = result.messages;
                      // Navigator.pop(context);
                    } else {
                      setState(() {
                        isVisible = false;
                      });
                      resultMsg = result.messages;
                    }
                  },
                  child: Icon(
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
      ],
    );
  }
}
