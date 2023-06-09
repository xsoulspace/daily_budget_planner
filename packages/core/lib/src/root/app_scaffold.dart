import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:ui_locale/ui_locale.dart';

import '../states/states.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    required this.goRouterBuilder,
    super.key,
  });
  final ValueGetter<GoRouter> goRouterBuilder;
  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late final UiThemeScheme _themeScheme = UiThemeScheme.m3(context);
  late final _goRouter = widget.goRouterBuilder();
  @override
  void dispose() {
    _goRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final userLocale = context.select<UserCubit, Locale?>(
      (final cubit) => cubit.state.locale,
    );
    return MaterialApp.router(
      routerConfig: _goRouter,
      builder: (final context, final child) => Builder(
        builder: (final context) {
          context.read<L10nScope>().s = S.of(context);

          return UiTheme(
            scheme: _themeScheme,
            child: child!,
          );
        },
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        ...S.localizationsDelegates,
        FormBuilderLocalizations.delegate,
      ],
      locale: userLocale,
      localeListResolutionCallback: (final locales, final supportedLocales) {
        final defaultLocale = () {
          if (locales == null || locales.isEmpty) return null;
          for (final locale in locales) {
            if (S.delegate.isSupported(locale)) {
              return locale;
            }
          }
        }();

        /// if language is set by user, then use it
        if (userLocale != null) return userLocale;

        return defaultLocale;
      },
      supportedLocales: S.supportedLocales,
      theme: ThemeData.from(
        colorScheme: AppColorSchemes.brand().light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.from(
        colorScheme: AppColorSchemes.brand().dark,
        useMaterial3: true,
      ),
    );
  }
}
