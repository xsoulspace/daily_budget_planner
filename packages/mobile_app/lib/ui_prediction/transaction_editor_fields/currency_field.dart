import 'package:flutter/scheduler.dart';
import 'package:mobile_app/common_imports.dart';

class CurrencyAutoCompleter extends HookWidget with HasNotifiers {
  const CurrencyAutoCompleter({
    required this.onSelected,
    required this.type,
    super.key,
  });
  final ValueSetter<CurrencyId> onSelected;
  final CurrencyType type;
  @override
  Widget build(final BuildContext context) {
    useListenable(dictionariesNotifier);
    final defaultCurrencyId = finSettingsNotifier.getDefaultCurrencyId(type);
    final options = switch (type) {
      CurrencyType.fiat => dictionariesNotifier.fiatCurrenciesList,
      CurrencyType.crypto => dictionariesNotifier.cryptoCurrenciesList,
    };

    Iterable<CurrencyId> getCurrencyOptions(final String query) =>
        options.where(
          (final currency) => dictionariesNotifier
              .getCurrency(currency, type)
              .displayString
              .toLowerCase()
              .contains(query.toLowerCase()),
        );
    return _CurrencyAutocompleter(
      displayStringForOption: (final id) =>
          dictionariesNotifier.getCurrency(id, type).displayString,
      initialValue: defaultCurrencyId,
      options: options,
      isLoading: dictionariesNotifier.isLoading,
      getCurrencyOptions: getCurrencyOptions,
      onSelected: onSelected,
    );
  }
}

class _CurrencyAutocompleter extends HookWidget with HasNotifiers {
  const _CurrencyAutocompleter({
    required this.options,
    required this.isLoading,
    required this.onSelected,
    required this.initialValue,
    required this.displayStringForOption,
    required this.getCurrencyOptions,
    super.key,
  });
  final Iterable<CurrencyId> options;
  final Iterable<CurrencyId> Function(String) getCurrencyOptions;
  final ValueSetter<CurrencyId> onSelected;
  final CurrencyId? initialValue;
  final String Function(CurrencyId) displayStringForOption;
  final bool isLoading;

  @override
  Widget build(final BuildContext context) {
    if (isLoading) {
      return const Center(child: UiCircularProgress());
    }
    final initialValue = this.initialValue?.value ?? '';
    return Autocomplete<String>(
      optionsBuilder: (final textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return options as Iterable<String>;
        }
        return getCurrencyOptions(textEditingValue.text) as Iterable<String>;
      },
      optionsViewBuilder: (final context, final onSelected, final options) =>
          _AutocompleteOptions(
            onSelected: onSelected,
            options: options,
            displayStringForOption: (final option) =>
                displayStringForOption(CurrencyId(option)),
            openDirection: OptionsViewOpenDirection.down,
            maxOptionsHeight: 200,
          ),
      displayStringForOption: (final option) =>
          displayStringForOption(CurrencyId(option)),
      initialValue: (initialValue.isNotEmpty)
          ? TextEditingValue(
              text: displayStringForOption(CurrencyId(initialValue)),
            )
          : null,
      onSelected: (final option) => onSelected(CurrencyId(option)),
      fieldViewBuilder:
          (
            final context,
            final textController,
            final focusNode,
            final onFieldSubmitted,
          ) => TextField(
            controller: textController,
            focusNode: focusNode,
            decoration: const InputDecoration(
              // TODO(arenukvern): add localization l10n
              labelText: 'Currency',
              hintText: 'Type to search...',
            ),
          ),
    );
  }
}

// The default Material-style Autocomplete options.
class _AutocompleteOptions<T extends Object> extends StatelessWidget {
  const _AutocompleteOptions({
    required this.displayStringForOption,
    required this.onSelected,
    required this.openDirection,
    required this.options,
    required this.maxOptionsHeight,
    this.maxOptionsWidth = 300,
    super.key,
  });

  final AutocompleteOptionToString<T> displayStringForOption;

  final AutocompleteOnSelected<T> onSelected;
  final OptionsViewOpenDirection openDirection;

  final Iterable<T> options;
  final double maxOptionsHeight;
  final double maxOptionsWidth;

  @override
  Widget build(final BuildContext context) {
    final AlignmentDirectional optionsAlignment = switch (openDirection) {
      OptionsViewOpenDirection.up => AlignmentDirectional.bottomStart,
      OptionsViewOpenDirection.down ||
      OptionsViewOpenDirection.mostSpace => AlignmentDirectional.topStart,
    };
    return Align(
      alignment: optionsAlignment,
      child: Material(
        elevation: 4,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxOptionsHeight,
            maxWidth: maxOptionsWidth,
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (final context, final index) {
              final T option = options.elementAt(index);
              final displayString = displayStringForOption(option);
              return InkWell(
                onTap: () => onSelected(option),
                borderRadius: UiBorderRadius.extraLarge,
                child: Builder(
                  builder: (final context) {
                    final bool highlight =
                        AutocompleteHighlightedOption.of(context) == index;
                    if (highlight) {
                      SchedulerBinding.instance.addPostFrameCallback((
                        final timeStamp,
                      ) {
                        unawaited(
                          Scrollable.ensureVisible(context, alignment: 0.5),
                        );
                      }, debugLabel: 'AutocompleteOptions.ensureVisible');
                    }
                    return Container(
                      color: highlight ? Theme.of(context).focusColor : null,
                      padding: const EdgeInsets.all(16),
                      child: Text(displayString),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
