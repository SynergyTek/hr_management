import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({Key key}) : super(key: key);

  @override
  _CreateServiceScreenState createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  TextEditingController subjectController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Create Service",
        actions: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.tag),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            height: 80,
            color: Colors.blue[100],
            child: Card(
              elevation: 0,
              color: Colors.blue[100],
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  rowChild('S-25.06.2021-5', 'Service No'),
                  rowChild('Draft', 'Status'),
                  rowChild('1', 'Version No'),
                ],
              ),
            ),
          ),
          textField(
              maxLines: 1, controller: subjectController, labelName: 'Subject'),
          textField(
              maxLines: 3,
              controller: descriptionController,
              labelName: 'Description'),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: PrimaryButton(
                  buttonText: 'Save As Draft',
                  handleOnPressed: () {},
                  width: 100,
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  buttonText: 'Submit',
                  handleOnPressed: () {},
                  width: 100,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  rowChild(String data, String field) {
    return Expanded(
      child: Column(
        children: [
          Text(
            data,
            style: TextStyle(color: Colors.blue[800], fontSize: 16),
          ),
          Text(
            field,
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
        ],
      ),
    );
  }

  textField(
      {int maxLines, TextEditingController controller, String labelName}) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        maxLines: maxLines ?? 1,
        controller: controller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: labelName,
          hintText: labelName,
        ),
      ),
    );
  }
}
