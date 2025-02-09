import 'package:bookly/core/functions/show_toast.dart';
import 'package:bookly/core/utils/enums.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLaunch(
    {required String? url}) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      return customToast(message: 
            'Can\'t launch this url: $url',state: 
            ToastStates.error,);
    }
  }
}
