import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ConditionalMarqueeText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const ConditionalMarqueeText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    // Return a Marquee widget if overflowing, otherwise a Text widget
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Measure the width of the text
          final TextPainter textPainter = TextPainter(
            text: TextSpan(text: text, style: style),
            maxLines: 1,
            textDirection: TextDirection.ltr,
          )
            ..layout(minWidth: 0, maxWidth: double.infinity);

          // Check if the text width exceeds the parent's max width
          final bool isOverflowing = textPainter.size.width + 4 >
              constraints.maxWidth;

          return isOverflowing ? Marquee(
            text: text,
            style: style,
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.end,
            blankSpace: 100.0,
            velocity: 60.0,
          )
              : Text(
            text,
            style: style,
            overflow: TextOverflow.visible,
          );
        }
    );
  }
}
