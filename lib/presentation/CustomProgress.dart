import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 150,
      height: 150,
      child: Column(children: <Widget>[
        AnimatedDefaultTextStyle(
          softWrap: true,
          style: TextStyle(fontSize: 24, color: Colors.black),
          duration: Duration(milliseconds: 1000),
          child: ColorizeAnimatedTextKit(
              text: [
                "Loading"
              ],
              colors: [
                Colors.black,
                Colors.redAccent,
                Colors.black,
                Colors.redAccent,
                Colors.black
              ],
              isRepeatingAnimation: true,
              textStyle: TextStyle(fontSize: 24, fontFamily: "Horizon")),
        ),
        LinearProgressIndicator()
      ]),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32), color: Colors.white),
      //color: Colors.white,
    );
  }
}

class ColorizeAnimatedTextKit extends StatefulWidget {
  final List<String> text;
  final List<Color> colors;
  final TextStyle textStyle;
  final Duration duration;
  final VoidCallback onTap;
  final AlignmentGeometry alignment;
  final TextAlign textAlign;
  final bool isRepeatingAnimation;

  const ColorizeAnimatedTextKit(
      {Key key,
      @required this.text,
      this.textStyle,
      @required this.colors,
      this.duration,
      this.onTap,
      this.alignment = AlignmentDirectional.topStart,
      this.textAlign = TextAlign.start,
      this.isRepeatingAnimation = true})
      : super(key: key);

  @override
  _RotatingTextState createState() => new _RotatingTextState();
}

class _RotatingTextState extends State<ColorizeAnimatedTextKit>
    with SingleTickerProviderStateMixin {
  Duration _duration;

  AnimationController _controller;

  List<Widget> _textWidgetList = [];

  List<Animation<double>> _colorShifter = [];

  List<double> _tuning = [];

  @override
  void initState() {
    super.initState();

    int lengthList = widget.text.length;

    int totalCharacters = 0;

    for (int i = 0; i < lengthList; i++) {
      totalCharacters += widget.text[i].length;
    }

    if (widget.duration == null) {
      _duration = Duration(milliseconds: 1500 * totalCharacters ~/ 3);
    } else {
      _duration = widget.duration;
    }

    _controller = new AnimationController(
      duration: _duration,
      vsync: this,
    );

    if (widget.isRepeatingAnimation) {
      _controller..repeat();
    } else {
      _controller.forward();
    }

    double percentTimeCount = 0.0;

    for (int i = 0; i < lengthList; i++) {
      double percentTime = widget.text[i].length / totalCharacters;

      _tuning.add((300.0 * widget.colors.length) *
          (widget.textStyle.fontSize / 24.0) *
          0.75 *
          (widget.text[i].length / 15.0));

      _colorShifter.add(
          Tween(begin: 0.0, end: widget.colors.length * _tuning[i]).animate(
              CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                      percentTimeCount, percentTimeCount + percentTime,
                      curve: Curves.easeIn))));

      percentTimeCount += percentTime;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.text.length; i++) {
      if (i != widget.text.length - 1) {
        _textWidgetList.add(AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            Shader linearGradient = LinearGradient(colors: widget.colors)
                .createShader(
                    Rect.fromLTWH(0.0, 0.0, _colorShifter[i].value, 0.0));
            return Text(
              widget.text[i],
              style: widget.textStyle != null
                  ? widget.textStyle.merge(
                      TextStyle(foreground: Paint()..shader = linearGradient))
                  : widget.textStyle,
              textAlign: widget.textAlign,
            );
          },
        ));
      } else {
        if (widget.isRepeatingAnimation) {
          _textWidgetList.add(AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              Shader linearGradient = LinearGradient(colors: widget.colors)
                  .createShader(
                      Rect.fromLTWH(0.0, 0.0, _colorShifter[i].value, 0.0));
              return Text(
                widget.text[i],
                style: widget.textStyle != null
                    ? widget.textStyle.merge(
                        TextStyle(foreground: Paint()..shader = linearGradient))
                    : widget.textStyle,
                textAlign: widget.textAlign,
              );
            },
          ));
        } else {
          _textWidgetList.add(AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              Shader linearGradient = LinearGradient(colors: widget.colors)
                  .createShader(
                      Rect.fromLTWH(0.0, 0.0, _colorShifter[i].value, 0.0));
              return Text(
                widget.text[i],
                style: widget.textStyle != null
                    ? widget.textStyle.merge(
                        TextStyle(foreground: Paint()..shader = linearGradient))
                    : widget.textStyle,
                textAlign: widget.textAlign,
              );
            },
          ));
        }
      }
    }

    return SizedBox(
      height: 80.0,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          alignment: widget.alignment,
          children: _textWidgetList,
        ),
      ),
    );
  }
}
