import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../consent_screen.dart';
import '../store_reviewer.dart';

final class SnapStoreReviewer extends StoreReviewer {
  SnapStoreReviewer({
    required this.packageName,
    this.fallbackConsentBuilder = defaultFallbackConsentBuilder,
  });
  final String packageName;
  final ReviewerFallbackConsentBuilder fallbackConsentBuilder;

  @override
  Future<void> requestReview(
    final BuildContext context, {
    final Locale? locale,
  }) async {
    final isConsent =
        await fallbackConsentBuilder(context, locale ?? const Locale('en'));
    if (!isConsent) return;

    final url = Uri.parse('snap://review/$packageName');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
