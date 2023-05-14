import 'S.dart';

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get yourBudget => 'Your Budget';

  @override
  String get dailyBudget => 'Daily Budget';

  @override
  String get weeklyBudget => 'Weekly Budget';

  @override
  String get monthlyBudget => 'Monthly Budget';

  @override
  String get daysLeftInWeek => 'Days Left in week';

  @override
  String get copied => 'Copied';

  @override
  String get ok => 'OK';

  @override
  String get nextBudgetDay => 'Next Budget Day';

  @override
  String get chooseDate => 'Choose Date';

  @override
  String get extraCostsOrSaving => 'Extra costs or savings';

  @override
  String get willBeSubstructedFromYourBudget => 'will be subtracted from your budget';

  @override
  String get canBeLessIfYouHaveLessThan7Days => 'can be less if you have less than 7 days till chosen date';

  @override
  String get daysInTotal => 'Days in total:';
}
