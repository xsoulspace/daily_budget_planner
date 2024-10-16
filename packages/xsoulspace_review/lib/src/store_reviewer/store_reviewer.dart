import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import 'consent_screen.dart';
import 'reviewers/reviewers.dart';

export 'reviewers/reviewers.dart';
export 'store_review_requester.dart';

typedef ReviewerFallbackConsentBuilder = Future<bool> Function(
  BuildContext context,
  Locale locale,
);

base class StoreReviewer {
  Future<void> onLoad() async {}
  @mustBeOverridden
  Future<void> requestReview(final BuildContext context) async {}
}

class StoreReviewerFactory {
  StoreReviewerFactory._();

  /// [snapPackageName] is required for SnapStoreReviewer to redirect to
  /// the snapstore.
  /// [fallbackConsentBuilder] is required for some Reviewers to show
  /// a consent dialog before redirecting to the store as these stores
  /// do not support native in-app review prompt.
  static Future<StoreReviewer> create({
    final String snapPackageName = '',
    final ReviewerFallbackConsentBuilder fallbackConsentBuilder =
        defaultFallbackConsentBuilder,
  }) async {
    final appStoreUtils = AppStoreUtils();
    final installSource = await appStoreUtils.getInstallationSource();
    return switch (installSource) {
      InstallSource.androidRustore => RuStoreReviewer(),
      InstallSource.androidHuawaiAppGallery => HuaweiStoreReviewer(),
      InstallSource.androidApk ||
      InstallSource.androidGooglePlay ||
      InstallSource.androidGooglePlayInstaller ||
      _ when installSource.isApple =>
        GoogleAppleStoreReviewer(),
      InstallSource.linuxSnap ||
      _ when installSource.isLinux =>
        SnapStoreReviewer(
          packageName: snapPackageName,
          fallbackConsentBuilder: fallbackConsentBuilder,
        ),
      _ when installSource.isWeb => WebStoreReviewer(),
      // TODO(arenukvern): add other platforms
      _ => WebStoreReviewer(),
    };
  }
}
