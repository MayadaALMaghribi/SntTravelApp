import 'package:url_launcher/url_launcher.dart';

Future<void> openOrInstallApp({
  required String packageName,
  required String playStoreUrl,
}) async {
  final uri = Uri.parse("intent://#Intent;package=$packageName;end");

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    await launchUrl(Uri.parse(playStoreUrl));
  }
}
