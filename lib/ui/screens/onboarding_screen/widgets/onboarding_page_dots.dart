import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../themes/theme_config.dart';
import '../constants/onboarding_screen.cnst.dart';
import '../helper/onboarding_cubit.dart';

class SplashPageDots extends StatelessWidget {
  const SplashPageDots();

  @override
  Widget build(BuildContext context) => _handlePageCounts();

  Widget _handlePageCounts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingScreenConstants.length,
        (index) => _renderPageCountEachDot(index: index),
      ),
    );
  }

  Widget _renderPageCountEachDot({
    int index,
  }) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: ANIMATION_DURATION,
          margin: EdgeInsets.only(
            right: 8.0,
          ),
          height: 8.0,
          width: index == state ? 32.0 : 8.0,
          decoration: BoxDecoration(
            color: index == state
                ? Theme.of(context).textHeadingColor
                : Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        );
      },
    );
  }
}
