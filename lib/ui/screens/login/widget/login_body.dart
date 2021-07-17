import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/login_models/login_request_model.dart';
import 'package:hr_management/data/models/login_models/login_response.dart';

import 'package:hr_management/logic/blocs/login_bloc/login_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_text_box_widget.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:animated_widgets/animated_widgets.dart';

import '../login_form_bloc.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var animationStatus = 0;
  LoginRequestModel loginModel = new LoginRequestModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final int delayedAmount = 500;

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;

    return Material(
      color: Colors.white,
      child: BlocProvider(
        create: (context) => CreateLoginFormBloc(),
        child: Container(
          padding: DEFAULT_PADDING,
          child: StreamBuilder<LoginResponse>(
            builder: (context, AsyncSnapshot snapshot) {
              final createLoginFormBloc = context.read<CreateLoginFormBloc>();
              return FormBlocListener<CreateLoginFormBloc, String, String>(
                onSubmitting: (context, state) {},
                onSuccess: (context, state) {},
                onFailure: (context, state) {},
                child: Align(
                  alignment: const Alignment(0, -1 / 3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizeAnimatedWidget(
                        enabled: true,
                        duration: Duration(milliseconds: 1500),
                        values: [
                          Size(100, 100),
                          Size(100, 150),
                          Size(200, 150),
                          Size(200, 200)
                        ],
                        curve: Curves.linear,

                        //your widget
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue)),
                          child: FlutterLogo(
                            size: 50,
                            // style: FlutterLogoStyle.stacked,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: BlocTextBoxWidget(
                            prefixIcon: Icon(Icons.person),
                            fieldName: 'username',
                            readonly: false,
                            labelName: 'Username',
                            textFieldBloc: createLoginFormBloc.email,
                          )),
                      const Padding(padding: EdgeInsets.all(12)),
                      Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: BlocTextBoxWidget(
                            suffixButton: SuffixButton.obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: Icon(Icons.edit_sharp),
                            // obscureText: true,
                            fieldName: 'password',
                            readonly: false,
                            labelName: 'Password',
                            textFieldBloc: createLoginFormBloc.password,
                          )),
                      const Padding(padding: EdgeInsets.all(12)),
                      PrimaryButton(
                        buttonText: 'Login',
                        handleOnPressed: () {
                          if (createLoginFormBloc.email.value == "" ||
                              createLoginFormBloc.password.value == "") {
                            _showMyDialog();
                            return false;
                          } else {
                            loginViewModelPostRequest(
                                createLoginFormBloc.email.value,
                                createLoginFormBloc.password.value);
                          }
                        },
                        width: 100,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Please enter username and password.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  loginViewModelPostRequest(String email, String password) async {
    try {
      loginModel.email = email;
      loginModel.password = password;
      var token = await loginBloc.postData(
        loginResponseModel: loginModel,
      );
      if (token != null) {
        Navigator.pushReplacementNamed(
          context,
          NTS_TEMPLATE_REQUEST,
          arguments: ScreenArguments(
            ntstype: NTSType.service,
            arg4: 'Leave',
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('invalid username and password'),
          ),
        );
      }
    } catch (Exception) {
      throw null;
    }
  }
}
