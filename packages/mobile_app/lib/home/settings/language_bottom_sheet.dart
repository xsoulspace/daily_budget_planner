import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/ui_kit.dart';

Future<void> showLanguageBottomSheet(final BuildContext context) async =>
    showModalBottomSheet(
      context: context,
      builder: (final context) => const LanguageBottomSheet(),
    );

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = context.select<UserCubit, Locale?>(
      (final value) => value.state.locale,
    );
    final userCubit = context.read<UserCubit>();
    return Column(
      children: [
        Stack(
          children: [
            ListTile(
              title: Text(
                context.s.chooseLanguage,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.s.done),
              ),
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          itemBuilder: (final context, final index) {
            final e = namedLocalesList[index];
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              dense: true,
              key: ValueKey(e),
              onTap: () async => userCubit.changeLanguage(e.locale),
              tileColor: context.colorScheme.surface,
              title: Text(e.name),
              trailing: locale == e.locale ||
                      context.s.localeName == e.locale.languageCode
                  ? const Icon(Icons.done).animate().fadeIn()
                  : null,
            );
          },
          separatorBuilder: (final context, final index) => const Gap(8),
          itemCount: namedLocalesList.length,
        )
      ],
    );
  }
}
