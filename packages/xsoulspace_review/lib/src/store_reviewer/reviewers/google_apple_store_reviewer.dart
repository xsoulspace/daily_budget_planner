import 'package:flutter/widgets.dart';
import 'package:in_app_review/in_app_review.dart';

import '../store_reviewer.dart';

final class GoogleAppleStoreReviewer extends StoreReviewer {
  final InAppReview _inAppReview = InAppReview.instance;

  @override
  Future<void> requestReview(final BuildContext context) async {
    if (await _inAppReview.isAvailable()) {
      await _inAppReview.requestReview();
    }
  }
}
