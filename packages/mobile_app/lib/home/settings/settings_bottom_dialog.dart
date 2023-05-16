import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/home/settings/language_bottom_sheet.dart';
import 'package:ui_kit/ui_kit.dart';

class SettingsBottomPopup extends StatelessWidget {
  const SettingsBottomPopup({
    required this.onClose,
    super.key,
  });
  final VoidCallback onClose;
  @override
  Widget build(final BuildContext context) => Card(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 250,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  onClose();
                  unawaited(showLanguageBottomSheet(context));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text(context.s.language),
                trailing: const Icon(Icons.language),
              ),
            ],
          ),
        ),
      );
}
