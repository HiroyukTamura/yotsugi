import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yotsugi/styles.dart';

class CornerLabel extends StatelessWidget {
  const CornerLabel({
    Key key,
    @required this.alignment,
    @required this.curve,
    @required this.duration,
    @required this.tween,
    @required this.string,
    @required this.onTap,
  }) : super(key: key);

  final Curve curve;
  final Tween<Offset> tween;
  final String string;
  final Duration duration;
  final Alignment alignment;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) => Align(
        alignment: alignment,
        child: TweenAnimationBuilder<Offset>(
          tween: tween,
          builder: (_, offset, child) =>
              FractionalTranslation(translation: offset, child: child),
          duration: duration,
          curve: curve,
          child: InkWell(
            onTap: onTap,
            child: Text(
              string,
              style: const TextStyle(
                fontFamily: Styles.FONT_SHINGO,
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
}
