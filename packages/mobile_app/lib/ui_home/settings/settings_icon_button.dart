import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/settings/settings_bottom_dialog.dart';

class SettingsIconButton extends HookWidget {
  const SettingsIconButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final controller = useUiPopupButtonController();
    return UiPopupButton(
      controller: controller,
      menuBuilder: (final context) => UiPopupDecoration(
        child: SettingsBottomPopup(
          onClose: controller.close,
        ),
      ),
      buttonBuilder: (final context, final isVisible, final onPressed) =>
          IconButton(
        onPressed: onPressed,
        tooltip: 'Settings',
        icon: const Icon(Icons.settings),
      ),
    );
  }
}
