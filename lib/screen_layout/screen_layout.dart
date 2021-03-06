import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itsumuso/common/back_movie_state.dart';
import 'package:itsumuso/common/widget.dart';
import 'package:itsumuso/gen/assets.gen.dart';

class ScreenLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends BackMovieState<ScreenLayout> {
  Orientation? _initialOrientation;

  static const _portOrientations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];

  static const _horizontalOrientations = [
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _forceDeviceRotation());
  }

  @override
  void dispose() {
    super.dispose();
    final orientations = _initialOrientation == Orientation.landscape
        ? _horizontalOrientations
        : _portOrientations;
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  Widget build(BuildContext context) {
    _initialOrientation ??= MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Stack(
          children: [
            ...backGround(videoShadowOpacity: .4),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Assets.layout.svg(
                  color: Colors.white
              ),
            ),
            BackBtn(
              btnFillColor: Theme.of(context).accentColor,
              iconColor: Colors.white,
              onTap: () => Navigator.of(context).pop(),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  '2020:09:07:13:10', //todo fix
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _forceDeviceRotation() async =>
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
}
