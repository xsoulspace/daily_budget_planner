// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettingsModel {

@JsonKey(fromJson: localeFromString, toJson: localeToString) Locale? get locale;@JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson) UiBrightness get brightness; bool get use24HourFormat; bool get isPredictionUiEnabled; bool get showPredictionIntro; bool get showPredictionTeaser;
/// Create a copy of AppSettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsModelCopyWith<AppSettingsModel> get copyWith => _$AppSettingsModelCopyWithImpl<AppSettingsModel>(this as AppSettingsModel, _$identity);

  /// Serializes this AppSettingsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsModel&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.use24HourFormat, use24HourFormat) || other.use24HourFormat == use24HourFormat)&&(identical(other.isPredictionUiEnabled, isPredictionUiEnabled) || other.isPredictionUiEnabled == isPredictionUiEnabled)&&(identical(other.showPredictionIntro, showPredictionIntro) || other.showPredictionIntro == showPredictionIntro)&&(identical(other.showPredictionTeaser, showPredictionTeaser) || other.showPredictionTeaser == showPredictionTeaser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,brightness,use24HourFormat,isPredictionUiEnabled,showPredictionIntro,showPredictionTeaser);

@override
String toString() {
  return 'AppSettingsModel(locale: $locale, brightness: $brightness, use24HourFormat: $use24HourFormat, isPredictionUiEnabled: $isPredictionUiEnabled, showPredictionIntro: $showPredictionIntro, showPredictionTeaser: $showPredictionTeaser)';
}


}

/// @nodoc
abstract mixin class $AppSettingsModelCopyWith<$Res>  {
  factory $AppSettingsModelCopyWith(AppSettingsModel value, $Res Function(AppSettingsModel) _then) = _$AppSettingsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: localeFromString, toJson: localeToString) Locale? locale,@JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson) UiBrightness brightness, bool use24HourFormat, bool isPredictionUiEnabled, bool showPredictionIntro, bool showPredictionTeaser
});




}
/// @nodoc
class _$AppSettingsModelCopyWithImpl<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  _$AppSettingsModelCopyWithImpl(this._self, this._then);

  final AppSettingsModel _self;
  final $Res Function(AppSettingsModel) _then;

/// Create a copy of AppSettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = freezed,Object? brightness = null,Object? use24HourFormat = null,Object? isPredictionUiEnabled = null,Object? showPredictionIntro = null,Object? showPredictionTeaser = null,}) {
  return _then(AppSettingsModel(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale?,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as UiBrightness,use24HourFormat: null == use24HourFormat ? _self.use24HourFormat : use24HourFormat // ignore: cast_nullable_to_non_nullable
as bool,isPredictionUiEnabled: null == isPredictionUiEnabled ? _self.isPredictionUiEnabled : isPredictionUiEnabled // ignore: cast_nullable_to_non_nullable
as bool,showPredictionIntro: null == showPredictionIntro ? _self.showPredictionIntro : showPredictionIntro // ignore: cast_nullable_to_non_nullable
as bool,showPredictionTeaser: null == showPredictionTeaser ? _self.showPredictionTeaser : showPredictionTeaser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingsModel].
extension AppSettingsModelPatterns on AppSettingsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingsModel value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: localeFromString, toJson: localeToString)  Locale? locale, @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)  UiBrightness brightness,  bool use24HourFormat,  bool isPredictionUiEnabled,  bool showPredictionIntro,  bool showPredictionTeaser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingsModel() when $default != null:
return $default(_that.locale,_that.brightness,_that.use24HourFormat,_that.isPredictionUiEnabled,_that.showPredictionIntro,_that.showPredictionTeaser);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: localeFromString, toJson: localeToString)  Locale? locale, @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)  UiBrightness brightness,  bool use24HourFormat,  bool isPredictionUiEnabled,  bool showPredictionIntro,  bool showPredictionTeaser)  $default,) {final _that = this;
switch (_that) {
case _AppSettingsModel():
return $default(_that.locale,_that.brightness,_that.use24HourFormat,_that.isPredictionUiEnabled,_that.showPredictionIntro,_that.showPredictionTeaser);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: localeFromString, toJson: localeToString)  Locale? locale, @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)  UiBrightness brightness,  bool use24HourFormat,  bool isPredictionUiEnabled,  bool showPredictionIntro,  bool showPredictionTeaser)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingsModel() when $default != null:
return $default(_that.locale,_that.brightness,_that.use24HourFormat,_that.isPredictionUiEnabled,_that.showPredictionIntro,_that.showPredictionTeaser);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _AppSettingsModel extends AppSettingsModel {
  const _AppSettingsModel({@JsonKey(fromJson: localeFromString, toJson: localeToString) this.locale, @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson) this.brightness = UiBrightness.system, this.use24HourFormat = true, this.isPredictionUiEnabled = false, this.showPredictionIntro = true, this.showPredictionTeaser = true}): super._();
  factory _AppSettingsModel.fromJson(Map<String, dynamic> json) => _$AppSettingsModelFromJson(json);

@override@JsonKey(fromJson: localeFromString, toJson: localeToString) final  Locale? locale;
@override@JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson) final  UiBrightness brightness;
@override@JsonKey() final  bool use24HourFormat;
@override@JsonKey() final  bool isPredictionUiEnabled;
@override@JsonKey() final  bool showPredictionIntro;
@override@JsonKey() final  bool showPredictionTeaser;

/// Create a copy of AppSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsModelCopyWith<_AppSettingsModel> get copyWith => __$AppSettingsModelCopyWithImpl<_AppSettingsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingsModel&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.use24HourFormat, use24HourFormat) || other.use24HourFormat == use24HourFormat)&&(identical(other.isPredictionUiEnabled, isPredictionUiEnabled) || other.isPredictionUiEnabled == isPredictionUiEnabled)&&(identical(other.showPredictionIntro, showPredictionIntro) || other.showPredictionIntro == showPredictionIntro)&&(identical(other.showPredictionTeaser, showPredictionTeaser) || other.showPredictionTeaser == showPredictionTeaser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,brightness,use24HourFormat,isPredictionUiEnabled,showPredictionIntro,showPredictionTeaser);

@override
String toString() {
  return 'AppSettingsModel(locale: $locale, brightness: $brightness, use24HourFormat: $use24HourFormat, isPredictionUiEnabled: $isPredictionUiEnabled, showPredictionIntro: $showPredictionIntro, showPredictionTeaser: $showPredictionTeaser)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsModelCopyWith<$Res> implements $AppSettingsModelCopyWith<$Res> {
  factory _$AppSettingsModelCopyWith(_AppSettingsModel value, $Res Function(_AppSettingsModel) _then) = __$AppSettingsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: localeFromString, toJson: localeToString) Locale? locale,@JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson) UiBrightness brightness, bool use24HourFormat, bool isPredictionUiEnabled, bool showPredictionIntro, bool showPredictionTeaser
});




}
/// @nodoc
class __$AppSettingsModelCopyWithImpl<$Res>
    implements _$AppSettingsModelCopyWith<$Res> {
  __$AppSettingsModelCopyWithImpl(this._self, this._then);

  final _AppSettingsModel _self;
  final $Res Function(_AppSettingsModel) _then;

/// Create a copy of AppSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = freezed,Object? brightness = null,Object? use24HourFormat = null,Object? isPredictionUiEnabled = null,Object? showPredictionIntro = null,Object? showPredictionTeaser = null,}) {
  return _then(_AppSettingsModel(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale?,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as UiBrightness,use24HourFormat: null == use24HourFormat ? _self.use24HourFormat : use24HourFormat // ignore: cast_nullable_to_non_nullable
as bool,isPredictionUiEnabled: null == isPredictionUiEnabled ? _self.isPredictionUiEnabled : isPredictionUiEnabled // ignore: cast_nullable_to_non_nullable
as bool,showPredictionIntro: null == showPredictionIntro ? _self.showPredictionIntro : showPredictionIntro // ignore: cast_nullable_to_non_nullable
as bool,showPredictionTeaser: null == showPredictionTeaser ? _self.showPredictionTeaser : showPredictionTeaser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$BudgetModelId {

 String get value;
/// Create a copy of BudgetModelId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetModelIdCopyWith<BudgetModelId> get copyWith => _$BudgetModelIdCopyWithImpl<BudgetModelId>(this as BudgetModelId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetModelId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'BudgetModelId(value: $value)';
}


}

/// @nodoc
abstract mixin class $BudgetModelIdCopyWith<$Res>  {
  factory $BudgetModelIdCopyWith(BudgetModelId value, $Res Function(BudgetModelId) _then) = _$BudgetModelIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$BudgetModelIdCopyWithImpl<$Res>
    implements $BudgetModelIdCopyWith<$Res> {
  _$BudgetModelIdCopyWithImpl(this._self, this._then);

  final BudgetModelId _self;
  final $Res Function(BudgetModelId) _then;

/// Create a copy of BudgetModelId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(BudgetModelId(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetModelId].
extension BudgetModelIdPatterns on BudgetModelId {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetModelId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetModelId() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetModelId value)  $default,){
final _that = this;
switch (_that) {
case _BudgetModelId():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetModelId value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetModelId() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetModelId() when $default != null:
return $default(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value)  $default,) {final _that = this;
switch (_that) {
case _BudgetModelId():
return $default(_that.value);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value)?  $default,) {final _that = this;
switch (_that) {
case _BudgetModelId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetModelId extends BudgetModelId {
  const _BudgetModelId({required this.value}): super._();
  

@override final  String value;

/// Create a copy of BudgetModelId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetModelIdCopyWith<_BudgetModelId> get copyWith => __$BudgetModelIdCopyWithImpl<_BudgetModelId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetModelId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'BudgetModelId(value: $value)';
}


}

/// @nodoc
abstract mixin class _$BudgetModelIdCopyWith<$Res> implements $BudgetModelIdCopyWith<$Res> {
  factory _$BudgetModelIdCopyWith(_BudgetModelId value, $Res Function(_BudgetModelId) _then) = __$BudgetModelIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$BudgetModelIdCopyWithImpl<$Res>
    implements _$BudgetModelIdCopyWith<$Res> {
  __$BudgetModelIdCopyWithImpl(this._self, this._then);

  final _BudgetModelId _self;
  final $Res Function(_BudgetModelId) _then;

/// Create a copy of BudgetModelId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_BudgetModelId(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MonthlyBudgetModel {

 BudgetModelId get id;@JsonKey(fromJson: dateTimeFromMillisecondsSinceEpoch, toJson: dateTimeToMillisecondsSinceEpoch) DateTime? get nextBudgetDay; double get amount; double get savings;
/// Create a copy of MonthlyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyBudgetModelCopyWith<MonthlyBudgetModel> get copyWith => _$MonthlyBudgetModelCopyWithImpl<MonthlyBudgetModel>(this as MonthlyBudgetModel, _$identity);

  /// Serializes this MonthlyBudgetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyBudgetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nextBudgetDay, nextBudgetDay) || other.nextBudgetDay == nextBudgetDay)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.savings, savings) || other.savings == savings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nextBudgetDay,amount,savings);

@override
String toString() {
  return 'MonthlyBudgetModel(id: $id, nextBudgetDay: $nextBudgetDay, amount: $amount, savings: $savings)';
}


}

/// @nodoc
abstract mixin class $MonthlyBudgetModelCopyWith<$Res>  {
  factory $MonthlyBudgetModelCopyWith(MonthlyBudgetModel value, $Res Function(MonthlyBudgetModel) _then) = _$MonthlyBudgetModelCopyWithImpl;
@useResult
$Res call({
 BudgetModelId id,@JsonKey(fromJson: dateTimeFromMillisecondsSinceEpoch, toJson: dateTimeToMillisecondsSinceEpoch) DateTime? nextBudgetDay, double amount, double savings
});


$BudgetModelIdCopyWith<$Res> get id;

}
/// @nodoc
class _$MonthlyBudgetModelCopyWithImpl<$Res>
    implements $MonthlyBudgetModelCopyWith<$Res> {
  _$MonthlyBudgetModelCopyWithImpl(this._self, this._then);

  final MonthlyBudgetModel _self;
  final $Res Function(MonthlyBudgetModel) _then;

/// Create a copy of MonthlyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nextBudgetDay = freezed,Object? amount = null,Object? savings = null,}) {
  return _then(MonthlyBudgetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BudgetModelId,nextBudgetDay: freezed == nextBudgetDay ? _self.nextBudgetDay : nextBudgetDay // ignore: cast_nullable_to_non_nullable
as DateTime?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,savings: null == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of MonthlyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetModelIdCopyWith<$Res> get id {
  
  return $BudgetModelIdCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}
}


/// Adds pattern-matching-related methods to [MonthlyBudgetModel].
extension MonthlyBudgetModelPatterns on MonthlyBudgetModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyBudgetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyBudgetModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyBudgetModel value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyBudgetModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyBudgetModel value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyBudgetModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BudgetModelId id, @JsonKey(fromJson: dateTimeFromMillisecondsSinceEpoch, toJson: dateTimeToMillisecondsSinceEpoch)  DateTime? nextBudgetDay,  double amount,  double savings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyBudgetModel() when $default != null:
return $default(_that.id,_that.nextBudgetDay,_that.amount,_that.savings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BudgetModelId id, @JsonKey(fromJson: dateTimeFromMillisecondsSinceEpoch, toJson: dateTimeToMillisecondsSinceEpoch)  DateTime? nextBudgetDay,  double amount,  double savings)  $default,) {final _that = this;
switch (_that) {
case _MonthlyBudgetModel():
return $default(_that.id,_that.nextBudgetDay,_that.amount,_that.savings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BudgetModelId id, @JsonKey(fromJson: dateTimeFromMillisecondsSinceEpoch, toJson: dateTimeToMillisecondsSinceEpoch)  DateTime? nextBudgetDay,  double amount,  double savings)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyBudgetModel() when $default != null:
return $default(_that.id,_that.nextBudgetDay,_that.amount,_that.savings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlyBudgetModel implements MonthlyBudgetModel {
  const _MonthlyBudgetModel({required this.id, @JsonKey(fromJson: dateTimeFromMillisecondsSinceEpoch, toJson: dateTimeToMillisecondsSinceEpoch) this.nextBudgetDay, this.amount = 0, this.savings = 0});
  factory _MonthlyBudgetModel.fromJson(Map<String, dynamic> json) => _$MonthlyBudgetModelFromJson(json);

@override final  BudgetModelId id;
@override@JsonKey(fromJson: dateTimeFromMillisecondsSinceEpoch, toJson: dateTimeToMillisecondsSinceEpoch) final  DateTime? nextBudgetDay;
@override@JsonKey() final  double amount;
@override@JsonKey() final  double savings;

/// Create a copy of MonthlyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyBudgetModelCopyWith<_MonthlyBudgetModel> get copyWith => __$MonthlyBudgetModelCopyWithImpl<_MonthlyBudgetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlyBudgetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyBudgetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nextBudgetDay, nextBudgetDay) || other.nextBudgetDay == nextBudgetDay)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.savings, savings) || other.savings == savings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nextBudgetDay,amount,savings);

@override
String toString() {
  return 'MonthlyBudgetModel(id: $id, nextBudgetDay: $nextBudgetDay, amount: $amount, savings: $savings)';
}


}

/// @nodoc
abstract mixin class _$MonthlyBudgetModelCopyWith<$Res> implements $MonthlyBudgetModelCopyWith<$Res> {
  factory _$MonthlyBudgetModelCopyWith(_MonthlyBudgetModel value, $Res Function(_MonthlyBudgetModel) _then) = __$MonthlyBudgetModelCopyWithImpl;
@override @useResult
$Res call({
 BudgetModelId id,@JsonKey(fromJson: dateTimeFromMillisecondsSinceEpoch, toJson: dateTimeToMillisecondsSinceEpoch) DateTime? nextBudgetDay, double amount, double savings
});


@override $BudgetModelIdCopyWith<$Res> get id;

}
/// @nodoc
class __$MonthlyBudgetModelCopyWithImpl<$Res>
    implements _$MonthlyBudgetModelCopyWith<$Res> {
  __$MonthlyBudgetModelCopyWithImpl(this._self, this._then);

  final _MonthlyBudgetModel _self;
  final $Res Function(_MonthlyBudgetModel) _then;

/// Create a copy of MonthlyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nextBudgetDay = freezed,Object? amount = null,Object? savings = null,}) {
  return _then(_MonthlyBudgetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BudgetModelId,nextBudgetDay: freezed == nextBudgetDay ? _self.nextBudgetDay : nextBudgetDay // ignore: cast_nullable_to_non_nullable
as DateTime?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,savings: null == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of MonthlyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetModelIdCopyWith<$Res> get id {
  
  return $BudgetModelIdCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}
}


/// @nodoc
mixin _$WeeklyBudgetModel {

 BudgetModelId get id; double get amount;
/// Create a copy of WeeklyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyBudgetModelCopyWith<WeeklyBudgetModel> get copyWith => _$WeeklyBudgetModelCopyWithImpl<WeeklyBudgetModel>(this as WeeklyBudgetModel, _$identity);

  /// Serializes this WeeklyBudgetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyBudgetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount);

@override
String toString() {
  return 'WeeklyBudgetModel(id: $id, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $WeeklyBudgetModelCopyWith<$Res>  {
  factory $WeeklyBudgetModelCopyWith(WeeklyBudgetModel value, $Res Function(WeeklyBudgetModel) _then) = _$WeeklyBudgetModelCopyWithImpl;
@useResult
$Res call({
 BudgetModelId id, double amount
});


$BudgetModelIdCopyWith<$Res> get id;

}
/// @nodoc
class _$WeeklyBudgetModelCopyWithImpl<$Res>
    implements $WeeklyBudgetModelCopyWith<$Res> {
  _$WeeklyBudgetModelCopyWithImpl(this._self, this._then);

  final WeeklyBudgetModel _self;
  final $Res Function(WeeklyBudgetModel) _then;

/// Create a copy of WeeklyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,}) {
  return _then(WeeklyBudgetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BudgetModelId,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of WeeklyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetModelIdCopyWith<$Res> get id {
  
  return $BudgetModelIdCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeeklyBudgetModel].
extension WeeklyBudgetModelPatterns on WeeklyBudgetModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyBudgetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyBudgetModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyBudgetModel value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyBudgetModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyBudgetModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyBudgetModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BudgetModelId id,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyBudgetModel() when $default != null:
return $default(_that.id,_that.amount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BudgetModelId id,  double amount)  $default,) {final _that = this;
switch (_that) {
case _WeeklyBudgetModel():
return $default(_that.id,_that.amount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BudgetModelId id,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyBudgetModel() when $default != null:
return $default(_that.id,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeeklyBudgetModel implements WeeklyBudgetModel {
  const _WeeklyBudgetModel({required this.id, this.amount = 0});
  factory _WeeklyBudgetModel.fromJson(Map<String, dynamic> json) => _$WeeklyBudgetModelFromJson(json);

@override final  BudgetModelId id;
@override@JsonKey() final  double amount;

/// Create a copy of WeeklyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyBudgetModelCopyWith<_WeeklyBudgetModel> get copyWith => __$WeeklyBudgetModelCopyWithImpl<_WeeklyBudgetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeeklyBudgetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyBudgetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount);

@override
String toString() {
  return 'WeeklyBudgetModel(id: $id, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$WeeklyBudgetModelCopyWith<$Res> implements $WeeklyBudgetModelCopyWith<$Res> {
  factory _$WeeklyBudgetModelCopyWith(_WeeklyBudgetModel value, $Res Function(_WeeklyBudgetModel) _then) = __$WeeklyBudgetModelCopyWithImpl;
@override @useResult
$Res call({
 BudgetModelId id, double amount
});


@override $BudgetModelIdCopyWith<$Res> get id;

}
/// @nodoc
class __$WeeklyBudgetModelCopyWithImpl<$Res>
    implements _$WeeklyBudgetModelCopyWith<$Res> {
  __$WeeklyBudgetModelCopyWithImpl(this._self, this._then);

  final _WeeklyBudgetModel _self;
  final $Res Function(_WeeklyBudgetModel) _then;

/// Create a copy of WeeklyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,}) {
  return _then(_WeeklyBudgetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BudgetModelId,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of WeeklyBudgetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetModelIdCopyWith<$Res> get id {
  
  return $BudgetModelIdCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}
}


/// @nodoc
mixin _$Budget {

 DateTime get date; BudgetId get id; InputMoney get input; BudgetType get type; BudgetTransactionType get transactionType; PersonalIncomeBudgetType get personalIncomeType; PersonalExpenseBudgetType get personalExpenseType;
/// Create a copy of Budget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetCopyWith<Budget> get copyWith => _$BudgetCopyWithImpl<Budget>(this as Budget, _$identity);

  /// Serializes this Budget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Budget&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.input, input) || other.input == input)&&(identical(other.type, type) || other.type == type)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.personalIncomeType, personalIncomeType) || other.personalIncomeType == personalIncomeType)&&(identical(other.personalExpenseType, personalExpenseType) || other.personalExpenseType == personalExpenseType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,id,input,type,transactionType,personalIncomeType,personalExpenseType);

@override
String toString() {
  return 'Budget(date: $date, id: $id, input: $input, type: $type, transactionType: $transactionType, personalIncomeType: $personalIncomeType, personalExpenseType: $personalExpenseType)';
}


}

/// @nodoc
abstract mixin class $BudgetCopyWith<$Res>  {
  factory $BudgetCopyWith(Budget value, $Res Function(Budget) _then) = _$BudgetCopyWithImpl;
@useResult
$Res call({
 DateTime date, BudgetId id, InputMoney input, BudgetType type, BudgetTransactionType transactionType, PersonalIncomeBudgetType personalIncomeType, PersonalExpenseBudgetType personalExpenseType
});


$InputMoneyCopyWith<$Res> get input;

}
/// @nodoc
class _$BudgetCopyWithImpl<$Res>
    implements $BudgetCopyWith<$Res> {
  _$BudgetCopyWithImpl(this._self, this._then);

  final Budget _self;
  final $Res Function(Budget) _then;

/// Create a copy of Budget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? id = null,Object? input = null,Object? type = null,Object? transactionType = null,Object? personalIncomeType = null,Object? personalExpenseType = null,}) {
  return _then(Budget(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BudgetId,input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as InputMoney,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BudgetType,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as BudgetTransactionType,personalIncomeType: null == personalIncomeType ? _self.personalIncomeType : personalIncomeType // ignore: cast_nullable_to_non_nullable
as PersonalIncomeBudgetType,personalExpenseType: null == personalExpenseType ? _self.personalExpenseType : personalExpenseType // ignore: cast_nullable_to_non_nullable
as PersonalExpenseBudgetType,
  ));
}
/// Create a copy of Budget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputMoneyCopyWith<$Res> get input {
  
  return $InputMoneyCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}


/// Adds pattern-matching-related methods to [Budget].
extension BudgetPatterns on Budget {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Budget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Budget() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Budget value)  $default,){
final _that = this;
switch (_that) {
case _Budget():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Budget value)?  $default,){
final _that = this;
switch (_that) {
case _Budget() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  BudgetId id,  InputMoney input,  BudgetType type,  BudgetTransactionType transactionType,  PersonalIncomeBudgetType personalIncomeType,  PersonalExpenseBudgetType personalExpenseType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Budget() when $default != null:
return $default(_that.date,_that.id,_that.input,_that.type,_that.transactionType,_that.personalIncomeType,_that.personalExpenseType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  BudgetId id,  InputMoney input,  BudgetType type,  BudgetTransactionType transactionType,  PersonalIncomeBudgetType personalIncomeType,  PersonalExpenseBudgetType personalExpenseType)  $default,) {final _that = this;
switch (_that) {
case _Budget():
return $default(_that.date,_that.id,_that.input,_that.type,_that.transactionType,_that.personalIncomeType,_that.personalExpenseType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  BudgetId id,  InputMoney input,  BudgetType type,  BudgetTransactionType transactionType,  PersonalIncomeBudgetType personalIncomeType,  PersonalExpenseBudgetType personalExpenseType)?  $default,) {final _that = this;
switch (_that) {
case _Budget() when $default != null:
return $default(_that.date,_that.id,_that.input,_that.type,_that.transactionType,_that.personalIncomeType,_that.personalExpenseType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Budget extends Budget {
  const _Budget({required this.date, this.id = BudgetId.empty, this.input = InputMoney.empty, this.type = BudgetType.personal, this.transactionType = BudgetTransactionType.income, this.personalIncomeType = PersonalIncomeBudgetType.salary, this.personalExpenseType = PersonalExpenseBudgetType.other}): super._();
  factory _Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);

@override final  DateTime date;
@override@JsonKey() final  BudgetId id;
@override@JsonKey() final  InputMoney input;
@override@JsonKey() final  BudgetType type;
@override@JsonKey() final  BudgetTransactionType transactionType;
@override@JsonKey() final  PersonalIncomeBudgetType personalIncomeType;
@override@JsonKey() final  PersonalExpenseBudgetType personalExpenseType;

/// Create a copy of Budget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetCopyWith<_Budget> get copyWith => __$BudgetCopyWithImpl<_Budget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BudgetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Budget&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.input, input) || other.input == input)&&(identical(other.type, type) || other.type == type)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.personalIncomeType, personalIncomeType) || other.personalIncomeType == personalIncomeType)&&(identical(other.personalExpenseType, personalExpenseType) || other.personalExpenseType == personalExpenseType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,id,input,type,transactionType,personalIncomeType,personalExpenseType);

@override
String toString() {
  return 'Budget(date: $date, id: $id, input: $input, type: $type, transactionType: $transactionType, personalIncomeType: $personalIncomeType, personalExpenseType: $personalExpenseType)';
}


}

/// @nodoc
abstract mixin class _$BudgetCopyWith<$Res> implements $BudgetCopyWith<$Res> {
  factory _$BudgetCopyWith(_Budget value, $Res Function(_Budget) _then) = __$BudgetCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, BudgetId id, InputMoney input, BudgetType type, BudgetTransactionType transactionType, PersonalIncomeBudgetType personalIncomeType, PersonalExpenseBudgetType personalExpenseType
});


@override $InputMoneyCopyWith<$Res> get input;

}
/// @nodoc
class __$BudgetCopyWithImpl<$Res>
    implements _$BudgetCopyWith<$Res> {
  __$BudgetCopyWithImpl(this._self, this._then);

  final _Budget _self;
  final $Res Function(_Budget) _then;

/// Create a copy of Budget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? id = null,Object? input = null,Object? type = null,Object? transactionType = null,Object? personalIncomeType = null,Object? personalExpenseType = null,}) {
  return _then(_Budget(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BudgetId,input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as InputMoney,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BudgetType,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as BudgetTransactionType,personalIncomeType: null == personalIncomeType ? _self.personalIncomeType : personalIncomeType // ignore: cast_nullable_to_non_nullable
as PersonalIncomeBudgetType,personalExpenseType: null == personalExpenseType ? _self.personalExpenseType : personalExpenseType // ignore: cast_nullable_to_non_nullable
as PersonalExpenseBudgetType,
  ));
}

/// Create a copy of Budget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputMoneyCopyWith<$Res> get input {
  
  return $InputMoneyCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}


/// @nodoc
mixin _$Commitment {

 CommitmentId get id; String get title; double get amount; Period get period; CommitmentType get type; CategoryId get categoryId; DateTime get startedAt; DateTime? get endedAt;/// Optional day of period when the charge occurs (1..31 for monthly).
 int get chargeDayOfMonth;
/// Create a copy of Commitment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommitmentCopyWith<Commitment> get copyWith => _$CommitmentCopyWithImpl<Commitment>(this as Commitment, _$identity);

  /// Serializes this Commitment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Commitment&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.period, period) || other.period == period)&&(identical(other.type, type) || other.type == type)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.chargeDayOfMonth, chargeDayOfMonth) || other.chargeDayOfMonth == chargeDayOfMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,period,type,categoryId,startedAt,endedAt,chargeDayOfMonth);

@override
String toString() {
  return 'Commitment(id: $id, title: $title, amount: $amount, period: $period, type: $type, categoryId: $categoryId, startedAt: $startedAt, endedAt: $endedAt, chargeDayOfMonth: $chargeDayOfMonth)';
}


}

/// @nodoc
abstract mixin class $CommitmentCopyWith<$Res>  {
  factory $CommitmentCopyWith(Commitment value, $Res Function(Commitment) _then) = _$CommitmentCopyWithImpl;
@useResult
$Res call({
 CommitmentId id, String title, double amount, Period period, CommitmentType type, CategoryId categoryId, DateTime startedAt, DateTime? endedAt, int chargeDayOfMonth
});




}
/// @nodoc
class _$CommitmentCopyWithImpl<$Res>
    implements $CommitmentCopyWith<$Res> {
  _$CommitmentCopyWithImpl(this._self, this._then);

  final Commitment _self;
  final $Res Function(Commitment) _then;

/// Create a copy of Commitment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? period = null,Object? type = null,Object? categoryId = null,Object? startedAt = null,Object? endedAt = freezed,Object? chargeDayOfMonth = null,}) {
  return _then(Commitment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CommitmentId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as Period,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CommitmentType,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,chargeDayOfMonth: null == chargeDayOfMonth ? _self.chargeDayOfMonth : chargeDayOfMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Commitment].
extension CommitmentPatterns on Commitment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Commitment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Commitment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Commitment value)  $default,){
final _that = this;
switch (_that) {
case _Commitment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Commitment value)?  $default,){
final _that = this;
switch (_that) {
case _Commitment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommitmentId id,  String title,  double amount,  Period period,  CommitmentType type,  CategoryId categoryId,  DateTime startedAt,  DateTime? endedAt,  int chargeDayOfMonth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Commitment() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.period,_that.type,_that.categoryId,_that.startedAt,_that.endedAt,_that.chargeDayOfMonth);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommitmentId id,  String title,  double amount,  Period period,  CommitmentType type,  CategoryId categoryId,  DateTime startedAt,  DateTime? endedAt,  int chargeDayOfMonth)  $default,) {final _that = this;
switch (_that) {
case _Commitment():
return $default(_that.id,_that.title,_that.amount,_that.period,_that.type,_that.categoryId,_that.startedAt,_that.endedAt,_that.chargeDayOfMonth);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommitmentId id,  String title,  double amount,  Period period,  CommitmentType type,  CategoryId categoryId,  DateTime startedAt,  DateTime? endedAt,  int chargeDayOfMonth)?  $default,) {final _that = this;
switch (_that) {
case _Commitment() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.period,_that.type,_that.categoryId,_that.startedAt,_that.endedAt,_that.chargeDayOfMonth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Commitment extends Commitment {
  const _Commitment({this.id = CommitmentId.empty, this.title = '', this.amount = 0.0, this.period = Period.monthly, this.type = CommitmentType.subscription, this.categoryId = CategoryId.empty, required this.startedAt, this.endedAt, this.chargeDayOfMonth = 1}): super._();
  factory _Commitment.fromJson(Map<String, dynamic> json) => _$CommitmentFromJson(json);

@override@JsonKey() final  CommitmentId id;
@override@JsonKey() final  String title;
@override@JsonKey() final  double amount;
@override@JsonKey() final  Period period;
@override@JsonKey() final  CommitmentType type;
@override@JsonKey() final  CategoryId categoryId;
@override final  DateTime startedAt;
@override final  DateTime? endedAt;
/// Optional day of period when the charge occurs (1..31 for monthly).
@override@JsonKey() final  int chargeDayOfMonth;

/// Create a copy of Commitment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommitmentCopyWith<_Commitment> get copyWith => __$CommitmentCopyWithImpl<_Commitment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommitmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Commitment&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.period, period) || other.period == period)&&(identical(other.type, type) || other.type == type)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.chargeDayOfMonth, chargeDayOfMonth) || other.chargeDayOfMonth == chargeDayOfMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,period,type,categoryId,startedAt,endedAt,chargeDayOfMonth);

@override
String toString() {
  return 'Commitment(id: $id, title: $title, amount: $amount, period: $period, type: $type, categoryId: $categoryId, startedAt: $startedAt, endedAt: $endedAt, chargeDayOfMonth: $chargeDayOfMonth)';
}


}

/// @nodoc
abstract mixin class _$CommitmentCopyWith<$Res> implements $CommitmentCopyWith<$Res> {
  factory _$CommitmentCopyWith(_Commitment value, $Res Function(_Commitment) _then) = __$CommitmentCopyWithImpl;
@override @useResult
$Res call({
 CommitmentId id, String title, double amount, Period period, CommitmentType type, CategoryId categoryId, DateTime startedAt, DateTime? endedAt, int chargeDayOfMonth
});




}
/// @nodoc
class __$CommitmentCopyWithImpl<$Res>
    implements _$CommitmentCopyWith<$Res> {
  __$CommitmentCopyWithImpl(this._self, this._then);

  final _Commitment _self;
  final $Res Function(_Commitment) _then;

/// Create a copy of Commitment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? period = null,Object? type = null,Object? categoryId = null,Object? startedAt = null,Object? endedAt = freezed,Object? chargeDayOfMonth = null,}) {
  return _then(_Commitment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CommitmentId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as Period,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CommitmentType,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,chargeDayOfMonth: null == chargeDayOfMonth ? _self.chargeDayOfMonth : chargeDayOfMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PlannedSum {

 BudgetId get id; TransactionType get type; double get amount; DateTime get periodStart; Period get period;
/// Create a copy of PlannedSum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlannedSumCopyWith<PlannedSum> get copyWith => _$PlannedSumCopyWithImpl<PlannedSum>(this as PlannedSum, _$identity);

  /// Serializes this PlannedSum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlannedSum&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,periodStart,period);

@override
String toString() {
  return 'PlannedSum(id: $id, type: $type, amount: $amount, periodStart: $periodStart, period: $period)';
}


}

/// @nodoc
abstract mixin class $PlannedSumCopyWith<$Res>  {
  factory $PlannedSumCopyWith(PlannedSum value, $Res Function(PlannedSum) _then) = _$PlannedSumCopyWithImpl;
@useResult
$Res call({
 BudgetId id, TransactionType type, double amount, DateTime periodStart, Period period
});




}
/// @nodoc
class _$PlannedSumCopyWithImpl<$Res>
    implements $PlannedSumCopyWith<$Res> {
  _$PlannedSumCopyWithImpl(this._self, this._then);

  final PlannedSum _self;
  final $Res Function(PlannedSum) _then;

/// Create a copy of PlannedSum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? periodStart = null,Object? period = null,}) {
  return _then(PlannedSum(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BudgetId,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as DateTime,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as Period,
  ));
}

}


/// Adds pattern-matching-related methods to [PlannedSum].
extension PlannedSumPatterns on PlannedSum {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlannedSum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlannedSum() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlannedSum value)  $default,){
final _that = this;
switch (_that) {
case _PlannedSum():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlannedSum value)?  $default,){
final _that = this;
switch (_that) {
case _PlannedSum() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BudgetId id,  TransactionType type,  double amount,  DateTime periodStart,  Period period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlannedSum() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.periodStart,_that.period);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BudgetId id,  TransactionType type,  double amount,  DateTime periodStart,  Period period)  $default,) {final _that = this;
switch (_that) {
case _PlannedSum():
return $default(_that.id,_that.type,_that.amount,_that.periodStart,_that.period);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BudgetId id,  TransactionType type,  double amount,  DateTime periodStart,  Period period)?  $default,) {final _that = this;
switch (_that) {
case _PlannedSum() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.periodStart,_that.period);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlannedSum extends PlannedSum {
  const _PlannedSum({this.id = BudgetId.empty, this.type = TransactionType.expense, this.amount = 0.0, required this.periodStart, this.period = Period.monthly}): super._();
  factory _PlannedSum.fromJson(Map<String, dynamic> json) => _$PlannedSumFromJson(json);

@override@JsonKey() final  BudgetId id;
@override@JsonKey() final  TransactionType type;
@override@JsonKey() final  double amount;
@override final  DateTime periodStart;
@override@JsonKey() final  Period period;

/// Create a copy of PlannedSum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlannedSumCopyWith<_PlannedSum> get copyWith => __$PlannedSumCopyWithImpl<_PlannedSum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlannedSumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlannedSum&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,periodStart,period);

@override
String toString() {
  return 'PlannedSum(id: $id, type: $type, amount: $amount, periodStart: $periodStart, period: $period)';
}


}

/// @nodoc
abstract mixin class _$PlannedSumCopyWith<$Res> implements $PlannedSumCopyWith<$Res> {
  factory _$PlannedSumCopyWith(_PlannedSum value, $Res Function(_PlannedSum) _then) = __$PlannedSumCopyWithImpl;
@override @useResult
$Res call({
 BudgetId id, TransactionType type, double amount, DateTime periodStart, Period period
});




}
/// @nodoc
class __$PlannedSumCopyWithImpl<$Res>
    implements _$PlannedSumCopyWith<$Res> {
  __$PlannedSumCopyWithImpl(this._self, this._then);

  final _PlannedSum _self;
  final $Res Function(_PlannedSum) _then;

/// Create a copy of PlannedSum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? periodStart = null,Object? period = null,}) {
  return _then(_PlannedSum(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BudgetId,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as DateTime,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as Period,
  ));
}


}


/// @nodoc
mixin _$FinSettingsModel {

 CurrencyId get fiatCurrencyId; CurrencyId get cryptoCurrencyId;
/// Create a copy of FinSettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinSettingsModelCopyWith<FinSettingsModel> get copyWith => _$FinSettingsModelCopyWithImpl<FinSettingsModel>(this as FinSettingsModel, _$identity);

  /// Serializes this FinSettingsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinSettingsModel&&(identical(other.fiatCurrencyId, fiatCurrencyId) || other.fiatCurrencyId == fiatCurrencyId)&&(identical(other.cryptoCurrencyId, cryptoCurrencyId) || other.cryptoCurrencyId == cryptoCurrencyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fiatCurrencyId,cryptoCurrencyId);

@override
String toString() {
  return 'FinSettingsModel(fiatCurrencyId: $fiatCurrencyId, cryptoCurrencyId: $cryptoCurrencyId)';
}


}

/// @nodoc
abstract mixin class $FinSettingsModelCopyWith<$Res>  {
  factory $FinSettingsModelCopyWith(FinSettingsModel value, $Res Function(FinSettingsModel) _then) = _$FinSettingsModelCopyWithImpl;
@useResult
$Res call({
 CurrencyId fiatCurrencyId, CurrencyId cryptoCurrencyId
});




}
/// @nodoc
class _$FinSettingsModelCopyWithImpl<$Res>
    implements $FinSettingsModelCopyWith<$Res> {
  _$FinSettingsModelCopyWithImpl(this._self, this._then);

  final FinSettingsModel _self;
  final $Res Function(FinSettingsModel) _then;

/// Create a copy of FinSettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fiatCurrencyId = null,Object? cryptoCurrencyId = null,}) {
  return _then(FinSettingsModel(
fiatCurrencyId: null == fiatCurrencyId ? _self.fiatCurrencyId : fiatCurrencyId // ignore: cast_nullable_to_non_nullable
as CurrencyId,cryptoCurrencyId: null == cryptoCurrencyId ? _self.cryptoCurrencyId : cryptoCurrencyId // ignore: cast_nullable_to_non_nullable
as CurrencyId,
  ));
}

}


/// Adds pattern-matching-related methods to [FinSettingsModel].
extension FinSettingsModelPatterns on FinSettingsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinSettingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinSettingsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinSettingsModel value)  $default,){
final _that = this;
switch (_that) {
case _FinSettingsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinSettingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _FinSettingsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CurrencyId fiatCurrencyId,  CurrencyId cryptoCurrencyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinSettingsModel() when $default != null:
return $default(_that.fiatCurrencyId,_that.cryptoCurrencyId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CurrencyId fiatCurrencyId,  CurrencyId cryptoCurrencyId)  $default,) {final _that = this;
switch (_that) {
case _FinSettingsModel():
return $default(_that.fiatCurrencyId,_that.cryptoCurrencyId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CurrencyId fiatCurrencyId,  CurrencyId cryptoCurrencyId)?  $default,) {final _that = this;
switch (_that) {
case _FinSettingsModel() when $default != null:
return $default(_that.fiatCurrencyId,_that.cryptoCurrencyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinSettingsModel implements FinSettingsModel {
  const _FinSettingsModel({this.fiatCurrencyId = CurrencyId.empty, this.cryptoCurrencyId = CurrencyId.empty});
  factory _FinSettingsModel.fromJson(Map<String, dynamic> json) => _$FinSettingsModelFromJson(json);

@override@JsonKey() final  CurrencyId fiatCurrencyId;
@override@JsonKey() final  CurrencyId cryptoCurrencyId;

/// Create a copy of FinSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinSettingsModelCopyWith<_FinSettingsModel> get copyWith => __$FinSettingsModelCopyWithImpl<_FinSettingsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinSettingsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinSettingsModel&&(identical(other.fiatCurrencyId, fiatCurrencyId) || other.fiatCurrencyId == fiatCurrencyId)&&(identical(other.cryptoCurrencyId, cryptoCurrencyId) || other.cryptoCurrencyId == cryptoCurrencyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fiatCurrencyId,cryptoCurrencyId);

@override
String toString() {
  return 'FinSettingsModel(fiatCurrencyId: $fiatCurrencyId, cryptoCurrencyId: $cryptoCurrencyId)';
}


}

/// @nodoc
abstract mixin class _$FinSettingsModelCopyWith<$Res> implements $FinSettingsModelCopyWith<$Res> {
  factory _$FinSettingsModelCopyWith(_FinSettingsModel value, $Res Function(_FinSettingsModel) _then) = __$FinSettingsModelCopyWithImpl;
@override @useResult
$Res call({
 CurrencyId fiatCurrencyId, CurrencyId cryptoCurrencyId
});




}
/// @nodoc
class __$FinSettingsModelCopyWithImpl<$Res>
    implements _$FinSettingsModelCopyWith<$Res> {
  __$FinSettingsModelCopyWithImpl(this._self, this._then);

  final _FinSettingsModel _self;
  final $Res Function(_FinSettingsModel) _then;

/// Create a copy of FinSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fiatCurrencyId = null,Object? cryptoCurrencyId = null,}) {
  return _then(_FinSettingsModel(
fiatCurrencyId: null == fiatCurrencyId ? _self.fiatCurrencyId : fiatCurrencyId // ignore: cast_nullable_to_non_nullable
as CurrencyId,cryptoCurrencyId: null == cryptoCurrencyId ? _self.cryptoCurrencyId : cryptoCurrencyId // ignore: cast_nullable_to_non_nullable
as CurrencyId,
  ));
}


}


/// @nodoc
mixin _$FinTaskModel {

 DateTime get startDate; TaskId get id; String get name; FinTaskModelPurpose get purpose; TaskType get type; TaskStatus get status; Period get period; TaskId get regularIncomeTaskId;
/// Create a copy of FinTaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinTaskModelCopyWith<FinTaskModel> get copyWith => _$FinTaskModelCopyWithImpl<FinTaskModel>(this as FinTaskModel, _$identity);

  /// Serializes this FinTaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinTaskModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.period, period) || other.period == period)&&(identical(other.regularIncomeTaskId, regularIncomeTaskId) || other.regularIncomeTaskId == regularIncomeTaskId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,id,name,purpose,type,status,period,regularIncomeTaskId);

@override
String toString() {
  return 'FinTaskModel(startDate: $startDate, id: $id, name: $name, purpose: $purpose, type: $type, status: $status, period: $period, regularIncomeTaskId: $regularIncomeTaskId)';
}


}

/// @nodoc
abstract mixin class $FinTaskModelCopyWith<$Res>  {
  factory $FinTaskModelCopyWith(FinTaskModel value, $Res Function(FinTaskModel) _then) = _$FinTaskModelCopyWithImpl;
@useResult
$Res call({
 TaskId id, String name, FinTaskModelPurpose purpose, TaskType type, TaskStatus status, Period period, DateTime? startDate, TaskId regularIncomeTaskId
});




}
/// @nodoc
class _$FinTaskModelCopyWithImpl<$Res>
    implements $FinTaskModelCopyWith<$Res> {
  _$FinTaskModelCopyWithImpl(this._self, this._then);

  final FinTaskModel _self;
  final $Res Function(FinTaskModel) _then;

/// Create a copy of FinTaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? purpose = null,Object? type = null,Object? status = null,Object? period = null,Object? startDate = freezed,Object? regularIncomeTaskId = null,}) {
  return _then(FinTaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TaskId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as FinTaskModelPurpose,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as Period,startDate: freezed == startDate ? _self.startDate! : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,regularIncomeTaskId: null == regularIncomeTaskId ? _self.regularIncomeTaskId : regularIncomeTaskId // ignore: cast_nullable_to_non_nullable
as TaskId,
  ));
}

}


/// Adds pattern-matching-related methods to [FinTaskModel].
extension FinTaskModelPatterns on FinTaskModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinTaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinTaskModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinTaskModel value)  $default,){
final _that = this;
switch (_that) {
case _FinTaskModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinTaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _FinTaskModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TaskId id,  String name,  FinTaskModelPurpose purpose,  TaskType type,  TaskStatus status,  Period period,  DateTime? startDate,  TaskId regularIncomeTaskId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinTaskModel() when $default != null:
return $default(_that.id,_that.name,_that.purpose,_that.type,_that.status,_that.period,_that.startDate,_that.regularIncomeTaskId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TaskId id,  String name,  FinTaskModelPurpose purpose,  TaskType type,  TaskStatus status,  Period period,  DateTime? startDate,  TaskId regularIncomeTaskId)  $default,) {final _that = this;
switch (_that) {
case _FinTaskModel():
return $default(_that.id,_that.name,_that.purpose,_that.type,_that.status,_that.period,_that.startDate,_that.regularIncomeTaskId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TaskId id,  String name,  FinTaskModelPurpose purpose,  TaskType type,  TaskStatus status,  Period period,  DateTime? startDate,  TaskId regularIncomeTaskId)?  $default,) {final _that = this;
switch (_that) {
case _FinTaskModel() when $default != null:
return $default(_that.id,_that.name,_that.purpose,_that.type,_that.status,_that.period,_that.startDate,_that.regularIncomeTaskId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinTaskModel extends FinTaskModel {
   _FinTaskModel({this.id = TaskId.empty, this.name = '', this.purpose = FinTaskModelPurpose.dailyBudget, this.type = TaskType.personal, this.status = TaskStatus.visible, this.period = Period.monthly,  DateTime? startDate, this.regularIncomeTaskId = TaskId.empty}): super._(startDate: startDate);
  factory _FinTaskModel.fromJson(Map<String, dynamic> json) => _$FinTaskModelFromJson(json);

@override@JsonKey() final  TaskId id;
@override@JsonKey() final  String name;
@override@JsonKey() final  FinTaskModelPurpose purpose;
@override@JsonKey() final  TaskType type;
@override@JsonKey() final  TaskStatus status;
@override@JsonKey() final  Period period;
@override@JsonKey() final  TaskId regularIncomeTaskId;

/// Create a copy of FinTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinTaskModelCopyWith<_FinTaskModel> get copyWith => __$FinTaskModelCopyWithImpl<_FinTaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinTaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinTaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.period, period) || other.period == period)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.regularIncomeTaskId, regularIncomeTaskId) || other.regularIncomeTaskId == regularIncomeTaskId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,purpose,type,status,period,startDate,regularIncomeTaskId);

@override
String toString() {
  return 'FinTaskModel(id: $id, name: $name, purpose: $purpose, type: $type, status: $status, period: $period, startDate: $startDate, regularIncomeTaskId: $regularIncomeTaskId)';
}


}

/// @nodoc
abstract mixin class _$FinTaskModelCopyWith<$Res> implements $FinTaskModelCopyWith<$Res> {
  factory _$FinTaskModelCopyWith(_FinTaskModel value, $Res Function(_FinTaskModel) _then) = __$FinTaskModelCopyWithImpl;
@override @useResult
$Res call({
 TaskId id, String name, FinTaskModelPurpose purpose, TaskType type, TaskStatus status, Period period, DateTime? startDate, TaskId regularIncomeTaskId
});




}
/// @nodoc
class __$FinTaskModelCopyWithImpl<$Res>
    implements _$FinTaskModelCopyWith<$Res> {
  __$FinTaskModelCopyWithImpl(this._self, this._then);

  final _FinTaskModel _self;
  final $Res Function(_FinTaskModel) _then;

/// Create a copy of FinTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? purpose = null,Object? type = null,Object? status = null,Object? period = null,Object? startDate = freezed,Object? regularIncomeTaskId = null,}) {
  return _then(_FinTaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TaskId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as FinTaskModelPurpose,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as Period,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,regularIncomeTaskId: null == regularIncomeTaskId ? _self.regularIncomeTaskId : regularIncomeTaskId // ignore: cast_nullable_to_non_nullable
as TaskId,
  ));
}


}


/// @nodoc
mixin _$Task {

 TaskId get id; TaskStatus get status; String get title; String get notes; TaskType get type; PersonalIncomeTaskType get personalIncomeType; PersonalExpenseTaskType get personalExpenseType; TaskTransactionType get transactionType; List<CategoryId> get categoryIds;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.type, type) || other.type == type)&&(identical(other.personalIncomeType, personalIncomeType) || other.personalIncomeType == personalIncomeType)&&(identical(other.personalExpenseType, personalExpenseType) || other.personalExpenseType == personalExpenseType)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,title,notes,type,personalIncomeType,personalExpenseType,transactionType,const DeepCollectionEquality().hash(categoryIds));

@override
String toString() {
  return 'Task(id: $id, status: $status, title: $title, notes: $notes, type: $type, personalIncomeType: $personalIncomeType, personalExpenseType: $personalExpenseType, transactionType: $transactionType, categoryIds: $categoryIds)';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@useResult
$Res call({
 TaskId id, TaskStatus status, String title, String notes, TaskType type, PersonalIncomeTaskType personalIncomeType, PersonalExpenseTaskType personalExpenseType, TaskTransactionType transactionType, List<CategoryId> categoryIds
});




}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? title = null,Object? notes = null,Object? type = null,Object? personalIncomeType = null,Object? personalExpenseType = null,Object? transactionType = null,Object? categoryIds = null,}) {
  return _then(Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TaskId,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,personalIncomeType: null == personalIncomeType ? _self.personalIncomeType : personalIncomeType // ignore: cast_nullable_to_non_nullable
as PersonalIncomeTaskType,personalExpenseType: null == personalExpenseType ? _self.personalExpenseType : personalExpenseType // ignore: cast_nullable_to_non_nullable
as PersonalExpenseTaskType,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TaskTransactionType,categoryIds: null == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<CategoryId>,
  ));
}

}


/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns on Task {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Task value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Task value)  $default,){
final _that = this;
switch (_that) {
case _Task():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Task value)?  $default,){
final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TaskId id,  TaskStatus status,  String title,  String notes,  TaskType type,  PersonalIncomeTaskType personalIncomeType,  PersonalExpenseTaskType personalExpenseType,  TaskTransactionType transactionType,  List<CategoryId> categoryIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.status,_that.title,_that.notes,_that.type,_that.personalIncomeType,_that.personalExpenseType,_that.transactionType,_that.categoryIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TaskId id,  TaskStatus status,  String title,  String notes,  TaskType type,  PersonalIncomeTaskType personalIncomeType,  PersonalExpenseTaskType personalExpenseType,  TaskTransactionType transactionType,  List<CategoryId> categoryIds)  $default,) {final _that = this;
switch (_that) {
case _Task():
return $default(_that.id,_that.status,_that.title,_that.notes,_that.type,_that.personalIncomeType,_that.personalExpenseType,_that.transactionType,_that.categoryIds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TaskId id,  TaskStatus status,  String title,  String notes,  TaskType type,  PersonalIncomeTaskType personalIncomeType,  PersonalExpenseTaskType personalExpenseType,  TaskTransactionType transactionType,  List<CategoryId> categoryIds)?  $default,) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.status,_that.title,_that.notes,_that.type,_that.personalIncomeType,_that.personalExpenseType,_that.transactionType,_that.categoryIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Task extends Task {
  const _Task({this.id = TaskId.empty, this.status = TaskStatus.visible, this.title = '', this.notes = '', this.type = TaskType.personal, this.personalIncomeType = PersonalIncomeTaskType.salary, this.personalExpenseType = PersonalExpenseTaskType.other, this.transactionType = TaskTransactionType.income,  List<CategoryId> categoryIds = const []}): _categoryIds = categoryIds,super._();
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

@override@JsonKey() final  TaskId id;
@override@JsonKey() final  TaskStatus status;
@override@JsonKey() final  String title;
@override@JsonKey() final  String notes;
@override@JsonKey() final  TaskType type;
@override@JsonKey() final  PersonalIncomeTaskType personalIncomeType;
@override@JsonKey() final  PersonalExpenseTaskType personalExpenseType;
@override@JsonKey() final  TaskTransactionType transactionType;
 final  List<CategoryId> _categoryIds;
@override@JsonKey() List<CategoryId> get categoryIds {
  if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryIds);
}


/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCopyWith<_Task> get copyWith => __$TaskCopyWithImpl<_Task>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Task&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.type, type) || other.type == type)&&(identical(other.personalIncomeType, personalIncomeType) || other.personalIncomeType == personalIncomeType)&&(identical(other.personalExpenseType, personalExpenseType) || other.personalExpenseType == personalExpenseType)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,title,notes,type,personalIncomeType,personalExpenseType,transactionType,const DeepCollectionEquality().hash(_categoryIds));

@override
String toString() {
  return 'Task(id: $id, status: $status, title: $title, notes: $notes, type: $type, personalIncomeType: $personalIncomeType, personalExpenseType: $personalExpenseType, transactionType: $transactionType, categoryIds: $categoryIds)';
}


}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) = __$TaskCopyWithImpl;
@override @useResult
$Res call({
 TaskId id, TaskStatus status, String title, String notes, TaskType type, PersonalIncomeTaskType personalIncomeType, PersonalExpenseTaskType personalExpenseType, TaskTransactionType transactionType, List<CategoryId> categoryIds
});




}
/// @nodoc
class __$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? title = null,Object? notes = null,Object? type = null,Object? personalIncomeType = null,Object? personalExpenseType = null,Object? transactionType = null,Object? categoryIds = null,}) {
  return _then(_Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TaskId,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,personalIncomeType: null == personalIncomeType ? _self.personalIncomeType : personalIncomeType // ignore: cast_nullable_to_non_nullable
as PersonalIncomeTaskType,personalExpenseType: null == personalExpenseType ? _self.personalExpenseType : personalExpenseType // ignore: cast_nullable_to_non_nullable
as PersonalExpenseTaskType,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TaskTransactionType,categoryIds: null == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<CategoryId>,
  ));
}


}


/// @nodoc
mixin _$ScheduledTransaction {

 TransactionId get transactionId;/// it may have no task id if it is a one time transaction
 TaskId get taskId; TransactionSchedule get schedule;
/// Create a copy of ScheduledTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduledTransactionCopyWith<ScheduledTransaction> get copyWith => _$ScheduledTransactionCopyWithImpl<ScheduledTransaction>(this as ScheduledTransaction, _$identity);

  /// Serializes this ScheduledTransaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduledTransaction&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,taskId,schedule);

@override
String toString() {
  return 'ScheduledTransaction(transactionId: $transactionId, taskId: $taskId, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $ScheduledTransactionCopyWith<$Res>  {
  factory $ScheduledTransactionCopyWith(ScheduledTransaction value, $Res Function(ScheduledTransaction) _then) = _$ScheduledTransactionCopyWithImpl;
@useResult
$Res call({
 TransactionId transactionId, TaskId taskId, TransactionSchedule schedule
});


$TransactionScheduleCopyWith<$Res> get schedule;

}
/// @nodoc
class _$ScheduledTransactionCopyWithImpl<$Res>
    implements $ScheduledTransactionCopyWith<$Res> {
  _$ScheduledTransactionCopyWithImpl(this._self, this._then);

  final ScheduledTransaction _self;
  final $Res Function(ScheduledTransaction) _then;

/// Create a copy of ScheduledTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? taskId = null,Object? schedule = null,}) {
  return _then(ScheduledTransaction(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as TransactionId,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as TaskId,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as TransactionSchedule,
  ));
}
/// Create a copy of ScheduledTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionScheduleCopyWith<$Res> get schedule {
  
  return $TransactionScheduleCopyWith<$Res>(_self.schedule, (value) {
    return _then(_self.copyWith(schedule: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScheduledTransaction].
extension ScheduledTransactionPatterns on ScheduledTransaction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduledTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduledTransaction() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduledTransaction value)  $default,){
final _that = this;
switch (_that) {
case _ScheduledTransaction():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduledTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduledTransaction() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionId transactionId,  TaskId taskId,  TransactionSchedule schedule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduledTransaction() when $default != null:
return $default(_that.transactionId,_that.taskId,_that.schedule);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionId transactionId,  TaskId taskId,  TransactionSchedule schedule)  $default,) {final _that = this;
switch (_that) {
case _ScheduledTransaction():
return $default(_that.transactionId,_that.taskId,_that.schedule);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionId transactionId,  TaskId taskId,  TransactionSchedule schedule)?  $default,) {final _that = this;
switch (_that) {
case _ScheduledTransaction() when $default != null:
return $default(_that.transactionId,_that.taskId,_that.schedule);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduledTransaction extends ScheduledTransaction {
  const _ScheduledTransaction({this.transactionId = TransactionId.empty, this.taskId = TaskId.empty, this.schedule = TransactionSchedule.empty}): super._();
  factory _ScheduledTransaction.fromJson(Map<String, dynamic> json) => _$ScheduledTransactionFromJson(json);

@override@JsonKey() final  TransactionId transactionId;
/// it may have no task id if it is a one time transaction
@override@JsonKey() final  TaskId taskId;
@override@JsonKey() final  TransactionSchedule schedule;

/// Create a copy of ScheduledTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduledTransactionCopyWith<_ScheduledTransaction> get copyWith => __$ScheduledTransactionCopyWithImpl<_ScheduledTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduledTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduledTransaction&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,taskId,schedule);

@override
String toString() {
  return 'ScheduledTransaction(transactionId: $transactionId, taskId: $taskId, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$ScheduledTransactionCopyWith<$Res> implements $ScheduledTransactionCopyWith<$Res> {
  factory _$ScheduledTransactionCopyWith(_ScheduledTransaction value, $Res Function(_ScheduledTransaction) _then) = __$ScheduledTransactionCopyWithImpl;
@override @useResult
$Res call({
 TransactionId transactionId, TaskId taskId, TransactionSchedule schedule
});


@override $TransactionScheduleCopyWith<$Res> get schedule;

}
/// @nodoc
class __$ScheduledTransactionCopyWithImpl<$Res>
    implements _$ScheduledTransactionCopyWith<$Res> {
  __$ScheduledTransactionCopyWithImpl(this._self, this._then);

  final _ScheduledTransaction _self;
  final $Res Function(_ScheduledTransaction) _then;

/// Create a copy of ScheduledTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? taskId = null,Object? schedule = null,}) {
  return _then(_ScheduledTransaction(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as TransactionId,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as TaskId,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as TransactionSchedule,
  ));
}

/// Create a copy of ScheduledTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionScheduleCopyWith<$Res> get schedule {
  
  return $TransactionScheduleCopyWith<$Res>(_self.schedule, (value) {
    return _then(_self.copyWith(schedule: value));
  });
}
}


/// @nodoc
mixin _$TransactionSchedule {

 TransactionPeriodType get periodType; Period get period; DateTime? get startedAt; DateTime? get endedAt;
/// Create a copy of TransactionSchedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionScheduleCopyWith<TransactionSchedule> get copyWith => _$TransactionScheduleCopyWithImpl<TransactionSchedule>(this as TransactionSchedule, _$identity);

  /// Serializes this TransactionSchedule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionSchedule&&(identical(other.periodType, periodType) || other.periodType == periodType)&&(identical(other.period, period) || other.period == period)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodType,period,startedAt,endedAt);

@override
String toString() {
  return 'TransactionSchedule(periodType: $periodType, period: $period, startedAt: $startedAt, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class $TransactionScheduleCopyWith<$Res>  {
  factory $TransactionScheduleCopyWith(TransactionSchedule value, $Res Function(TransactionSchedule) _then) = _$TransactionScheduleCopyWithImpl;
@useResult
$Res call({
 TransactionPeriodType periodType, Period period, DateTime? startedAt, DateTime? endedAt
});




}
/// @nodoc
class _$TransactionScheduleCopyWithImpl<$Res>
    implements $TransactionScheduleCopyWith<$Res> {
  _$TransactionScheduleCopyWithImpl(this._self, this._then);

  final TransactionSchedule _self;
  final $Res Function(TransactionSchedule) _then;

/// Create a copy of TransactionSchedule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? periodType = null,Object? period = null,Object? startedAt = freezed,Object? endedAt = freezed,}) {
  return _then(TransactionSchedule(
periodType: null == periodType ? _self.periodType : periodType // ignore: cast_nullable_to_non_nullable
as TransactionPeriodType,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as Period,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionSchedule].
extension TransactionSchedulePatterns on TransactionSchedule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionSchedule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionSchedule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionSchedule value)  $default,){
final _that = this;
switch (_that) {
case _TransactionSchedule():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionSchedule value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionSchedule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionPeriodType periodType,  Period period,  DateTime? startedAt,  DateTime? endedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionSchedule() when $default != null:
return $default(_that.periodType,_that.period,_that.startedAt,_that.endedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionPeriodType periodType,  Period period,  DateTime? startedAt,  DateTime? endedAt)  $default,) {final _that = this;
switch (_that) {
case _TransactionSchedule():
return $default(_that.periodType,_that.period,_that.startedAt,_that.endedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionPeriodType periodType,  Period period,  DateTime? startedAt,  DateTime? endedAt)?  $default,) {final _that = this;
switch (_that) {
case _TransactionSchedule() when $default != null:
return $default(_that.periodType,_that.period,_that.startedAt,_that.endedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionSchedule extends TransactionSchedule {
  const _TransactionSchedule({this.periodType = TransactionPeriodType.none, this.period = Period.daily, this.startedAt, this.endedAt}): super._();
  factory _TransactionSchedule.fromJson(Map<String, dynamic> json) => _$TransactionScheduleFromJson(json);

@override@JsonKey() final  TransactionPeriodType periodType;
@override@JsonKey() final  Period period;
@override final  DateTime? startedAt;
@override final  DateTime? endedAt;

/// Create a copy of TransactionSchedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionScheduleCopyWith<_TransactionSchedule> get copyWith => __$TransactionScheduleCopyWithImpl<_TransactionSchedule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionScheduleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionSchedule&&(identical(other.periodType, periodType) || other.periodType == periodType)&&(identical(other.period, period) || other.period == period)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodType,period,startedAt,endedAt);

@override
String toString() {
  return 'TransactionSchedule(periodType: $periodType, period: $period, startedAt: $startedAt, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionScheduleCopyWith<$Res> implements $TransactionScheduleCopyWith<$Res> {
  factory _$TransactionScheduleCopyWith(_TransactionSchedule value, $Res Function(_TransactionSchedule) _then) = __$TransactionScheduleCopyWithImpl;
@override @useResult
$Res call({
 TransactionPeriodType periodType, Period period, DateTime? startedAt, DateTime? endedAt
});




}
/// @nodoc
class __$TransactionScheduleCopyWithImpl<$Res>
    implements _$TransactionScheduleCopyWith<$Res> {
  __$TransactionScheduleCopyWithImpl(this._self, this._then);

  final _TransactionSchedule _self;
  final $Res Function(_TransactionSchedule) _then;

/// Create a copy of TransactionSchedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? periodType = null,Object? period = null,Object? startedAt = freezed,Object? endedAt = freezed,}) {
  return _then(_TransactionSchedule(
periodType: null == periodType ? _self.periodType : periodType // ignore: cast_nullable_to_non_nullable
as TransactionPeriodType,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as Period,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

Currency _$CurrencyFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'fiat':
          return FiatCurrency.fromJson(
            json
          );
                case 'crypto':
          return CryptoCurrency.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Currency',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Currency {

 CurrencyId get id; String get name; String get slug; CurrencyType get type;
/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrencyCopyWith<Currency> get copyWith => _$CurrencyCopyWithImpl<Currency>(this as Currency, _$identity);

  /// Serializes this Currency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Currency&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,type);

@override
String toString() {
  return 'Currency(id: $id, name: $name, slug: $slug, type: $type)';
}


}

/// @nodoc
abstract mixin class $CurrencyCopyWith<$Res>  {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) _then) = _$CurrencyCopyWithImpl;
@useResult
$Res call({
 CurrencyId id, String name, String slug, CurrencyType type
});




}
/// @nodoc
class _$CurrencyCopyWithImpl<$Res>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._self, this._then);

  final Currency _self;
  final $Res Function(Currency) _then;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CurrencyId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CurrencyType,
  ));
}

}


/// Adds pattern-matching-related methods to [Currency].
extension CurrencyPatterns on Currency {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FiatCurrency value)?  fiat,TResult Function( CryptoCurrency value)?  crypto,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FiatCurrency() when fiat != null:
return fiat(_that);case CryptoCurrency() when crypto != null:
return crypto(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FiatCurrency value)  fiat,required TResult Function( CryptoCurrency value)  crypto,}){
final _that = this;
switch (_that) {
case FiatCurrency():
return fiat(_that);case CryptoCurrency():
return crypto(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FiatCurrency value)?  fiat,TResult? Function( CryptoCurrency value)?  crypto,}){
final _that = this;
switch (_that) {
case FiatCurrency() when fiat != null:
return fiat(_that);case CryptoCurrency() when crypto != null:
return crypto(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CurrencyId id,  String name,  String slug,  String symbol,  int decimals,  CurrencyType type)?  fiat,TResult Function( CurrencyId id,  String name,  String slug,  CurrencyType type,  ChainId chainId)?  crypto,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FiatCurrency() when fiat != null:
return fiat(_that.id,_that.name,_that.slug,_that.symbol,_that.decimals,_that.type);case CryptoCurrency() when crypto != null:
return crypto(_that.id,_that.name,_that.slug,_that.type,_that.chainId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CurrencyId id,  String name,  String slug,  String symbol,  int decimals,  CurrencyType type)  fiat,required TResult Function( CurrencyId id,  String name,  String slug,  CurrencyType type,  ChainId chainId)  crypto,}) {final _that = this;
switch (_that) {
case FiatCurrency():
return fiat(_that.id,_that.name,_that.slug,_that.symbol,_that.decimals,_that.type);case CryptoCurrency():
return crypto(_that.id,_that.name,_that.slug,_that.type,_that.chainId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CurrencyId id,  String name,  String slug,  String symbol,  int decimals,  CurrencyType type)?  fiat,TResult? Function( CurrencyId id,  String name,  String slug,  CurrencyType type,  ChainId chainId)?  crypto,}) {final _that = this;
switch (_that) {
case FiatCurrency() when fiat != null:
return fiat(_that.id,_that.name,_that.slug,_that.symbol,_that.decimals,_that.type);case CryptoCurrency() when crypto != null:
return crypto(_that.id,_that.name,_that.slug,_that.type,_that.chainId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class FiatCurrency extends Currency {
  const FiatCurrency({this.id = CurrencyId.empty, this.name = '', this.slug = '', this.symbol = '', this.decimals = 2, this.type = CurrencyType.fiat,  String? $type}): $type = $type ?? 'fiat',super._();
  factory FiatCurrency.fromJson(Map<String, dynamic> json) => _$FiatCurrencyFromJson(json);

@override@JsonKey() final  CurrencyId id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String slug;
@JsonKey() final  String symbol;
@JsonKey() final  int decimals;
@override@JsonKey() final  CurrencyType type;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FiatCurrencyCopyWith<FiatCurrency> get copyWith => _$FiatCurrencyCopyWithImpl<FiatCurrency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FiatCurrencyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FiatCurrency&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.decimals, decimals) || other.decimals == decimals)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,symbol,decimals,type);

@override
String toString() {
  return 'Currency.fiat(id: $id, name: $name, slug: $slug, symbol: $symbol, decimals: $decimals, type: $type)';
}


}

/// @nodoc
abstract mixin class $FiatCurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory $FiatCurrencyCopyWith(FiatCurrency value, $Res Function(FiatCurrency) _then) = _$FiatCurrencyCopyWithImpl;
@override @useResult
$Res call({
 CurrencyId id, String name, String slug, String symbol, int decimals, CurrencyType type
});




}
/// @nodoc
class _$FiatCurrencyCopyWithImpl<$Res>
    implements $FiatCurrencyCopyWith<$Res> {
  _$FiatCurrencyCopyWithImpl(this._self, this._then);

  final FiatCurrency _self;
  final $Res Function(FiatCurrency) _then;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? symbol = null,Object? decimals = null,Object? type = null,}) {
  return _then(FiatCurrency(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CurrencyId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,decimals: null == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CurrencyType,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CryptoCurrency extends Currency {
  const CryptoCurrency({this.id = CurrencyId.empty, this.name = '', this.slug = '', this.type = CurrencyType.crypto, this.chainId = ChainId.empty,  String? $type}): $type = $type ?? 'crypto',super._();
  factory CryptoCurrency.fromJson(Map<String, dynamic> json) => _$CryptoCurrencyFromJson(json);

@override@JsonKey() final  CurrencyId id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String slug;
@override@JsonKey() final  CurrencyType type;
@JsonKey() final  ChainId chainId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CryptoCurrencyCopyWith<CryptoCurrency> get copyWith => _$CryptoCurrencyCopyWithImpl<CryptoCurrency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CryptoCurrencyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CryptoCurrency&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.type, type) || other.type == type)&&(identical(other.chainId, chainId) || other.chainId == chainId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,type,chainId);

@override
String toString() {
  return 'Currency.crypto(id: $id, name: $name, slug: $slug, type: $type, chainId: $chainId)';
}


}

/// @nodoc
abstract mixin class $CryptoCurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory $CryptoCurrencyCopyWith(CryptoCurrency value, $Res Function(CryptoCurrency) _then) = _$CryptoCurrencyCopyWithImpl;
@override @useResult
$Res call({
 CurrencyId id, String name, String slug, CurrencyType type, ChainId chainId
});




}
/// @nodoc
class _$CryptoCurrencyCopyWithImpl<$Res>
    implements $CryptoCurrencyCopyWith<$Res> {
  _$CryptoCurrencyCopyWithImpl(this._self, this._then);

  final CryptoCurrency _self;
  final $Res Function(CryptoCurrency) _then;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? type = null,Object? chainId = null,}) {
  return _then(CryptoCurrency(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CurrencyId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CurrencyType,chainId: null == chainId ? _self.chainId : chainId // ignore: cast_nullable_to_non_nullable
as ChainId,
  ));
}


}


/// @nodoc
mixin _$Transaction {

 DateTime get transactionDate; TransactionId get id; InputMoney get input; String get description; String get note; String get shoppingListString; TaskId get taskId; TransactionType get type; CategoryId get categoryId;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.id, id) || other.id == id)&&(identical(other.input, input) || other.input == input)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&(identical(other.shoppingListString, shoppingListString) || other.shoppingListString == shoppingListString)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.type, type) || other.type == type)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionDate,id,input,description,note,shoppingListString,taskId,type,categoryId);

@override
String toString() {
  return 'Transaction(transactionDate: $transactionDate, id: $id, input: $input, description: $description, note: $note, shoppingListString: $shoppingListString, taskId: $taskId, type: $type, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 DateTime transactionDate, TransactionId id, InputMoney input, String description, String note, String shoppingListString, TaskId taskId, TransactionType type, CategoryId categoryId
});


$InputMoneyCopyWith<$Res> get input;

}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionDate = null,Object? id = null,Object? input = null,Object? description = null,Object? note = null,Object? shoppingListString = null,Object? taskId = null,Object? type = null,Object? categoryId = null,}) {
  return _then(Transaction(
transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TransactionId,input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as InputMoney,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,shoppingListString: null == shoppingListString ? _self.shoppingListString : shoppingListString // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as TaskId,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,
  ));
}
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputMoneyCopyWith<$Res> get input {
  
  return $InputMoneyCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transaction value)  $default,){
final _that = this;
switch (_that) {
case _Transaction():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transaction value)?  $default,){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime transactionDate,  TransactionId id,  InputMoney input,  String description,  String note,  String shoppingListString,  TaskId taskId,  TransactionType type,  CategoryId categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.transactionDate,_that.id,_that.input,_that.description,_that.note,_that.shoppingListString,_that.taskId,_that.type,_that.categoryId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime transactionDate,  TransactionId id,  InputMoney input,  String description,  String note,  String shoppingListString,  TaskId taskId,  TransactionType type,  CategoryId categoryId)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.transactionDate,_that.id,_that.input,_that.description,_that.note,_that.shoppingListString,_that.taskId,_that.type,_that.categoryId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime transactionDate,  TransactionId id,  InputMoney input,  String description,  String note,  String shoppingListString,  TaskId taskId,  TransactionType type,  CategoryId categoryId)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.transactionDate,_that.id,_that.input,_that.description,_that.note,_that.shoppingListString,_that.taskId,_that.type,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Transaction extends Transaction {
  const _Transaction({required this.transactionDate, this.id = TransactionId.empty, this.input = InputMoney.empty, this.description = '', this.note = '', this.shoppingListString = '', this.taskId = TaskId.empty, this.type = TransactionType.expense, this.categoryId = CategoryId.empty}): super._();
  factory _Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

@override final  DateTime transactionDate;
@override@JsonKey() final  TransactionId id;
@override@JsonKey() final  InputMoney input;
@override@JsonKey() final  String description;
@override@JsonKey() final  String note;
@override@JsonKey() final  String shoppingListString;
@override@JsonKey() final  TaskId taskId;
@override@JsonKey() final  TransactionType type;
@override@JsonKey() final  CategoryId categoryId;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.id, id) || other.id == id)&&(identical(other.input, input) || other.input == input)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&(identical(other.shoppingListString, shoppingListString) || other.shoppingListString == shoppingListString)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.type, type) || other.type == type)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionDate,id,input,description,note,shoppingListString,taskId,type,categoryId);

@override
String toString() {
  return 'Transaction(transactionDate: $transactionDate, id: $id, input: $input, description: $description, note: $note, shoppingListString: $shoppingListString, taskId: $taskId, type: $type, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 DateTime transactionDate, TransactionId id, InputMoney input, String description, String note, String shoppingListString, TaskId taskId, TransactionType type, CategoryId categoryId
});


@override $InputMoneyCopyWith<$Res> get input;

}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionDate = null,Object? id = null,Object? input = null,Object? description = null,Object? note = null,Object? shoppingListString = null,Object? taskId = null,Object? type = null,Object? categoryId = null,}) {
  return _then(_Transaction(
transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TransactionId,input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as InputMoney,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,shoppingListString: null == shoppingListString ? _self.shoppingListString : shoppingListString // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as TaskId,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,
  ));
}

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputMoneyCopyWith<$Res> get input {
  
  return $InputMoneyCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}

InputMoney _$InputMoneyFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'fiat':
          return FiatInputModel.fromJson(
            json
          );
                case 'crypto':
          return CyptoInputModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'InputMoney',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$InputMoney {

 CurrencyId get currencyId; double get amountWithTax; CurrencyType get currencyType; TaxValue get tax;
/// Create a copy of InputMoney
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputMoneyCopyWith<InputMoney> get copyWith => _$InputMoneyCopyWithImpl<InputMoney>(this as InputMoney, _$identity);

  /// Serializes this InputMoney to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputMoney&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.amountWithTax, amountWithTax) || other.amountWithTax == amountWithTax)&&(identical(other.currencyType, currencyType) || other.currencyType == currencyType)&&(identical(other.tax, tax) || other.tax == tax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyId,amountWithTax,currencyType,tax);

@override
String toString() {
  return 'InputMoney(currencyId: $currencyId, amountWithTax: $amountWithTax, currencyType: $currencyType, tax: $tax)';
}


}

/// @nodoc
abstract mixin class $InputMoneyCopyWith<$Res>  {
  factory $InputMoneyCopyWith(InputMoney value, $Res Function(InputMoney) _then) = _$InputMoneyCopyWithImpl;
@useResult
$Res call({
 CurrencyId currencyId, double amountWithTax, CurrencyType currencyType, TaxValue tax
});




}
/// @nodoc
class _$InputMoneyCopyWithImpl<$Res>
    implements $InputMoneyCopyWith<$Res> {
  _$InputMoneyCopyWithImpl(this._self, this._then);

  final InputMoney _self;
  final $Res Function(InputMoney) _then;

/// Create a copy of InputMoney
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currencyId = null,Object? amountWithTax = null,Object? currencyType = null,Object? tax = null,}) {
  return _then(_self.copyWith(
currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as CurrencyId,amountWithTax: null == amountWithTax ? _self.amountWithTax : amountWithTax // ignore: cast_nullable_to_non_nullable
as double,currencyType: null == currencyType ? _self.currencyType : currencyType // ignore: cast_nullable_to_non_nullable
as CurrencyType,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as TaxValue,
  ));
}

}


/// Adds pattern-matching-related methods to [InputMoney].
extension InputMoneyPatterns on InputMoney {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FiatInputModel value)?  fiat,TResult Function( CyptoInputModel value)?  crypto,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FiatInputModel() when fiat != null:
return fiat(_that);case CyptoInputModel() when crypto != null:
return crypto(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FiatInputModel value)  fiat,required TResult Function( CyptoInputModel value)  crypto,}){
final _that = this;
switch (_that) {
case FiatInputModel():
return fiat(_that);case CyptoInputModel():
return crypto(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FiatInputModel value)?  fiat,TResult? Function( CyptoInputModel value)?  crypto,}){
final _that = this;
switch (_that) {
case FiatInputModel() when fiat != null:
return fiat(_that);case CyptoInputModel() when crypto != null:
return crypto(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CurrencyId currencyId,  double amountWithTax,  CurrencyType currencyType,  TaxValue tax)?  fiat,TResult Function( CurrencyId currencyId,  double amountWithTax,  CurrencyType currencyType,  TaxValue tax)?  crypto,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FiatInputModel() when fiat != null:
return fiat(_that.currencyId,_that.amountWithTax,_that.currencyType,_that.tax);case CyptoInputModel() when crypto != null:
return crypto(_that.currencyId,_that.amountWithTax,_that.currencyType,_that.tax);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CurrencyId currencyId,  double amountWithTax,  CurrencyType currencyType,  TaxValue tax)  fiat,required TResult Function( CurrencyId currencyId,  double amountWithTax,  CurrencyType currencyType,  TaxValue tax)  crypto,}) {final _that = this;
switch (_that) {
case FiatInputModel():
return fiat(_that.currencyId,_that.amountWithTax,_that.currencyType,_that.tax);case CyptoInputModel():
return crypto(_that.currencyId,_that.amountWithTax,_that.currencyType,_that.tax);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CurrencyId currencyId,  double amountWithTax,  CurrencyType currencyType,  TaxValue tax)?  fiat,TResult? Function( CurrencyId currencyId,  double amountWithTax,  CurrencyType currencyType,  TaxValue tax)?  crypto,}) {final _that = this;
switch (_that) {
case FiatInputModel() when fiat != null:
return fiat(_that.currencyId,_that.amountWithTax,_that.currencyType,_that.tax);case CyptoInputModel() when crypto != null:
return crypto(_that.currencyId,_that.amountWithTax,_that.currencyType,_that.tax);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class FiatInputModel extends InputMoney {
  const FiatInputModel({this.currencyId = CurrencyId.empty, this.amountWithTax = 0.0, this.currencyType = CurrencyType.fiat, this.tax = TaxValue.zero,  String? $type}): $type = $type ?? 'fiat',super._();
  factory FiatInputModel.fromJson(Map<String, dynamic> json) => _$FiatInputModelFromJson(json);

@override@JsonKey() final  CurrencyId currencyId;
@override@JsonKey() final  double amountWithTax;
@override@JsonKey() final  CurrencyType currencyType;
@override@JsonKey() final  TaxValue tax;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InputMoney
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FiatInputModelCopyWith<FiatInputModel> get copyWith => _$FiatInputModelCopyWithImpl<FiatInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FiatInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FiatInputModel&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.amountWithTax, amountWithTax) || other.amountWithTax == amountWithTax)&&(identical(other.currencyType, currencyType) || other.currencyType == currencyType)&&(identical(other.tax, tax) || other.tax == tax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyId,amountWithTax,currencyType,tax);

@override
String toString() {
  return 'InputMoney.fiat(currencyId: $currencyId, amountWithTax: $amountWithTax, currencyType: $currencyType, tax: $tax)';
}


}

/// @nodoc
abstract mixin class $FiatInputModelCopyWith<$Res> implements $InputMoneyCopyWith<$Res> {
  factory $FiatInputModelCopyWith(FiatInputModel value, $Res Function(FiatInputModel) _then) = _$FiatInputModelCopyWithImpl;
@override @useResult
$Res call({
 CurrencyId currencyId, double amountWithTax, CurrencyType currencyType, TaxValue tax
});




}
/// @nodoc
class _$FiatInputModelCopyWithImpl<$Res>
    implements $FiatInputModelCopyWith<$Res> {
  _$FiatInputModelCopyWithImpl(this._self, this._then);

  final FiatInputModel _self;
  final $Res Function(FiatInputModel) _then;

/// Create a copy of InputMoney
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currencyId = null,Object? amountWithTax = null,Object? currencyType = null,Object? tax = null,}) {
  return _then(FiatInputModel(
currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as CurrencyId,amountWithTax: null == amountWithTax ? _self.amountWithTax : amountWithTax // ignore: cast_nullable_to_non_nullable
as double,currencyType: null == currencyType ? _self.currencyType : currencyType // ignore: cast_nullable_to_non_nullable
as CurrencyType,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as TaxValue,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CyptoInputModel extends InputMoney {
  const CyptoInputModel({this.currencyId = CurrencyId.empty, this.amountWithTax = 0.0, this.currencyType = CurrencyType.crypto, this.tax = TaxValue.zero,  String? $type}): $type = $type ?? 'crypto',super._();
  factory CyptoInputModel.fromJson(Map<String, dynamic> json) => _$CyptoInputModelFromJson(json);

@override@JsonKey() final  CurrencyId currencyId;
@override@JsonKey() final  double amountWithTax;
@override@JsonKey() final  CurrencyType currencyType;
@override@JsonKey() final  TaxValue tax;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InputMoney
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CyptoInputModelCopyWith<CyptoInputModel> get copyWith => _$CyptoInputModelCopyWithImpl<CyptoInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CyptoInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CyptoInputModel&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.amountWithTax, amountWithTax) || other.amountWithTax == amountWithTax)&&(identical(other.currencyType, currencyType) || other.currencyType == currencyType)&&(identical(other.tax, tax) || other.tax == tax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyId,amountWithTax,currencyType,tax);

@override
String toString() {
  return 'InputMoney.crypto(currencyId: $currencyId, amountWithTax: $amountWithTax, currencyType: $currencyType, tax: $tax)';
}


}

/// @nodoc
abstract mixin class $CyptoInputModelCopyWith<$Res> implements $InputMoneyCopyWith<$Res> {
  factory $CyptoInputModelCopyWith(CyptoInputModel value, $Res Function(CyptoInputModel) _then) = _$CyptoInputModelCopyWithImpl;
@override @useResult
$Res call({
 CurrencyId currencyId, double amountWithTax, CurrencyType currencyType, TaxValue tax
});




}
/// @nodoc
class _$CyptoInputModelCopyWithImpl<$Res>
    implements $CyptoInputModelCopyWith<$Res> {
  _$CyptoInputModelCopyWithImpl(this._self, this._then);

  final CyptoInputModel _self;
  final $Res Function(CyptoInputModel) _then;

/// Create a copy of InputMoney
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currencyId = null,Object? amountWithTax = null,Object? currencyType = null,Object? tax = null,}) {
  return _then(CyptoInputModel(
currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as CurrencyId,amountWithTax: null == amountWithTax ? _self.amountWithTax : amountWithTax // ignore: cast_nullable_to_non_nullable
as double,currencyType: null == currencyType ? _self.currencyType : currencyType // ignore: cast_nullable_to_non_nullable
as CurrencyType,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as TaxValue,
  ));
}


}

/// @nodoc
mixin _$UserModelId {

 String get value;
/// Create a copy of UserModelId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelIdCopyWith<UserModelId> get copyWith => _$UserModelIdCopyWithImpl<UserModelId>(this as UserModelId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModelId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'UserModelId(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserModelIdCopyWith<$Res>  {
  factory $UserModelIdCopyWith(UserModelId value, $Res Function(UserModelId) _then) = _$UserModelIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserModelIdCopyWithImpl<$Res>
    implements $UserModelIdCopyWith<$Res> {
  _$UserModelIdCopyWithImpl(this._self, this._then);

  final UserModelId _self;
  final $Res Function(UserModelId) _then;

/// Create a copy of UserModelId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModelId].
extension UserModelIdPatterns on UserModelId {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserModelLocalId value)?  local,TResult Function( UserModelRemoteId value)?  remote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserModelLocalId() when local != null:
return local(_that);case UserModelRemoteId() when remote != null:
return remote(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserModelLocalId value)  local,required TResult Function( UserModelRemoteId value)  remote,}){
final _that = this;
switch (_that) {
case UserModelLocalId():
return local(_that);case UserModelRemoteId():
return remote(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserModelLocalId value)?  local,TResult? Function( UserModelRemoteId value)?  remote,}){
final _that = this;
switch (_that) {
case UserModelLocalId() when local != null:
return local(_that);case UserModelRemoteId() when remote != null:
return remote(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  local,TResult Function( String value)?  remote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserModelLocalId() when local != null:
return local(_that.value);case UserModelRemoteId() when remote != null:
return remote(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  local,required TResult Function( String value)  remote,}) {final _that = this;
switch (_that) {
case UserModelLocalId():
return local(_that.value);case UserModelRemoteId():
return remote(_that.value);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  local,TResult? Function( String value)?  remote,}) {final _that = this;
switch (_that) {
case UserModelLocalId() when local != null:
return local(_that.value);case UserModelRemoteId() when remote != null:
return remote(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class UserModelLocalId extends UserModelId {
  const UserModelLocalId({required this.value}): super._();
  

@override final  String value;

/// Create a copy of UserModelId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelLocalIdCopyWith<UserModelLocalId> get copyWith => _$UserModelLocalIdCopyWithImpl<UserModelLocalId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModelLocalId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'UserModelId.local(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserModelLocalIdCopyWith<$Res> implements $UserModelIdCopyWith<$Res> {
  factory $UserModelLocalIdCopyWith(UserModelLocalId value, $Res Function(UserModelLocalId) _then) = _$UserModelLocalIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserModelLocalIdCopyWithImpl<$Res>
    implements $UserModelLocalIdCopyWith<$Res> {
  _$UserModelLocalIdCopyWithImpl(this._self, this._then);

  final UserModelLocalId _self;
  final $Res Function(UserModelLocalId) _then;

/// Create a copy of UserModelId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserModelLocalId(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserModelRemoteId extends UserModelId {
  const UserModelRemoteId({required this.value}): super._();
  

@override final  String value;

/// Create a copy of UserModelId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelRemoteIdCopyWith<UserModelRemoteId> get copyWith => _$UserModelRemoteIdCopyWithImpl<UserModelRemoteId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModelRemoteId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'UserModelId.remote(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserModelRemoteIdCopyWith<$Res> implements $UserModelIdCopyWith<$Res> {
  factory $UserModelRemoteIdCopyWith(UserModelRemoteId value, $Res Function(UserModelRemoteId) _then) = _$UserModelRemoteIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserModelRemoteIdCopyWithImpl<$Res>
    implements $UserModelRemoteIdCopyWith<$Res> {
  _$UserModelRemoteIdCopyWithImpl(this._self, this._then);

  final UserModelRemoteId _self;
  final $Res Function(UserModelRemoteId) _then;

/// Create a copy of UserModelId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserModelRemoteId(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserModel {

@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson) UserModelLocalId get localId;@JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson) UserModelRemoteId get remoteId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&const DeepCollectionEquality().equals(other.localId, localId)&&const DeepCollectionEquality().equals(other.remoteId, remoteId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(localId),const DeepCollectionEquality().hash(remoteId),createdAt,updatedAt);

@override
String toString() {
  return 'UserModel(localId: $localId, remoteId: $remoteId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson) UserModelLocalId localId,@JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson) UserModelRemoteId remoteId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? remoteId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(UserModel(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as UserModelLocalId,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as UserModelRemoteId,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)  UserModelLocalId localId, @JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)  UserModelRemoteId remoteId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.localId,_that.remoteId,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)  UserModelLocalId localId, @JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)  UserModelRemoteId remoteId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.localId,_that.remoteId,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)  UserModelLocalId localId, @JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)  UserModelRemoteId remoteId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.localId,_that.remoteId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _UserModel extends UserModel {
  const _UserModel({@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson) required this.localId, @JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson) required this.remoteId, required this.createdAt, required this.updatedAt}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson) final  UserModelLocalId localId;
@override@JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson) final  UserModelRemoteId remoteId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&const DeepCollectionEquality().equals(other.localId, localId)&&const DeepCollectionEquality().equals(other.remoteId, remoteId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(localId),const DeepCollectionEquality().hash(remoteId),createdAt,updatedAt);

@override
String toString() {
  return 'UserModel(localId: $localId, remoteId: $remoteId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson) UserModelLocalId localId,@JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson) UserModelRemoteId remoteId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? remoteId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserModel(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as UserModelLocalId,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as UserModelRemoteId,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SubscriptionModel {

 int get paidDaysLeft; DateTime? get updatedAt;
/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionModelCopyWith<SubscriptionModel> get copyWith => _$SubscriptionModelCopyWithImpl<SubscriptionModel>(this as SubscriptionModel, _$identity);

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionModel&&(identical(other.paidDaysLeft, paidDaysLeft) || other.paidDaysLeft == paidDaysLeft)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paidDaysLeft,updatedAt);

@override
String toString() {
  return 'SubscriptionModel(paidDaysLeft: $paidDaysLeft, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SubscriptionModelCopyWith<$Res>  {
  factory $SubscriptionModelCopyWith(SubscriptionModel value, $Res Function(SubscriptionModel) _then) = _$SubscriptionModelCopyWithImpl;
@useResult
$Res call({
 int paidDaysLeft, DateTime? updatedAt
});




}
/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._self, this._then);

  final SubscriptionModel _self;
  final $Res Function(SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paidDaysLeft = null,Object? updatedAt = freezed,}) {
  return _then(SubscriptionModel(
paidDaysLeft: null == paidDaysLeft ? _self.paidDaysLeft : paidDaysLeft // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionModel].
extension SubscriptionModelPatterns on SubscriptionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int paidDaysLeft,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
return $default(_that.paidDaysLeft,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int paidDaysLeft,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionModel():
return $default(_that.paidDaysLeft,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int paidDaysLeft,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
return $default(_that.paidDaysLeft,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _SubscriptionModel implements SubscriptionModel {
  const _SubscriptionModel({this.paidDaysLeft = 0, this.updatedAt});
  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);

@override@JsonKey() final  int paidDaysLeft;
@override final  DateTime? updatedAt;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionModelCopyWith<_SubscriptionModel> get copyWith => __$SubscriptionModelCopyWithImpl<_SubscriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionModel&&(identical(other.paidDaysLeft, paidDaysLeft) || other.paidDaysLeft == paidDaysLeft)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paidDaysLeft,updatedAt);

@override
String toString() {
  return 'SubscriptionModel(paidDaysLeft: $paidDaysLeft, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionModelCopyWith<$Res> implements $SubscriptionModelCopyWith<$Res> {
  factory _$SubscriptionModelCopyWith(_SubscriptionModel value, $Res Function(_SubscriptionModel) _then) = __$SubscriptionModelCopyWithImpl;
@override @useResult
$Res call({
 int paidDaysLeft, DateTime? updatedAt
});




}
/// @nodoc
class __$SubscriptionModelCopyWithImpl<$Res>
    implements _$SubscriptionModelCopyWith<$Res> {
  __$SubscriptionModelCopyWithImpl(this._self, this._then);

  final _SubscriptionModel _self;
  final $Res Function(_SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paidDaysLeft = null,Object? updatedAt = freezed,}) {
  return _then(_SubscriptionModel(
paidDaysLeft: null == paidDaysLeft ? _self.paidDaysLeft : paidDaysLeft // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$UserPermissionsModel {

 bool get shouldBeSynced; int get tagLimit;
/// Create a copy of UserPermissionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPermissionsModelCopyWith<UserPermissionsModel> get copyWith => _$UserPermissionsModelCopyWithImpl<UserPermissionsModel>(this as UserPermissionsModel, _$identity);

  /// Serializes this UserPermissionsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPermissionsModel&&(identical(other.shouldBeSynced, shouldBeSynced) || other.shouldBeSynced == shouldBeSynced)&&(identical(other.tagLimit, tagLimit) || other.tagLimit == tagLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shouldBeSynced,tagLimit);

@override
String toString() {
  return 'UserPermissionsModel(shouldBeSynced: $shouldBeSynced, tagLimit: $tagLimit)';
}


}

/// @nodoc
abstract mixin class $UserPermissionsModelCopyWith<$Res>  {
  factory $UserPermissionsModelCopyWith(UserPermissionsModel value, $Res Function(UserPermissionsModel) _then) = _$UserPermissionsModelCopyWithImpl;
@useResult
$Res call({
 bool shouldBeSynced, int tagLimit
});




}
/// @nodoc
class _$UserPermissionsModelCopyWithImpl<$Res>
    implements $UserPermissionsModelCopyWith<$Res> {
  _$UserPermissionsModelCopyWithImpl(this._self, this._then);

  final UserPermissionsModel _self;
  final $Res Function(UserPermissionsModel) _then;

/// Create a copy of UserPermissionsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shouldBeSynced = null,Object? tagLimit = null,}) {
  return _then(UserPermissionsModel(
shouldBeSynced: null == shouldBeSynced ? _self.shouldBeSynced : shouldBeSynced // ignore: cast_nullable_to_non_nullable
as bool,tagLimit: null == tagLimit ? _self.tagLimit : tagLimit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPermissionsModel].
extension UserPermissionsModelPatterns on UserPermissionsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPermissionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPermissionsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPermissionsModel value)  $default,){
final _that = this;
switch (_that) {
case _UserPermissionsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPermissionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserPermissionsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool shouldBeSynced,  int tagLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPermissionsModel() when $default != null:
return $default(_that.shouldBeSynced,_that.tagLimit);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool shouldBeSynced,  int tagLimit)  $default,) {final _that = this;
switch (_that) {
case _UserPermissionsModel():
return $default(_that.shouldBeSynced,_that.tagLimit);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool shouldBeSynced,  int tagLimit)?  $default,) {final _that = this;
switch (_that) {
case _UserPermissionsModel() when $default != null:
return $default(_that.shouldBeSynced,_that.tagLimit);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _UserPermissionsModel implements UserPermissionsModel {
  const _UserPermissionsModel({this.shouldBeSynced = false, this.tagLimit = 5});
  factory _UserPermissionsModel.fromJson(Map<String, dynamic> json) => _$UserPermissionsModelFromJson(json);

@override@JsonKey() final  bool shouldBeSynced;
@override@JsonKey() final  int tagLimit;

/// Create a copy of UserPermissionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPermissionsModelCopyWith<_UserPermissionsModel> get copyWith => __$UserPermissionsModelCopyWithImpl<_UserPermissionsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPermissionsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPermissionsModel&&(identical(other.shouldBeSynced, shouldBeSynced) || other.shouldBeSynced == shouldBeSynced)&&(identical(other.tagLimit, tagLimit) || other.tagLimit == tagLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shouldBeSynced,tagLimit);

@override
String toString() {
  return 'UserPermissionsModel(shouldBeSynced: $shouldBeSynced, tagLimit: $tagLimit)';
}


}

/// @nodoc
abstract mixin class _$UserPermissionsModelCopyWith<$Res> implements $UserPermissionsModelCopyWith<$Res> {
  factory _$UserPermissionsModelCopyWith(_UserPermissionsModel value, $Res Function(_UserPermissionsModel) _then) = __$UserPermissionsModelCopyWithImpl;
@override @useResult
$Res call({
 bool shouldBeSynced, int tagLimit
});




}
/// @nodoc
class __$UserPermissionsModelCopyWithImpl<$Res>
    implements _$UserPermissionsModelCopyWith<$Res> {
  __$UserPermissionsModelCopyWithImpl(this._self, this._then);

  final _UserPermissionsModel _self;
  final $Res Function(_UserPermissionsModel) _then;

/// Create a copy of UserPermissionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shouldBeSynced = null,Object? tagLimit = null,}) {
  return _then(_UserPermissionsModel(
shouldBeSynced: null == shouldBeSynced ? _self.shouldBeSynced : shouldBeSynced // ignore: cast_nullable_to_non_nullable
as bool,tagLimit: null == tagLimit ? _self.tagLimit : tagLimit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
