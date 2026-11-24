import 'package:flutter/material.dart';
import 'wedding_theme_palette.dart';

class AppColors {
  static WeddingThemeColors _current = WeddingThemeColors.royalMaroon;

  static void applyTheme(WeddingThemeColors colors) {
    _current = colors;
  }

  static Color get primaryMaroon => _current.primary;
  static Color get antiqueGold => _current.secondary;
  static Color get antiqueGoldLight => _current.secondaryLight;
  static Color get antiqueGoldDark => _current.secondaryDark;
  static Color get backgroundIvory => _current.background;
  static Color get surfaceCream => _current.surface;
  static Color get surfaceCreamLight => _current.surfaceLight;
  static Color get textDarkBrown => _current.textDark;
  static Color get textMutedBrown => _current.textMuted;
  static Color get borderGold => _current.border;
  static Color get goldAccent => _current.accent;
  static Color get goldGlow => _current.glow;
  static Color get maroonGlow => _current.primaryGlow;

  static WeddingThemeColors get current => _current;
}
