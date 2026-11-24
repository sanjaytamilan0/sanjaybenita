import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/wedding_theme_palette.dart';

final weddingThemeStateProvider =
    StateNotifierProvider<WeddingThemeNotifier, WeddingThemeType>((ref) {
  return WeddingThemeNotifier();
});

class WeddingThemeNotifier extends StateNotifier<WeddingThemeType> {
  WeddingThemeNotifier() : super(WeddingThemeType.royalMaroonGold) {
    AppColors.applyTheme(WeddingThemeColors.fromType(state));
  }

  void setTheme(WeddingThemeType theme) {
    state = theme;
    AppColors.applyTheme(WeddingThemeColors.fromType(theme));
  }
}
