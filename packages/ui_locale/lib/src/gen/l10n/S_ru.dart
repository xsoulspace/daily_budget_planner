import 'S.dart';

/// The translations for Russian (`ru`).
class SRu extends S {
  SRu([String locale = 'ru']) : super(locale);

  @override
  String get settings => 'Настройки';

  @override
  String get yourBudget => 'Мой бюджет';

  @override
  String get dailyBudget => 'Бюджет на день';

  @override
  String get weeklyBudget => 'Недельный бюджет';

  @override
  String get monthlyBudget => 'Месячный бюджет';

  @override
  String get daysLeftInWeek => 'Осталось дней в неделе';

  @override
  String get copied => 'Скопировано';

  @override
  String get ok => 'OK';

  @override
  String get monthly => 'Месяц';

  @override
  String get weekly => 'Неделя';

  @override
  String get language => 'Язык';

  @override
  String get chooseLanguage => 'Выбери язык';

  @override
  String get done => 'Ок';

  @override
  String get nextBudgetDay => 'Следующий день бюджета';

  @override
  String get chooseDate => 'Выбери дату';

  @override
  String get extraCostsOrSaving => 'Доп затраты или в копилку';

  @override
  String get willBeSubstructedFromYourBudget => 'будет вычтено из бюджета';

  @override
  String get canBeLessIfYouHaveLessThan7Days => 'может быть меньше, если осталось меньше 7 дней до дня бюджета';

  @override
  String get daysInTotal => 'Дней всего:';
}
