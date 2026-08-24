import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';

/// {@template budget_sembast_collection}
/// Sembast collection model for storing [Budget] data.
/// Handles persistence of budgets and their related data.
///
/// This collection maintains relationships between:
/// - [Budget]
///
/// @ai When generating code for this collection, ensure proper handling of
/// data serialization and maintain referential integrity with
/// related collections.
/// {@endtemplate}
class BudgetSembastCollection extends SembastContainer<Budget, BudgetId> {
  /// Creates a [BudgetSembastCollection] instance
  BudgetSembastCollection({required super.item});

  /// Creates instance from Sembast Map
  factory BudgetSembastCollection.fromMap(final SembastDataMap map) =>
      BudgetSembastCollection(
        item: Budget.fromJson(
          jsonDecodeMap(map[SembastContainer.keys.jsonData]!),
        ),
      );

  /// Converts a domain [Budget] model to [BudgetSembastCollection]
  factory BudgetSembastCollection.fromDomain(final Budget budget) =>
      BudgetSembastCollection(item: budget);
  @override
  BudgetId get id => item.id;

  /// Converts to Map for Sembast storage
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    // Queries filter on this field as an ISO-8601 string; keep types aligned.
    'createdAt': item.date.toIso8601String(),
  };

  @override
  SembastDataMap getJson() => item.toJson();
}
