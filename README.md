# l10n

flutter 국제화 프로젝트

## Getting Started

### 0. new project 
```
flutter create l10n
```

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

### 2. new file "bora_localizations.dart"  
파일 생성 후 string getter 작성
```dart
import 'package:intl/intl.dart';

class CandyLocalizations {
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

### 3. [cmd] run dart_to_arb.sh
```sh
# flutter pub run intl_translation:extract_to_arb --output-dir=[저장될 경로] [arb를 추출할 dart 파일]

flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/l10n/bora_localizations.dart
``` 

위 명령어 실행 후 `intl_messages.arb`파일 생성 됨

3-1. open intl_messages.arb
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

3-2. copy and paste .arb files
`intl_messages.arb`파일을 수동으로 복사 붙여넣기 해줍니다.
* intl_messages.arb
* intl_messages_ko.arb
* intl_messages_en.arb
