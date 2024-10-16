import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import 'consent_screen.dart';
import 'reviewers/reviewers.dart';

export 'reviewers/reviewers.dart';
export 'store_review_requester.dart';

/// A function type for building a fallback consent screen.
///
/// This function takes a [BuildContext] and [Locale] and returns a
/// [Future<bool>]
/// indicating whether the user has given consent.
///
/// @ai Use this type when implementing custom consent screens for store
/// reviews.
typedef ReviewerFallbackConsentBuilder = Future<bool> Function(
  BuildContext context,
  Locale locale,
);

/// Base class for implementing store review functionality.
///
/// This class provides a common interface for different store review
/// implementations.
///
/// @ai When extending this class, ensure to override [requestReview] method.
base class StoreReviewer {
  /// Initializes the reviewer.
  ///
  /// Override this method to perform any necessary setup.
  ///
  /// @ai Implement this method for any initialization logic specific to the
  /// reviewer.
  Future<void> onLoad() async {}

  /// Requests a review from the user.
  ///
  /// This method must be overridden in subclasses to implement
  /// platform-specific review requests.
  ///
  /// @ai Ensure to implement this method with the appropriate store review
  /// logic.
  @mustBeOverridden
  Future<void> requestReview(
    final BuildContext context, {
    final Locale? locale,
  }) async {}
}

/// Factory class for creating [StoreReviewer] instances.
///
/// This class provides a method to create the appropriate [StoreReviewer]
/// based on the app's installation source.
///
/// @ai Use this factory to get the correct [StoreReviewer] for the current
/// platform.
class StoreReviewerFactory {
  StoreReviewerFactory._();

  /// Creates a [StoreReviewer] instance based on the app's installation source.
  ///
  /// [snapPackageName] is required for SnapStoreReviewer to redirect to
  /// the snapstore.
  /// [fallbackConsentBuilder] is required for some Reviewers to show
  /// a consent dialog before redirecting to the store as these stores
  /// do not support native in-app review prompt.
  ///
  /// @ai When calling this method, provide the [snapPackageName] if targeting
  /// Linux platforms.
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
