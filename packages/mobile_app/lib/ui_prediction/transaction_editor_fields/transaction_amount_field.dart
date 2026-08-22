import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile_app/common_imports.dart';

class TransactionAmountField extends StatelessWidget with HasNotifiers {
  const TransactionAmountField({
    required this.controller,
    required this.currencyType,
    required this.currencyId,
    super.key,
  });

  final TextEditingController controller;
  final CurrencyType currencyType;
  final CurrencyId currencyId;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Builder(
        builder: (final context) {
          final label = switch (currencyType) {
            CurrencyType.fiat => LocalizedMap(
        {
                  languages.en: 'Amount',
                  languages.it: 'Importo',
                  languages.ru: 'Сумма',
                },
              ),
            CurrencyType.crypto => LocalizedMap(
        {
                  languages.en: 'Quantity',
                  languages.it: 'Quantità',
                  languages.ru: 'Количество',
                },
              ),
          };
          var currencySuffix = '';
          if (!Envs.isCurrencySwitchingEnabled) {
            currencySuffix =
                // ignore: lines_longer_than_80_chars
                ' (${dictionariesNotifier.getCurrency(currencyId, currencyType).displayString})';
          }
          return UiTextField(
            decoration: InputDecoration(
              hintText: '0.00',
              labelText: label.getValue(locale) + currencySuffix,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              FormBuilderValidators.min(0),
            ]),
            inputFormatters: [
              NumberFieldUtils.doubleInputFormatter,
            ],
            autofocus: true,
            style: Theme.of(context).textTheme.titleLarge,
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          );
        },
      ),
    );
  }
}
