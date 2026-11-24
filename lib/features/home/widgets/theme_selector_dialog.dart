import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/wedding_theme_palette.dart';
import '../viewmodels/theme_viewmodel.dart';

class ThemeSelectorDialog extends ConsumerWidget {
  const ThemeSelectorDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (context) => const ThemeSelectorDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(weddingThemeStateProvider);

    final themes = [
      WeddingThemeType.royalMaroonGold,
      WeddingThemeType.emeraldGarden,
      WeddingThemeType.sapphirePeacock,
      WeddingThemeType.blushRoseGold,
    ];

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundIvory,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.antiqueGold, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.antiqueGold.withValues(alpha: 0.35),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.primaryMaroon,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.palette_rounded, color: AppColors.antiqueGoldLight, size: 24),
                        const SizedBox(width: 12),
                        Text(
                          'CHOOSE WEDDING THEME',
                          style: GoogleFonts.cinzelDecorative(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.antiqueGoldLight,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.white, size: 22),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),

              // Theme Options
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: themes.map((themeType) {
                    final palette = WeddingThemeColors.fromType(themeType);
                    final isSelected = currentTheme == themeType;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () {
                          ref
                              .read(weddingThemeStateProvider.notifier)
                              .setTheme(themeType);
                          Navigator.of(context).pop();
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? palette.surfaceLight
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? palette.primary
                                  : palette.border.withValues(alpha: 0.6),
                              width: isSelected ? 2.2 : 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isSelected
                                    ? palette.primary.withValues(alpha: 0.18)
                                    : Colors.black.withValues(alpha: 0.03),
                                blurRadius: isSelected ? 12 : 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Swatch previews
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      palette.primary,
                                      palette.secondary,
                                    ],
                                  ),
                                  border: Border.all(
                                    color: palette.secondary,
                                    width: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Title & subtitle
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      palette.name,
                                      style: GoogleFonts.cinzel(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: palette.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      palette.description,
                                      style: GoogleFonts.cormorantGaramond(
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                        color: palette.textMuted,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Radio indicator
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? palette.primary
                                        : Colors.grey.shade400,
                                    width: 2,
                                  ),
                                  color: isSelected
                                      ? palette.primary
                                      : Colors.transparent,
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Bottom note
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
                child: Text(
                  'Instantly transforms all royal borders, backgrounds, typography, and card accents.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textMutedBrown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
