import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/home/settings/language_bottom_sheet.dart';

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
                title: const Text('Language'),
                trailing: const Icon(Icons.language),
              ),
            ],
          ),
        ),
      );
}
