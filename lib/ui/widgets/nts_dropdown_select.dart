import 'package:flutter/material.dart';

typedef ListTapPressedCallBack = void Function(dynamic key);
class NTSDropDownSelect extends StatelessWidget {
  final String title;
  final bool isShowArrow;
  final String hint;
  final String validationMessage;
  final TextEditingController controller;
  final Widget prefixIcon;
  final FormFieldValidator<String> validator;
  // final List<IdNameViewModel> viewModelList;
  final ListTapPressedCallBack onListTap;
  NTSDropDownSelect(
      {Key key,
      this.title,
      this.isShowArrow,
      this.hint,
      this.validationMessage,
      this.controller,
      this.prefixIcon,
      this.validator,
      // this.viewModelList,
      this.onListTap
      })
      : super(key: key);

  // NetworkHelper _networkHelper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom: 10.0),
      alignment: Alignment.bottomLeft,
      height: 80.0,
      child: Stack(
        children: <Widget>[
          new TextFormField(
            style: Theme.of(context).textTheme.body1,
            controller: controller,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                prefixIcon:
                    prefixIcon != null ? prefixIcon : Icon(Icons.select_all),
                suffixIcon:
                    isShowArrow ? Icon(Icons.keyboard_arrow_right) : null,
                // filled: true,
                labelText: "Select " + title,
                hintText: "Select " + hint,
                errorStyle: TextStyle(fontSize: 11.0)),
            maxLines: 1,
            validator: validator != null
                ? validator
                : (String value) {
                    if (value.isEmpty) {
                      return validationMessage;
                    }
                  },
            onSaved: (String value) {
              controller.text = value;
            },
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // _networkHelper.initConnectivity().then((value) {
              //   if (value) {
                  // pushtoNTSDropDownList(context, onListTap, viewModelList);
              //   } else {
              //     return networkRaisedToast(context);
              //   }
              // }, onError: (error) {
              //   // print(error);
              // });
            },
          )
        ],
      ),
    );
  }
}
