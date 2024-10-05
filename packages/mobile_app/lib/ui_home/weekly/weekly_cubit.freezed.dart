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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeeklyCubitState {
  WeeklyBudgetModel get budget => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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

  $WeeklyBudgetModelCopyWith<$Res> get budget;
}

/// @nodoc
class _$WeeklyCubitStateCopyWithImpl<$Res, $Val extends WeeklyCubitState>
    implements $WeeklyCubitStateCopyWith<$Res> {
  _$WeeklyCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as WeeklyBudgetModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeeklyBudgetModelCopyWith<$Res> get budget {
    return $WeeklyBudgetModelCopyWith<$Res>(_value.budget, (value) {
      return _then(_value.copyWith(budget: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeeklyCubitStateCopyWith<$Res>
    implements $WeeklyCubitStateCopyWith<$Res> {
  factory _$$_WeeklyCubitStateCopyWith(
          _$_WeeklyCubitState value, $Res Function(_$_WeeklyCubitState) then) =
      __$$_WeeklyCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeeklyBudgetModel budget, bool isLoading});

  @override
  $WeeklyBudgetModelCopyWith<$Res> get budget;
}

/// @nodoc
class __$$_WeeklyCubitStateCopyWithImpl<$Res>
    extends _$WeeklyCubitStateCopyWithImpl<$Res, _$_WeeklyCubitState>
    implements _$$_WeeklyCubitStateCopyWith<$Res> {
  __$$_WeeklyCubitStateCopyWithImpl(
      _$_WeeklyCubitState _value, $Res Function(_$_WeeklyCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = null,
    Object? isLoading = null,
  }) {
    return _then(_$_WeeklyCubitState(
      budget: null == budget
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

class _$_WeeklyCubitState implements _WeeklyCubitState {
  const _$_WeeklyCubitState(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeeklyCubitState &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budget, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeeklyCubitStateCopyWith<_$_WeeklyCubitState> get copyWith =>
      __$$_WeeklyCubitStateCopyWithImpl<_$_WeeklyCubitState>(this, _$identity);
}

abstract class _WeeklyCubitState implements WeeklyCubitState {
  const factory _WeeklyCubitState(
      {final WeeklyBudgetModel budget,
      final bool isLoading}) = _$_WeeklyCubitState;

  @override
  WeeklyBudgetModel get budget;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_WeeklyCubitStateCopyWith<_$_WeeklyCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
