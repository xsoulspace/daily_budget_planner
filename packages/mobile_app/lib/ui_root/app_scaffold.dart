import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_states/app_settings_notifier.dart';

class DBPApp extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const DBPApp(this.initializer);
  final GlobalInitializerImpl initializer;
  @override
  State<DBPApp> createState() => _DBPAppState();
}

class _DBPAppState extends State<DBPApp> {
  @override
  void initState() {
    _loadDi();
    super.initState();
  }

  void _loadDi() {
    _initializeLocalization();
    Di.init(analyticsService: widget.initializer.analyticsService);
  }

  void _initializeLocalization() => LocalizationConfig.initialize(
        LocalizationConfig(
          supportedLanguages: [
            languages.en,
            languages.ru,
            languages.it,
          ],
          fallbackLanguage: languages.en,
        ),
      );
  @override
  void dispose() {
    Di.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => GlobalStateProviders(
        builder: (final context) => const AppScaffoldBuilder(),
      );
}

class AppScaffoldBuilder extends StatelessWidget {
  const AppScaffoldBuilder({super.key});
  @override
  Widget build(final BuildContext context) {
    final locale = context.select<AppSettingsNotifier, Locale>(
      (final c) => c.locale.value,
    );
    return MaterialApp.router(
      routerConfig: router,
      // builder: (final context, final child) => child!,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        ...S.localizationsDelegates,
        FormBuilderLocalizations.delegate,
      ],

      /// Providing a restorationScopeId allows the Navigator built by
      /// the MaterialApp to restore the navigation stack when a user
      /// leaves and returns to the app after it has been killed while
      /// running in the background.
      restorationScopeId: 'app',
      locale: locale,
      supportedLocales: Locales.values,
      theme: AppThemeData.brandLight,
    );
  }
}
