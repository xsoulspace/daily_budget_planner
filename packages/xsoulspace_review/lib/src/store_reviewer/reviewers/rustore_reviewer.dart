import 'package:flutter/widgets.dart';
import 'package:flutter_rustore_review/flutter_rustore_review.dart';

import '../store_reviewer.dart';

final class RuStoreReviewer extends StoreReviewer {
  @override
  Future<bool> onLoad() async {
    await RustoreReviewClient.initialize();
    return true;
  }

  @override
  Future<void> requestReview(
    final BuildContext context, {
    final Locale? locale,
  }) async {
    await RustoreReviewClient.request();
    await RustoreReviewClient.review();
  }
}
