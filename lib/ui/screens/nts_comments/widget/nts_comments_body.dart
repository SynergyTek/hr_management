import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/nts_comments/nts_comments.dart';
import 'package:hr_management/logic/blocs/nts_comments/nts_comments_bloc.dart';

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
    ntsCommentBloc.getCommentsData(ntsId: widget.ntsId);
    super.initState();
    
  }
  TextEditingController _commentController = new TextEditingController();
  PostComment comment = new PostComment();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding:
                  EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
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
                  child: Text(
                    'hi..its a new comment',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            );
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
                  onPressed: () {
                    comment.comment = _commentController.text;
                    comment.ntsTaskId = widget.ntsId;
                    comment.commentToUserId = null;
                    comment.commentedByUserId =
                        '45bba746-3309-49b7-9c03-b5793369d73c';
                    ntsCommentBloc
                      ..postCommentData(
                          ntsType: widget.ntsType, comment: comment);
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
