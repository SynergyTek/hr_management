import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hr_management/constants/image_path_constants.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/helpers/download_helper/download_helper_new.dart';
import 'package:hr_management/data/models/login_models/portal_response_view_model.dart';
import 'package:hr_management/data/models/login_models/portal_view_model.dart';
import 'package:hr_management/logic/blocs/location_bloc/location_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/ui/screens/portal_screen/portal_screen.dart';
import '../../../../data/models/login_models/extra_user_information_model.dart';
import '../../../../data/models/login_models/login_response_model.dart';
import '../../../../data/models/login_models/login_request_model.dart';
import '../../../../data/models/login_models/login_response.dart';

import '../../../../logic/blocs/login_bloc/login_bloc.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/form_widgets/bloc_text_box_widget.dart';
import '../../../widgets/primary_button.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:animated_widgets/animated_widgets.dart';

import '../login_form_bloc.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key? key}) : super(key: key);

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
  bool isPasswordVisible = false;
  bool isUsernameVisible = true;
  final _formKey = GlobalKey<FormState>();
  LoginResponseModel user = new LoginResponseModel();
  List<PortalViewModel> portalList = <PortalViewModel>[];
  String? selectedPortal;

  @override
  void initState() {
    super.initState();

    LocationBloc().checkForLocationPermission();
    NewDownloadHelper().handlePermissions();
  }

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
                            Container(
                              child: Image.asset(
                                SYNERGY_LOGO,
                                height: 250,
                                width: 250,
                              ),
                            ),
                            Visibility(
                              visible: isUsernameVisible,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 12),
                                  child: BlocTextBoxWidget(
                                    prefixIcon: Icon(Icons.person),
                                    fieldName: 'username',
                                    readonly: false,
                                    labelName: 'Username',
                                    textFieldBloc: createLoginFormBloc.email,
                                  )),
                            ),
                            // const Padding(padding: EdgeInsets.all(12)),
                            Visibility(
                              visible: isPasswordVisible,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
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
                            ),
                            Visibility(
                              visible: isPasswordVisible,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Form(
                                    key: _formKey,
                                    child: DropdownButtonFormField2(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      isExpanded: true,
                                      hint: const Text(
                                        'Select Portal',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      iconSize: 24,
                                      buttonHeight: 64,
                                      buttonPadding: const EdgeInsets.only(
                                          left: 16, right: 8),
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      items: portalList
                                          .toList()
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item.id,
                                                child: Text(
                                                  item.name ?? "-",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please select portal.';
                                        }
                                      },
                                      onChanged: (value) {},
                                      onSaved: (value) {
                                        setState(() {
                                          selectedPortal = value.toString();
                                        });
                                      },
                                    )),
                              ),
                            ),

                            const Padding(padding: EdgeInsets.all(12)),
                            Visibility(
                              visible: !isPasswordVisible,
                              child: PrimaryButton(
                                buttonText: 'Login',
                                handleOnPressed: () {
                                  if (createLoginFormBloc.email.value == "") {
                                    _showMyDialog();
                                    return false;
                                  } else {
                                    setState(() {
                                      //showCPI = true;
                                      isPasswordVisible = true;
                                      getPortalListByEmail(
                                          createLoginFormBloc.email.value);
                                      isUsernameVisible = true;
                                    });
                                  }
                                },
                                width: 100,
                              ),
                            ),
                            Visibility(
                              visible: isPasswordVisible,
                              child: PrimaryButton(
                                buttonText: 'Verify',
                                handleOnPressed: () {
                                  if (createLoginFormBloc.email.value == "" ||
                                      createLoginFormBloc.password.value ==
                                          "") {
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

  Future<void> getPortalListByEmail(String? email) async {
    Map<String, dynamic> queryparams = Map();

    if (email != null) queryparams['email'] = email;

    print("Login Params: ");
    print(email);

    try {
      var data = await loginBloc.getPortalListByEmail(
        queryparams: queryparams,
      );
      if (data != null) {
        setState(() {
          portalList = data;
          // onPortalSelect();
        });
      }
    } catch (e) {
      throw e.toString();
    }
  }

  void onPortalSelect() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    // Setting up the portal type and
    // saving up the saved portal to the hydrated bloc.
    BlocProvider.of<UserModelBloc>(context).add(
      UserModelChangeEvent(
        userModel: user,
        extraUserInformation: ExtraUserInformationModel(
          isSignedIn: false,
          portalType: selectedPortal,
        ),
      ),
    );

    // Redirect to Home screen.
    Navigator.pushReplacementNamed(
      context,
      WORKLIST_DASHBOARD,
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
                Text('Please enter username.'),
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

  loginViewModelPostRequest(
    String? email,
    String? password,
  ) async {
    Map<String, dynamic> queryparams = Map();

    if (email != null) queryparams['username'] = email;
    if (password != null) queryparams['password'] = password;

    print("Login Params: ");
    print(email);
    print(password);

    try {
      LoginResponseModel? data = await loginBloc.postData(
        queryparams: queryparams,
      );
      if (data != null) {
        setState(() {
          showCPI = false;
        });

        setState(() {
          user = data;
          onPortalSelect();
        });

        //
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => PortalScreen(
        //       user: data,
        //     ),
        //   ),
        // );
      } else {
        setState(() {
          showCPI = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid Username and Password'),
          ),
        );
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
