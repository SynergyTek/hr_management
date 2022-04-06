import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/login_models/extra_user_information_model.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../data/models/login_models/login_response_model.dart';

class PortalScreen extends StatefulWidget {
  final LoginResponseModel user;

  PortalScreen({
    Key? key,
    //
    required this.user,
  }) : super(key: key);

  @override
  State<PortalScreen> createState() => _PortalScreenState();
}

class _PortalScreenState extends State<PortalScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Dropdown
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
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
                  buttonPadding: const EdgeInsets.only(left: 16, right: 8),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  items: portalMap.keys
                      .toList()
                      .map((item) => DropdownMenuItem<String>(
                            value: item.toString(),
                            child: Text(
                              portalMap[item]?.name ?? '-',
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
                      selectedValue = value.toString();
                    });
                  },
                ),

                //
                const SizedBox(height: 16),

                // Button Row
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Next button
                    Expanded(
                      child: SecondaryButton(
                        buttonText: "Cancel",
                        handleOnPressed: handleCancelOnPressed,
                      ),
                    ),

                    // Next button
                    Expanded(
                      child: PrimaryButton(
                        buttonText: "Next",
                        handleOnPressed: handleNextOnPressed,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleNextOnPressed() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    // Setting up the portal type and
    // saving up the saved portal to the hydrated bloc.
    BlocProvider.of<UserModelBloc>(context).add(
      UserModelChangeEvent(
        userModel: widget.user,
        extraUserInformation: ExtraUserInformationModel(
          isSignedIn: false,
          portalType: selectedValue,
        ),
      ),
    );

    // Redirect to Home screen.
    Navigator.pushReplacementNamed(
      context,
      WORKBOARD_SCREEN,
    );
  }

  handleCancelOnPressed() {
    BlocProvider.of<UserModelBloc>(context).add(
      UserModelChangeEvent(
        userModel: null,
        extraUserInformation: null,
      ),
    );
    // Redirect to Home screen.
    Navigator.pushReplacementNamed(
      context,
      LOGIN_ROUTE,
    );
  }
}
