import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/registration_form_bloc.dart';
import 'package:hr_management/ui/screens/registration/registration_form.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationFormBloc registrationFormBloc = RegistrationFormBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: registrationFormBloc,
        child: RegistrationForm(),
      ),
    );
  }
}