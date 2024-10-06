import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_states/app_settings_notifier.dart';

class GlobalStateProviders extends StatelessWidget {
  const GlobalStateProviders({required this.builder, super.key});

  final WidgetBuilder builder;

  @override
  Widget build(final BuildContext context) {
    const g = Di.get;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotifier>.value(value: g()),
        ChangeNotifierProvider<UiLocaleNotifier>.value(value: g()),
        ChangeNotifierProvider<AppStatusNotifier>.value(value: g()),
        ChangeNotifierProvider<AppSettingsNotifier>.value(value: g()),
      ],
      child: builder(context),
    );
  }
}
