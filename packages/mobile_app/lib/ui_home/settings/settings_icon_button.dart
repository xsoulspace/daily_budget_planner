import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:mobile_app/home/settings/settings_bottom_dialog.dart';

class SettingsIconButton extends HookWidget {
  const SettingsIconButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final isPopupVisible = useIsBool();
    void onClose() => isPopupVisible.value = false;
    return PortalTarget(
      visible: isPopupVisible.value,
      portalFollower: GestureDetector(
        onVerticalDragStart: (final details) => onClose(),
        onHorizontalDragStart: (final details) => onClose(),
        child: ModalBarrier(
          color: context.colorScheme.shadow.withOpacity(0.1),
          onDismiss: onClose,
        ).animate().fade(
              duration: 40.milliseconds,
            ),
      ),
      child: PortalTarget(
        visible: isPopupVisible.value,
        portalFollower: SettingsBottomPopup(
          onClose: onClose,
        ).animate().fade(
              duration: 50.milliseconds,
            ),
        anchor: const Aligned(
          follower: Alignment.bottomRight,
          target: Alignment.topRight,
        ),
        child: IconButton(
          onPressed: () {
            isPopupVisible.value = true;
          },
          icon: const Icon(Icons.settings),
        ),
      ),
    );
  }
}
