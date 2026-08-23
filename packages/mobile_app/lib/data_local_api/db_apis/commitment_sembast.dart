import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';

/// {@template commitment_sembast_collection}
/// Sembast collection model for storing [Commitment] data.
///
/// @ai When generating code for this collection, ensure proper handling of
/// data serialization and maintain referential integrity with related
/// collections.
/// {@endtemplate}
class CommitmentSembastCollection
    extends SembastContainer<Commitment, CommitmentId> {
  /// Creates a [CommitmentSembastCollection] instance
  CommitmentSembastCollection({required super.item});

  /// Creates instance from Sembast Map
  factory CommitmentSembastCollection.fromMap(final SembastDataMap map) =>
      CommitmentSembastCollection(
        item: Commitment.fromJson(
          jsonDecodeMap(map[SembastContainer.keys.jsonData]!),
        ),
      );

  /// Converts a domain [Commitment] model to [CommitmentSembastCollection]
  factory CommitmentSembastCollection.fromDomain(final Commitment commitment) =>
      CommitmentSembastCollection(item: commitment);

  @override
  CommitmentId get id => item.id;

  /// Converts to Map for Sembast storage
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'startedAt': item.startedAt,
  };

  @override
  SembastDataMap getJson() => item.toJson();
}

/// {@template planned_sum_sembast_collection}
/// Sembast collection model for storing [PlannedSum] data.
/// {@endtemplate}
class PlannedSumSembastCollection
    extends SembastContainer<PlannedSum, BudgetId> {
  /// Creates a [PlannedSumSembastCollection] instance
  PlannedSumSembastCollection({required super.item});

  /// Creates instance from Sembast Map
  factory PlannedSumSembastCollection.fromMap(final SembastDataMap map) =>
      PlannedSumSembastCollection(
        item: PlannedSum.fromJson(
          jsonDecodeMap(map[SembastContainer.keys.jsonData]!),
        ),
      );

  /// Converts a domain [PlannedSum] model to [PlannedSumSembastCollection]
  factory PlannedSumSembastCollection.fromDomain(final PlannedSum plannedSum) =>
      PlannedSumSembastCollection(item: plannedSum);

  @override
  BudgetId get id => item.id;

  /// Converts to Map for Sembast storage
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'periodStart': item.periodStart,
  };

  @override
  SembastDataMap getJson() => item.toJson();
}
