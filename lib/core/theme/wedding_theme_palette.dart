import 'package:flutter/material.dart';

enum WeddingThemeType {
  royalMaroonGold, // Royal Maroon & Antique Gold (Traditional Luxury)
  emeraldGarden,    // Emerald Green & Gold (Regal Nature / South Indian Pattu)
  sapphirePeacock,  // Royal Peacock Blue & Rose Gold (Grand Night / Modern Royal)
  blushRoseGold,    // Rose Gold & Dusty Pink (Romantic Floral)
}

class WeddingThemeColors {
  final String name;
  final String description;
  final Color primary;
  final Color secondary;
  final Color secondaryLight;
  final Color secondaryDark;
  final Color background;
  final Color surface;
  final Color surfaceLight;
  final Color textDark;
  final Color textMuted;
  final Color border;
  final Color accent;
  final Color glow;
  final Color primaryGlow;

  const WeddingThemeColors({
    required this.name,
    required this.description,
    required this.primary,
    required this.secondary,
    required this.secondaryLight,
    required this.secondaryDark,
    required this.background,
    required this.surface,
    required this.surfaceLight,
    required this.textDark,
    required this.textMuted,
    required this.border,
    required this.accent,
    required this.glow,
    required this.primaryGlow,
  });

  // 1. Royal Maroon & Antique Gold (Traditional Classic)
  static const WeddingThemeColors royalMaroon = WeddingThemeColors(
    name: 'Royal Maroon & Gold',
    description: 'Traditional South Indian regal heritage',
    primary: Color(0xFF800020),
    secondary: Color(0xFFC9A44C),
    secondaryLight: Color(0xFFE5C378),
    secondaryDark: Color(0xFF9A7B2C),
    background: Color(0xFFFFF9EF),
    surface: Color(0xFFF7EBDD),
    surfaceLight: Color(0xFFFCF5ED),
    textDark: Color(0xFF38251F),
    textMuted: Color(0xFF6B4E45),
    border: Color(0xFFDFBF77),
    accent: Color(0xFFD4AF37),
    glow: Color(0x33C9A44C),
    primaryGlow: Color(0x22800020),
  );

  // 2. Emerald Green & Rich Gold (Traditional Pattu & Temple Majesty)
  static const WeddingThemeColors emerald = WeddingThemeColors(
    name: 'Emerald & Gold',
    description: 'Sacred temple silk & verdant elegance',
    primary: Color(0xFF0F4D32),
    secondary: Color(0xFFD4AF37),
    secondaryLight: Color(0xFFE7CE78),
    secondaryDark: Color(0xFFA6851F),
    background: Color(0xFFF7FAF7),
    surface: Color(0xFFE8F1EC),
    surfaceLight: Color(0xFFF0F6F2),
    textDark: Color(0xFF1B2E24),
    textMuted: Color(0xFF456152),
    border: Color(0xFFB5D1C3),
    accent: Color(0xFFC59F2D),
    glow: Color(0x33D4AF37),
    primaryGlow: Color(0x220F4D32),
  );

  // 3. Peacock Blue & Warm Gold (Celestial Royal Night)
  static const WeddingThemeColors peacockBlue = WeddingThemeColors(
    name: 'Peacock Royal & Gold',
    description: 'Majestic celestial indigo & warm celebration',
    primary: Color(0xFF0B2E59),
    secondary: Color(0xFFD9A036),
    secondaryLight: Color(0xFFF0C575),
    secondaryDark: Color(0xFFAA781C),
    background: Color(0xFFF5F8FC),
    surface: Color(0xFFE6EEF8),
    surfaceLight: Color(0xFFF0F5FB),
    textDark: Color(0xFF142233),
    textMuted: Color(0xFF3C5677),
    border: Color(0xFFBDD2EA),
    accent: Color(0xFFC78F26),
    glow: Color(0x33D9A036),
    primaryGlow: Color(0x220B2E59),
  );

  // 4. Rose Gold & Blush Pink (Modern Romantic Pastel)
  static const WeddingThemeColors blushRose = WeddingThemeColors(
    name: 'Rose Romance & Gold',
    description: 'Graceful blush florals & shimmering rose gold',
    primary: Color(0xFF8B264E),
    secondary: Color(0xFFC78265),
    secondaryLight: Color(0xFFE5A992),
    secondaryDark: Color(0xFF9E5C41),
    background: Color(0xFFFFF7F8),
    surface: Color(0xFFFBE6EB),
    surfaceLight: Color(0xFFFDF0F3),
    textDark: Color(0xFF361822),
    textMuted: Color(0xFF6B4552),
    border: Color(0xFFE8BDCA),
    accent: Color(0xFFD4798D),
    glow: Color(0x33C78265),
    primaryGlow: Color(0x228B264E),
  );

  static WeddingThemeColors fromType(WeddingThemeType type) {
    switch (type) {
      case WeddingThemeType.royalMaroonGold:
        return royalMaroon;
      case WeddingThemeType.emeraldGarden:
        return emerald;
      case WeddingThemeType.sapphirePeacock:
        return peacockBlue;
      case WeddingThemeType.blushRoseGold:
        return blushRose;
    }
  }
}
