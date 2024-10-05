import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({
    required this.value,
    super.key,
  });
  final String value;
  @override
  Widget build(final BuildContext context) => IconButton(
        onPressed: () async {
          final messenger = ScaffoldMessenger.of(context);
          await Clipboard.setData(
            ClipboardData(text: value),
          );
          messenger.showSnackBar(
            SnackBar(
              content: Text(context.s.copied),
              action: SnackBarAction(
                onPressed: messenger.hideCurrentSnackBar,
                label: context.s.ok,
              ),
            ),
          );
        },
        icon: const Icon(Icons.copy),
      );
}
