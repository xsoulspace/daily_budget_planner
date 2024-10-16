import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import 'store_reviewer.dart';

/// A class responsible for managing review requests for a store.
///
/// This class schedules and sends review requests based on a specified
/// review period.
/// It interacts with the [StoreReviewer] to initiate review requests and uses
/// a local database to track the last review request time.
///
/// Example usage:
/// ```dart
/// final reviewRequester = ReviewRequester(
///   reviewPeriod: Duration(days: 30),
///   storeReviewer: myStoreReviewer,
///   localDb: myLocalDb,
/// );
/// await reviewRequester.initialize();
/// ```
///
/// @ai Ensure proper initialization of [reviewPeriod], [storeReviewer], and
/// [localDb].
class ReviewRequester {
  /// Creates an instance of [ReviewRequester].
  ///
  /// The [reviewPeriod] defines the duration between review requests.
  /// The [storeReviewer] is responsible for handling the review request logic.
  /// The [localDb] is used to persist the last review request timestamp.
  ///
  /// @ai Use this constructor to set up the review requester with
  /// necessary dependencies.
  ReviewRequester({
    required this.reviewPeriod,
    required this.storeReviewer,
    required this.localDb,
  });

  /// The duration between review requests.
  ///
  /// This value determines how often a review request will be sent.
  ///
  /// @ai Adjust this value based on user engagement and feedback frequency.
  final Duration reviewPeriod;

  /// The [StoreReviewer] instance used to request reviews.
  ///
  /// This class handles the actual review request process.
  ///
  /// @ai Ensure this is properly initialized to avoid null reference errors.
  final StoreReviewer storeReviewer;

  /// The local database interface for storing review request timestamps.
  ///
  /// This is used to persist the last review request time.
  ///
  /// @ai Ensure this is correctly implemented to maintain state across
  /// app sessions.
  final LocalDbI localDb;

  Timer? _timer;
  static const String _lastReviewRequestKey = 'last_review_request';

  /// Initializes the review requester by checking the last review request time.
  ///
  /// If no previous request exists or the review period has elapsed,
  /// it schedules a new review request.
  ///
  /// @ai Call this method after creating an instance to set up the requester.
  Future<void> initialize() async {
    final lastReviewRequest = await localDb.getInt(key: _lastReviewRequestKey);

    if (lastReviewRequest == 0) {
      _scheduleReviewRequest();
    } else {
      final lastRequestTime =
          DateTime.fromMillisecondsSinceEpoch(lastReviewRequest);
      final timeSinceLastRequest = DateTime.now().difference(lastRequestTime);

      if (timeSinceLastRequest >= reviewPeriod) {
        _scheduleReviewRequest();
      } else {
        final remainingTime = reviewPeriod - timeSinceLastRequest;
        _scheduleReviewRequest(initialDelay: remainingTime);
      }
    }
  }

  /// Schedules a review request after a specified delay.
  ///
  /// If [initialDelay] is provided, it will be used to delay the request.
  /// Otherwise, the default [reviewPeriod] will be used.
  ///
  /// @ai Use this method to control when review requests are sent.
  void _scheduleReviewRequest({final Duration? initialDelay}) {
    _timer?.cancel();
    _timer = Timer(initialDelay ?? reviewPeriod, requestReview);
  }

  /// Requests a review from the store reviewer.
  ///
  /// If [context] is provided, it will be used to show the review dialog.
  /// Otherwise, the root element context will be used.
  ///
  /// @ai Ensure the context is valid to avoid runtime errors.
  Future<void> requestReview([final BuildContext? context]) async {
    final effectiveContext = context ?? WidgetsBinding.instance.rootElement;
    if (effectiveContext != null) {
      await storeReviewer.requestReview(effectiveContext);
      await _updateLastReviewRequestTime();
    }
    _scheduleReviewRequest();
  }

  /// Updates the last review request timestamp in the local database.
  ///
  /// This method is called after a review request is successfully sent.
  ///
  /// @ai Call this method to maintain accurate tracking of review requests.
  Future<void> _updateLastReviewRequestTime() async {
    await localDb.setInt(
      key: _lastReviewRequestKey,
      value: DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Disposes of the timer to prevent memory leaks.
  ///
  /// This should be called when the [ReviewRequester] is no longer needed.
  ///
  /// @ai Always call this method to clean up resources.
  void dispose() {
    _timer?.cancel();
  }
}
