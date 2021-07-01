import 'package:flutter/material.dart';

class TypingTextAnimation extends StatefulWidget {
  final String value;

  const TypingTextAnimation({Key key, this.value}) : super(key: key);
  @override
  State createState() => new TypingTextAnimationState();
}

class TypingTextAnimationState extends State<TypingTextAnimation>
    with TickerProviderStateMixin {
  Animation<int> _characterCount;
  int _stringIndex;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    setState(() {
      _stringIndex = _stringIndex == null ? 0 : _stringIndex + 1;
      _characterCount = new StepTween(begin: 0, end: widget.value.length)
          .animate(
              new CurvedAnimation(parent: controller, curve: Curves.easeIn));
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle textStyle = theme.textTheme.title
        .copyWith(color: Colors.black, fontWeight: FontWeight.bold);
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: _characterCount == null
          ? null
          : new AnimatedBuilder(
              animation: _characterCount,
              builder: (BuildContext context, Widget child) {
                String text = widget.value.substring(0, _characterCount.value);
                return new Text(text, style: textStyle);
              },
            ),
    );
  }
}
