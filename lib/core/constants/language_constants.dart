enum Language { en, vi }

extension LanguageExtension on Language {
  static const Map<int, String> vi = {0: "Tiếng Việt", 1: "Vietnamese"};
  static const Map<int, String> en = {0: "Tiếng Anh", 1: "English"};

  String get name {
    switch (this) {
      case Language.en:
        return en[1]!;
      case Language.vi:
        return vi[0]!;
    }
  }

  int get code {
    switch (this) {
      case Language.en:
        return 1;
      case Language.vi:
        return 0;
    }
  }
}
