import 'package:mobile_app/common_imports.dart';

typedef UiLoaderBuilder = Widget Function(
  BuildContext context,
  // ignore: avoid_positional_boolean_parameters
  bool isLoading,
  ValueSetter<bool> setLoading,
);

/// A widget wrapper that provides a simple way to handle loading states.
///
/// This widget takes a builder function that receives the current context,
/// an [isLoading] boolean, and a [setLoading] function to update
/// the loading state.
///
/// {@template ui_loader}
/// Usage:
/// ```dart
/// UiLoader(
///   builder: (context, isLoading, setLoading) {
///     return ElevatedButton(
///       onPressed: isLoading ? null : () async {
///         setLoading(true);
///         await someAsyncOperation();
///         setLoading(false);
///       },
///       child: isLoading ? CircularProgressIndicator() : Text('Load'),
///     );
///   },
/// )
/// ```
/// {@endtemplate}
class UiLoader extends HookWidget {
  /// {@macro ui_loader}
  const UiLoader({
    required this.builder,
    this.isLoading = false,
    super.key,
  });

  /// The builder function that constructs the child widget.
  ///
  /// It receives the [BuildContext], [isLoading] state, and
  /// [setLoading] function.
  final UiLoaderBuilder builder;

  /// Initial loading state.
  final bool isLoading;

  @override
  Widget build(final BuildContext context) {
    final isLoading = useState(this.isLoading);

    return builder(
      context,
      isLoading.value,
      (final value) => isLoading.value = value,
    );
  }
}
