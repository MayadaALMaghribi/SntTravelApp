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


/**
 * import 'package:url_launcher/url_launcher.dart';

Future<void> openAppOrStore({required String packageName}) async {
  final Uri intentUri = Uri.parse("intent://#Intent;package=$packageName;end");
  final Uri playStoreUri =
      Uri.parse("https://play.google.com/store/apps/details?id=$packageName");
  if (await canLaunchUrl(intentUri)) {
    await launchUrl(intentUri, mode: LaunchMode.externalApplication);
  } else {
    await launchUrl(playStoreUri, mode: LaunchMode.externalApplication);
  }
}
 */
