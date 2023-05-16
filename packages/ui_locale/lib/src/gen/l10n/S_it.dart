import 'S.dart';

/// The translations for Italian (`it`).
class SIt extends S {
  SIt([String locale = 'it']) : super(locale);

  @override
  String get settings => 'Impostazioni';

  @override
  String get yourBudget => 'Il tuo budget';

  @override
  String get dailyBudget => 'Budget giornaliero';

  @override
  String get weeklyBudget => 'Budget settimanale';

  @override
  String get monthlyBudget => 'Budget mensile';

  @override
  String get daysLeftInWeek => 'Giorni rimanenti nella settimana';

  @override
  String get copied => 'Copiato';

  @override
  String get ok => 'OK';

  @override
  String get monthly => 'Mensile';

  @override
  String get weekly => 'Settimanale';

  @override
  String get language => 'Lingua';

  @override
  String get chooseLanguage => 'Scegli lingua';

  @override
  String get done => 'Fatto';

  @override
  String get nextBudgetDay => 'Prossimo giorno di budget';

  @override
  String get chooseDate => 'Scegli data';

  @override
  String get extraCostsOrSaving => 'Costi o risparmi aggiuntivi';

  @override
  String get willBeSubstructedFromYourBudget => 'verrà sottratto dal tuo budget';

  @override
  String get canBeLessIfYouHaveLessThan7Days => 'può essere inferiore se mancano meno di 7 giorni alla data scelta';

  @override
  String get daysInTotal => 'Giorni in totale:';
}
