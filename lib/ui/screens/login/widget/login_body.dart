import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../../../data/models/login_models/login_response_model.dart';
import '../../../widgets/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/models/login_models/login_request_model.dart';
import '../../../../data/models/login_models/login_response.dart';

import '../../../../logic/blocs/login_bloc/login_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/form_widgets/bloc_text_box_widget.dart';
import '../../../widgets/primary_button.dart';
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
  bool showCPI = false;

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;

    return Material(
      color: Colors.white,
      child: BlocProvider(
        create: (context) => CreateLoginFormBloc(),
        child: Stack(
          children: [
            Container(
              padding: DEFAULT_PADDING,
              child: StreamBuilder<LoginAPIResponse>(
                builder: (context, AsyncSnapshot snapshot) {
                  final createLoginFormBloc =
                      context.read<CreateLoginFormBloc>();
                  return FormBlocListener<CreateLoginFormBloc, String, String>(
                    onSubmitting: (context, state) {},
                    onSuccess: (context, state) {},
                    onFailure: (context, state) {},
                    child: Align(
                      alignment: const Alignment(0, -1 / 3),
                      child: SingleChildScrollView(
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
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                child: BlocTextBoxWidget(
                                  prefixIcon: Icon(Icons.person),
                                  fieldName: 'username',
                                  readonly: false,
                                  labelName: 'Username',
                                  textFieldBloc: createLoginFormBloc.email,
                                )),
                            // const Padding(padding: EdgeInsets.all(12)),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
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
                                  setState(() {
                                    showCPI = true;
                                  });
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
                    ),
                  );
                },
              ),
            ),
            Visibility(
              visible: showCPI,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
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
    Map<String, dynamic> queryparams = Map();

    if (email != null) queryparams['username'] = email;
    if (password != null) queryparams['password'] = password;

    try {
      LoginResponseModel data = await loginBloc.postData(
        queryparams: queryparams,
      );
      if (data != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', data.userName);
        prefs.setString('id', data.id);

        setState(() {
          showCPI = false;
        });
        displaySnackBar(text: 'Login successful!', context: context);
        Navigator.pushReplacementNamed(
          context,
          WORKLIST_DASHBOARD,
        );
      } else {
        setState(() {
          showCPI = false;
        });
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
