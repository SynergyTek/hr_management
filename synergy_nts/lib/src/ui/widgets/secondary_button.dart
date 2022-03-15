import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String buttonText;
  final Function handleOnPressed;
  final double? width;
  final double? height;
  final double? borderRadius;

  final Color? backgroundColor;

  const SecondaryButton({
    required this.buttonText,
    required this.handleOnPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,

    //
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _secondaryButton(context);

  Widget _secondaryButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 16,
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          foregroundColor:
              MaterialStateProperty.all(backgroundColor ?? Colors.blue),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: backgroundColor ?? Colors.blue,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            ),
          ),
        ),
        onPressed: () => handleOnPressed(),
        child: SizedBox(
          width: width ?? double.infinity,
          height: height ?? 24.0,
          child: Center(
            child: Text(buttonText),
          ),
        ),
      ),
    );
  }
}
