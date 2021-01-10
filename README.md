# l10n

flutter 국제화 프로젝트

## Getting Started

0. new project 
    ```shell
    flutter create l10n
    ```

1. add flutter package 
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

2. new file "bora_localizations.dart"
    
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
