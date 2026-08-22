import 'package:mobile_app/common_imports.dart';

/// A list tile that allows switching between system, light, and dark themes
class UiThemeModeTile extends StatelessWidget {
  const UiThemeModeTile({super.key});

  @override
  Widget build(final BuildContext context) {
    final themeMode = context.select<AppSettingsNotifier, ThemeMode>(
      (final c) => c.value.brightness.themeMode,
    );
    final locale = useLocale(context);

    return ListTile(
      title: Text(
        LocalizedMap(
        {
            languages.en: 'Theme',
            languages.it: 'Tema',
            languages.ru: 'Тема',
          },
        ).getValue(locale),
      ),
      subtitle: Text(_getThemeModeText(themeMode, locale)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ThemeModeIcon(
            currentThemeMode: themeMode,
            icon: CupertinoIcons.circle_lefthalf_fill,
            themeMode: ThemeMode.system,
            onTap: _updateThemeMode,
          ),
          const Gap(8),
          _ThemeModeIcon(
            currentThemeMode: themeMode,
            icon: CupertinoIcons.sun_max_fill,
            themeMode: ThemeMode.light,
            onTap: _updateThemeMode,
          ),
          const Gap(8),
          _ThemeModeIcon(
            currentThemeMode: themeMode,
            icon: CupertinoIcons.moon_fill,
            themeMode: ThemeMode.dark,
            onTap: _updateThemeMode,
          ),
        ],
      ),
    );
  }

  Future<void> _updateThemeMode(
    final BuildContext context,
    final ThemeMode mode,
  ) async =>
      context.read<AppSettingsNotifier>().updateBrightness(
            mode == ThemeMode.light
                ? UiBrightness.light
                : mode == ThemeMode.dark
                    ? UiBrightness.dark
                    : UiBrightness.system,
          );

  static String _getThemeModeText(final ThemeMode mode, final Locale locale) {
    final system = {
      languages.en: 'System',
      languages.it: 'Sistema',
      languages.ru: 'Системная',
    };
    final dark = {
      languages.en: 'Dark',
      languages.it: 'Scuro',
      languages.ru: 'Тёмная',
    };
    final light = {
      languages.en: 'Light',
      languages.it: 'Chiaro',
      languages.ru: 'Светлая',
    };

    return LocalizedMap(
        switch (mode) {
        ThemeMode.system => system,
        ThemeMode.dark => dark,
        ThemeMode.light => light,
      },
    ).getValue(locale);
  }
}

class _ThemeModeIcon extends StatelessWidget {
  const _ThemeModeIcon({
    required this.icon,
    required this.onTap,
    required this.themeMode,
    required this.currentThemeMode,
  });

  final ThemeMode themeMode;
  final ThemeMode currentThemeMode;
  final IconData icon;
  final void Function(BuildContext context, ThemeMode mode) onTap;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final isSelected = themeMode == currentThemeMode;
    return UiBaseButton(
      tooltip: UiThemeModeTile._getThemeModeText(themeMode, locale),
      onPressed: () => onTap(context, themeMode),
      builder: (final context, final isLoading, final setLoading) =>
          AnimatedContainer(
        duration: 300.milliseconds,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 24,
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
