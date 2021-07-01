import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.only(top: 30),
      child: Card(
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.list_alt_sharp,
                color: Theme.of(context).primaryColorLight,
                size: 125.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "No Record Found",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
