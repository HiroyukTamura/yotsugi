import 'package:fluttertoast/fluttertoast.dart';
import 'package:itsumuso/common/url_launcher.dart';
import 'package:itsumuso/strings.dart';
import 'package:url_launcher/url_launcher.dart';

UrlLauncher createUrlLauncher() => UrlLauncherImpl();

class UrlLauncherImpl extends UrlLauncher {

  @override
  Future<void> launchUrl(String url, {bool newTab = false}) async => launchUrl(url);

}