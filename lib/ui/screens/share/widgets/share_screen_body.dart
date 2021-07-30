import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';

class ShareScreenBody extends StatefulWidget {
  @override
  _ShareScreenBodyState createState() => _ShareScreenBodyState();
}

class _ShareScreenBodyState extends State<ShareScreenBody> {
  int selectedRadio;
  bool selectUser = false;
  bool selectTeam = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          color: Colors.blue[200],
          child: Column(
            children: [
              _listTile(value: 0, title: 'Share with User'),
              _listTile(value: 1, title: 'Share with Team'),
            ],
          ),
        ),
        Visibility(
          visible: selectUser,
          child: _userDropDown(),
        ),
        Visibility(
          visible: selectTeam,
          child: _teamDropDown(),
        ),
      ],
    );
  }

  _userDropDown() {
    TextEditingController _fromddController = new TextEditingController();
    return Column(
      children: [
        NTSDropDownSelect(
          isUserList: true,
          title: 'User',
          controller: _fromddController,
          hint: 'User',
          isShowArrow: true,
          onListTap: (dynamic value) {
            // userBLoc.subjectUserDataList.sink.add(null);
            // User _user = value;
            // _fromddController.text = _user.name;
            // ownerUserId = _user.id;
            //     selectValue[i] = _selectedIdNameViewModel.name;
            //     udfJson[model[i].key] = _selectedIdNameViewModel.id;
          },
        ),
      ],
    );
  }

  _teamDropDown() {
    TextEditingController _fromddController = new TextEditingController();
    return Column(
      children: [
        NTSDropDownSelect(
          isUserList: true,
          title: 'Team',
          controller: _fromddController,
          hint: 'Team',
          isShowArrow: true,
          onListTap: (dynamic value) {
            // userBLoc.subjectUserDataList.sink.add(null);
            // User _user = value;
            // _fromddController.text = _user.name;
            // ownerUserId = _user.id;
            //     selectValue[i] = _selectedIdNameViewModel.name;
            //     udfJson[model[i].key] = _selectedIdNameViewModel.id;
          },
        ),
      ],
    );
  }

  _listTile({int value, String title}) {
    return ListTile(
      leading: Radio(
        value: value,
        groupValue: selectedRadio,
        activeColor: Colors.blue[600],
        onChanged: (val) {
          setState(() {
            selectedRadio = val;
            if (val == 0) {
              selectUser = true;
              selectTeam = false;
            } else if (val == 1) {
              selectUser = false;
              selectTeam = true;
            }
          });
        },
      ),
      title: Text(title),
    );
  }
}
