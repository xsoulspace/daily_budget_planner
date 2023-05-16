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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MonthlyCubitState {
  MonthlyBudgetModel get budget => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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

  $MonthlyBudgetModelCopyWith<$Res> get budget;
}

/// @nodoc
class _$MonthlyCubitStateCopyWithImpl<$Res, $Val extends MonthlyCubitState>
    implements $MonthlyCubitStateCopyWith<$Res> {
  _$MonthlyCubitStateCopyWithImpl(this._value, this._then);

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
              as MonthlyBudgetModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MonthlyBudgetModelCopyWith<$Res> get budget {
    return $MonthlyBudgetModelCopyWith<$Res>(_value.budget, (value) {
      return _then(_value.copyWith(budget: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MonthlyCubitStateCopyWith<$Res>
    implements $MonthlyCubitStateCopyWith<$Res> {
  factory _$$_MonthlyCubitStateCopyWith(_$_MonthlyCubitState value,
          $Res Function(_$_MonthlyCubitState) then) =
      __$$_MonthlyCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MonthlyBudgetModel budget, bool isLoading});

  @override
  $MonthlyBudgetModelCopyWith<$Res> get budget;
}

/// @nodoc
class __$$_MonthlyCubitStateCopyWithImpl<$Res>
    extends _$MonthlyCubitStateCopyWithImpl<$Res, _$_MonthlyCubitState>
    implements _$$_MonthlyCubitStateCopyWith<$Res> {
  __$$_MonthlyCubitStateCopyWithImpl(
      _$_MonthlyCubitState _value, $Res Function(_$_MonthlyCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = null,
    Object? isLoading = null,
  }) {
    return _then(_$_MonthlyCubitState(
      budget: null == budget
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

class _$_MonthlyCubitState implements _MonthlyCubitState {
  const _$_MonthlyCubitState(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MonthlyCubitState &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budget, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MonthlyCubitStateCopyWith<_$_MonthlyCubitState> get copyWith =>
      __$$_MonthlyCubitStateCopyWithImpl<_$_MonthlyCubitState>(
          this, _$identity);
}

abstract class _MonthlyCubitState implements MonthlyCubitState {
  const factory _MonthlyCubitState(
      {final MonthlyBudgetModel budget,
      final bool isLoading}) = _$_MonthlyCubitState;

  @override
  MonthlyBudgetModel get budget;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_MonthlyCubitStateCopyWith<_$_MonthlyCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
