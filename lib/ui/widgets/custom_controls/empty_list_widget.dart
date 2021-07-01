import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Card(
        child: ListTile(
          title: Column(
            children: <Widget>[
              Icon(Icons.tag_faces,color: Theme.of(context).primaryColor, size: 35.0,),
              SizedBox(height: 5.0,),
              Text("No Record Found", textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, color: Colors.black87),),
            ],
          ),
        ),
      ),
    );
  }
}