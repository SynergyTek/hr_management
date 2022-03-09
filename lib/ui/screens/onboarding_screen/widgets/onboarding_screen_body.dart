import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routes/route_constants.dart';
import '../../../widgets/primary_button.dart';
import '../constants/onboarding_screen.cnst.dart';
import '../helper/onboarding_cubit.dart';
import 'onboarding_image_content.dart';
import 'onboarding_page_dots.dart';

class OnboardingScreenBodyWidget extends StatefulWidget {
  OnboardingScreenBodyWidget();

  @override
  _OnboardingScreenBodyWidgetState createState() =>
      _OnboardingScreenBodyWidgetState();
}

class _OnboardingScreenBodyWidgetState
    extends State<OnboardingScreenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 64.0),
          Expanded(
            flex: 3,
            child: _splashPageView(context),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SplashPageDots(),
                PrimaryButton(
                  buttonText: "Continue",
                  handleOnPressed: _continueOnPressed,
                  width: 120,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _splashPageView(BuildContext context) {
    return PageView.builder(
      itemCount: onboardingScreenConstants.length,
      itemBuilder: (context, index) {
        return SplashImageContent(
          titleText: onboardingScreenConstants[index]['titleText'],
          subtitleText: onboardingScreenConstants[index]['subtitleText'],
          imagePath: onboardingScreenConstants[index]['imagePath'],
        );
      },
      onPageChanged: (int pageIndex) {
        context.read<OnboardingCubit>().state < pageIndex
            ? context.read<OnboardingCubit>().increment()
            : context.read<OnboardingCubit>().decrement();
      },
    );
  }

  void _continueOnPressed() {
    Navigator.pushReplacementNamed(
      context,
      MARK_ATTENDANCE_ROUTE,
    );
  }
}
