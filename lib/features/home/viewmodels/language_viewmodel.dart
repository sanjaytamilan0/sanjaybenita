import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppLanguage {
  english,
  tamil,
}

final languageProvider = StateNotifierProvider<LanguageNotifier, AppLanguage>((ref) {
  return LanguageNotifier();
});

class LanguageNotifier extends StateNotifier<AppLanguage> {
  LanguageNotifier() : super(AppLanguage.english);

  void toggleLanguage() {
    state = state == AppLanguage.english ? AppLanguage.tamil : AppLanguage.english;
  }

  void setLanguage(AppLanguage lang) {
    state = lang;
  }
}
