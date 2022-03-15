import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? buttonText;
  final Function? handleOnPressed;
  final double? width;
  final double? height;
  final double? borderRadius;

  final Color? backgroundColor;
  final Color? foregroundColor;

  const PrimaryButton({
    @required this.buttonText,
    @required this.handleOnPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) => _primaryButton(context);

  Widget _primaryButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? Colors.blue,
          ),
        ),
        onPressed: () => handleOnPressed!(),
        child: SizedBox(
          width: width ?? double.infinity,
          height: height ?? 24,
          child: Center(
            child: Text(
              buttonText ?? "",
              style: TextStyle(
                color: foregroundColor ?? Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
