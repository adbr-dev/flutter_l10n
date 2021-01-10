import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:l10n/l10n/messages_all.dart';

class BoraLocalizations {
  static Future<BoraLocalizations> load(Locale locale) {
    final name = locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return BoraLocalizations();
    });
  }

  static BoraLocalizations of(BuildContext context) {
    return Localizations.of<BoraLocalizations>(context, BoraLocalizations);
  }

  String get appBarTitle => Intl.message(
        'flutter 보라 홈페이지',
        name: 'appBarTitle',
      );
  String get bodyText => Intl.message(
        '버튼을 여러번 눌렀습니다.',
        name: 'bodyText',
      );

  String bodyCountText(int count) {
    return Intl.message(
      '$count 번 눌렀습니다.',
      name: 'bodyCountText',
      args: [count],
      desc: '이렇게 설명도 달 수 있습니다 :>',
    );
  }
}

class BoraLocalizationsDelegate
    extends LocalizationsDelegate<BoraLocalizations> {
  const BoraLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ko', 'en'].contains(locale.languageCode);

  @override
  Future<BoraLocalizations> load(Locale locale) =>
      BoraLocalizations.load(locale);

  @override
  bool shouldReload(BoraLocalizationsDelegate old) => false;
}
