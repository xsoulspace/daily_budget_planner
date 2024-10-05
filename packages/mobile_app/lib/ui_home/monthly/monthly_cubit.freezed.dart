// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlyCubitState {
  MonthlyBudgetModel get budget => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyCubitStateCopyWith<MonthlyCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyCubitStateCopyWith<$Res> {
  factory $MonthlyCubitStateCopyWith(
          MonthlyCubitState value, $Res Function(MonthlyCubitState) then) =
      _$MonthlyCubitStateCopyWithImpl<$Res, MonthlyCubitState>;
  @useResult
  $Res call({MonthlyBudgetModel budget, bool isLoading});
}

/// @nodoc
class _$MonthlyCubitStateCopyWithImpl<$Res, $Val extends MonthlyCubitState>
    implements $MonthlyCubitStateCopyWith<$Res> {
  _$MonthlyCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as MonthlyBudgetModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyCubitStateImplCopyWith<$Res>
    implements $MonthlyCubitStateCopyWith<$Res> {
  factory _$$MonthlyCubitStateImplCopyWith(_$MonthlyCubitStateImpl value,
          $Res Function(_$MonthlyCubitStateImpl) then) =
      __$$MonthlyCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MonthlyBudgetModel budget, bool isLoading});
}

/// @nodoc
class __$$MonthlyCubitStateImplCopyWithImpl<$Res>
    extends _$MonthlyCubitStateCopyWithImpl<$Res, _$MonthlyCubitStateImpl>
    implements _$$MonthlyCubitStateImplCopyWith<$Res> {
  __$$MonthlyCubitStateImplCopyWithImpl(_$MonthlyCubitStateImpl _value,
      $Res Function(_$MonthlyCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$MonthlyCubitStateImpl(
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as MonthlyBudgetModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MonthlyCubitStateImpl implements _MonthlyCubitState {
  const _$MonthlyCubitStateImpl(
      {this.budget = MonthlyBudgetModel.initial, this.isLoading = true});

  @override
  @JsonKey()
  final MonthlyBudgetModel budget;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'MonthlyCubitState(budget: $budget, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyCubitStateImpl &&
            const DeepCollectionEquality().equals(other.budget, budget) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(budget), isLoading);

  /// Create a copy of MonthlyCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyCubitStateImplCopyWith<_$MonthlyCubitStateImpl> get copyWith =>
      __$$MonthlyCubitStateImplCopyWithImpl<_$MonthlyCubitStateImpl>(
          this, _$identity);
}

abstract class _MonthlyCubitState implements MonthlyCubitState {
  const factory _MonthlyCubitState(
      {final MonthlyBudgetModel budget,
      final bool isLoading}) = _$MonthlyCubitStateImpl;

  @override
  MonthlyBudgetModel get budget;
  @override
  bool get isLoading;

  /// Create a copy of MonthlyCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyCubitStateImplCopyWith<_$MonthlyCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
