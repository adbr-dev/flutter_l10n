# l10n

flutter 국제화 프로젝트

## Getting Started

### 0. new project 
```
flutter create l10n
```

</br>

### 1. add flutter package 
* [intl 0.16.1](https://pub.dev/packages/intl/install) 
* [intl_translation: ^0.17.10+1](https://pub.dev/packages/intl_translation/install)
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.16.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  intl_translation: ^0.17.10+1
  ```

</br>
</br>

### 2. new file "bora_localizations.dart"  
파일 생성 후 string getter 작성
> cf. {project name}_localizations.dart

```dart
import 'package:intl/intl.dart';

class BoraLocalizations {
String get appBarTitle => Intl.message(
      'flutter 보라 홈페이지',
      name: 'appBarTitle',
    );
String get bodyText => Intl.message(
      '버튼을 여러번 눌렀습니다.',
      name: 'bodyText',
    );
}
```

</br>
</br>

### 3. [cmd] run dart_to_arb.sh
```sh
# flutter pub run intl_translation:extract_to_arb --output-dir=[저장될 경로] [arb를 추출할 dart 파일]

flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/l10n/bora_localizations.dart
``` 

위 명령어 실행 후 `intl_messages.arb`파일 생성 됨

</br>

**3-1. open intl_messages.arb()**
```arb
{
  "@@last_modified": "2021-01-11T00:17:36.745798",
  "appBarTitle": "flutter 보라 홈페이지",
  "@appBarTitle": {
    "type": "text",
    "placeholders": {}
  },
  "bodyText": "버튼을 여러번 눌렀습니다.",
  "@bodyText": {
    "type": "text",
    "placeholders": {}
  }
}
```

</br>
</br>

**3-2. copy and paste .arb files**
`intl_messages.arb`파일을 수동으로 복사 붙여넣기 해줍니다.
* intl_messages.arb
* intl_messages_ko.arb
* intl_messages_en.arb

</br>

**3-3. open `intl_messages_en.arb` & translate**
```arb
{
  "@@last_modified": "2021-01-11T00:17:36.745798",
  "appBarTitle": "Flutter Bora Home Page",
  "@appBarTitle": {
    "type": "text",
    "placeholders": {}
  },
  "bodyText": "You have pushed the button this many times:",
  "@bodyText": {
    "type": "text",
    "placeholders": {}
  }
}
```

</br>
</br>

### 4. [cmd] run arb_to_dart.sh
```sh
# intl_translation:generate_from_arb
# flutter pub run intl_translation:generate_from_arb --output-dir=[저장될 경로] --no-use-deferred-loading [arb를 추출했던 dart 파일] [번역된 arb 파일들]

flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/bora_localizations.dart lib/l10n/intl_*.arb
```

위 명령어 실행 후 `messages_*.dart`파일들이 생성 됨

* messages_all.dart
* messages_messages_en.dart
* messages_messages_ko.dart
* messages_messages.dart

</br>
</br>

### 5. Add class BoraLocalizationsDelegate and modify class BoraLocalizations in bora_localizations.dart

</br>

**5-1. `BoraLocalizations` class에 다음과 같이 코드를 추가합니다.**
```dart
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
  ...
}
```

</br>

**5-2. LocalizationsDelegate<BoraLocalizations>을 상속받은 `BoraLocalizationsDelegate` class 추가 합니다.**
```dart
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
```

</br>
</br>

### 6. add properties in MaterialApp (main.dart)
`localizationsDelegates` 속성과 `supportedLocales` 속성을 추가해줍니다.

```dart
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/bora_localizations.dart';

...

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ...
      localizationsDelegates: [
        BoraLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ko', 'KR'),
        Locale('en'),
      ],
      ...
    );
  }
}
```
