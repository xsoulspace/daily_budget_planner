part of 'data_models.dart';

typedef BoolCallback = bool Function();
typedef FutureBoolCallback = Future<bool> Function();
typedef FutureVoidCallback = Future<void> Function();
typedef TwoValuesChanged<TFirst, TSecond> = void Function(TFirst, TSecond);
typedef FromJsonCallback<T> = T? Function(Map<String, dynamic> json);
typedef ToJsonCallback<T> = Map<String, dynamic> Function(T instance);
