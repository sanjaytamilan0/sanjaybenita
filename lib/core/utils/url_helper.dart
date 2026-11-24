import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<bool> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  static Future<bool> openWhatsApp({
    required String phoneOrEmpty,
    required String message,
  }) async {
    final encoded = Uri.encodeComponent(message);
    final String url;
    if (phoneOrEmpty.isNotEmpty) {
      final cleanPhone = phoneOrEmpty.replaceAll(RegExp(r'[^0-9]'), '');
      url = 'https://wa.me/$cleanPhone?text=$encoded';
    } else {
      url = 'https://api.whatsapp.com/send?text=$encoded';
    }
    return openUrl(url);
  }

  static Future<bool> dialPhone(String phoneNumber) async {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '');
    final uri = Uri.parse('tel:$cleanPhone');
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri);
    }
    return false;
  }
}
