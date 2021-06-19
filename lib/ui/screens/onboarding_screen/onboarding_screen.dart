import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helper/onboarding_cubit.dart';
import 'widgets/onboarding_screen_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: OnboardingScreenBodyWidget(),
        ),
      ),
    );
  }
}
