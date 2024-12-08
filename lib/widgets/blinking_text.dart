import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class BlinkingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration blinkDuration;
  final Color? strokeColor;

  const BlinkingText({
    super.key,
    required this.text,
    this.style,
    this.strokeColor,
    this.blinkDuration = const Duration(milliseconds: 500),
  });

  @override
  _BlinkingTextState createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText> {
  bool _isVisible = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startBlinking();
  }

  void _startBlinking() {
    _timer = Timer.periodic(widget.blinkDuration, (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StrokeText(
      text: widget.text,
      strokeWidth: _isVisible ? 2 : 0,
      strokeColor: _isVisible
          ? widget.strokeColor ?? Colors.transparent
          : Colors.transparent,
      textStyle: widget.style?.copyWith(
        color: _isVisible ? widget.style?.color : Colors.transparent,
      ),
    );
  }
}
