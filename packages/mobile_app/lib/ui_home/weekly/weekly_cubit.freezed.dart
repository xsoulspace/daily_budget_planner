// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeeklyCubitState {
  WeeklyBudgetModel get budget => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyCubitStateCopyWith<WeeklyCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyCubitStateCopyWith<$Res> {
  factory $WeeklyCubitStateCopyWith(
          WeeklyCubitState value, $Res Function(WeeklyCubitState) then) =
      _$WeeklyCubitStateCopyWithImpl<$Res, WeeklyCubitState>;
  @useResult
  $Res call({WeeklyBudgetModel budget, bool isLoading});
}

/// @nodoc
class _$WeeklyCubitStateCopyWithImpl<$Res, $Val extends WeeklyCubitState>
    implements $WeeklyCubitStateCopyWith<$Res> {
  _$WeeklyCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyCubitState
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
              as WeeklyBudgetModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyCubitStateImplCopyWith<$Res>
    implements $WeeklyCubitStateCopyWith<$Res> {
  factory _$$WeeklyCubitStateImplCopyWith(_$WeeklyCubitStateImpl value,
          $Res Function(_$WeeklyCubitStateImpl) then) =
      __$$WeeklyCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeeklyBudgetModel budget, bool isLoading});
}

/// @nodoc
class __$$WeeklyCubitStateImplCopyWithImpl<$Res>
    extends _$WeeklyCubitStateCopyWithImpl<$Res, _$WeeklyCubitStateImpl>
    implements _$$WeeklyCubitStateImplCopyWith<$Res> {
  __$$WeeklyCubitStateImplCopyWithImpl(_$WeeklyCubitStateImpl _value,
      $Res Function(_$WeeklyCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$WeeklyCubitStateImpl(
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as WeeklyBudgetModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WeeklyCubitStateImpl implements _WeeklyCubitState {
  const _$WeeklyCubitStateImpl(
      {this.budget = WeeklyBudgetModel.initial, this.isLoading = true});

  @override
  @JsonKey()
  final WeeklyBudgetModel budget;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'WeeklyCubitState(budget: $budget, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyCubitStateImpl &&
            const DeepCollectionEquality().equals(other.budget, budget) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(budget), isLoading);

  /// Create a copy of WeeklyCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyCubitStateImplCopyWith<_$WeeklyCubitStateImpl> get copyWith =>
      __$$WeeklyCubitStateImplCopyWithImpl<_$WeeklyCubitStateImpl>(
          this, _$identity);
}

abstract class _WeeklyCubitState implements WeeklyCubitState {
  const factory _WeeklyCubitState(
      {final WeeklyBudgetModel budget,
      final bool isLoading}) = _$WeeklyCubitStateImpl;

  @override
  WeeklyBudgetModel get budget;
  @override
  bool get isLoading;

  /// Create a copy of WeeklyCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyCubitStateImplCopyWith<_$WeeklyCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
