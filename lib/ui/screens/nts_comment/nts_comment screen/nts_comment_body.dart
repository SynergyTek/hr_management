import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/comment_model/comment_model.dart';
import 'package:hr_management/logic/blocs/nts_comments/nts_comments_bloc.dart';

class NTSCommentBody extends StatefulWidget {
  NTSCommentBody({Key key, this.ntsType, this.ntsId}) : super(key: key);
  final NTSType ntsType;
  final String ntsId;

  @override
  _NTSCommentBodyState createState() => _NTSCommentBodyState();
}

class _NTSCommentBodyState extends State<NTSCommentBody> {
  TextEditingController _commentController=new TextEditingController();
  List<CommentMessage> messages = [
    CommentMessage(messageContent: "Hello, Will", messageType: "receiver"),
    CommentMessage(
        messageContent: "How have you been?", messageType: "receiver"),
    CommentMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    CommentMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    CommentMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: messages.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding:
                  EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: (messages[index].messageType == "receiver"
                    ? Alignment.topLeft
                    : Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (messages[index].messageType == "receiver"
                        ? Colors.grey.shade200
                        : Colors.blue[200]),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    messages[index].messageContent,
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
                    ntsCommentBloc..postCommentData(ntsType:widget.ntsType,comment: 
                      _commentController.text,ntsId: widget.ntsId,commentToUserId: null);
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
