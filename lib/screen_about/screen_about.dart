import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itsumuso/common/back_movie_state.dart';
import 'package:itsumuso/statics.dart';
import 'package:itsumuso/strings.dart';
import 'package:itsumuso/styles.dart';

class ScreenAbout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenAboutState();
}

class _ScreenAboutState extends BackMovieState<ScreenAbout> {

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, boxConstrains) {
          final bool scrollable = boxConstrains.maxHeight < BreakPoints.W720;
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  ...backGround(),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black.withOpacity(.2),
                  ),
                  _contentWidget(scrollable),
                  const Padding(
                    padding: EdgeInsets.all(kIsWeb ? 24 : 0),
                    child: BackButton(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );

  Widget _contentWidget(bool scrollable) {
    final children = [
      const _Title(),
      const _Intro(string: Strings.ABOUT_INTRO0),
      const SizedBox(height: 8),
      const _Intro(string: Strings.ABOUT_INTRO1),
      const SizedBox(height: 16),
      const _IntroReference(),
      _space(scrollable),
      const _Content(
        string: Strings.ABOUT_H_FACILITY,
        fontSize: 18,
      ),
      const SizedBox(height: 8),
      const _Content(string: Strings.ABOUT_FACILITY),
      const SizedBox(height: 8),
      const _Content(
        string: Strings.ABOUT_H_LOCATION,
        fontSize: 18,
      ),
      const SizedBox(height: 8),
      const _Content(string: Strings.ABOUT_DISTANCE_STATION),
      const _Content(string: Strings.ABOUT_DISTANCE_GROCERY),
      _space(scrollable),
      const _Content(
        string: Strings.HOUSE_NAME_JA,
        fontSize: 16,
      ),
      const SizedBox(height: 8),
      const _Content(
        string: Strings.ADDRESS,
        fontSize: 14,
      ),
    ];

    return scrollable
        ? ListView(
            padding: const EdgeInsets.all(16),
            children: children,
          )
        : Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: children,
            ),
          );
  }

  Widget _space(bool scrollable) => scrollable
      ? const SizedBox(
          height: 48,
        )
      : const Spacer();
}

class _Title extends StatelessWidget {
  const _Title() : super();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 60, bottom: 60),
        alignment: Alignment.center,
        child: const Text(
          Strings.ABOUT_TITLE,
          style: TextStyle(
              fontSize: 40,
              fontFamily: Styles.FONT_SHINGO,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
      );
}

class _Intro extends StatelessWidget {
  const _Intro({required this.string, Key? key}) : super(key: key);

  final String string;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double fontSize = size.height > BreakPoints.W720 && size.width > BreakPoints.W720 ? 20: 18;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          string,
          style: TextStyle(
              height: 1.2,
              fontSize: fontSize,
              fontFamily: Styles.FONT_SANS,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      );
  }
}

class _IntroReference extends StatelessWidget {
  const _IntroReference() : super();

  @override
  Widget build(BuildContext context) => const Align(
        alignment: Alignment.centerRight,
        child: Text(
          Strings.ABOUT_INTRO_REF,
          style: TextStyle(
              fontSize: 14,
              fontFamily: Styles.FONT_SANS,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      );
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    required this.string,
    this.fontSize = 14,
  }) : super(key: key);

  final String string;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Text(
        string,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      );
}
