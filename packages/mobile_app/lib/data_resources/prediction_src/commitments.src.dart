import 'package:mobile_app/common_imports.dart';

/// Runtime store of all active commitments (subscriptions, credit payments,
/// recurring bills). Primary input of the projection engine (ADR 0002).
@resource
class CommitmentsResource extends OrderedMapNotifier<CommitmentId, Commitment> {
  CommitmentsResource() : super(toKey: (final commitment) => commitment.id);
}

/// Runtime store of planned sums per period bucket. One editable number
/// per bucket; records only explain drift from this plan (Sum→Reason).
@resource
class PlannedSumsStoreResource
    extends OrderedMapNotifier<BudgetId, PlannedSum> {
  PlannedSumsStoreResource() : super(toKey: (final sum) => sum.id);
}
