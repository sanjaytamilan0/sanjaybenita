import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/wedding_config_model.dart';
import '../../../shared/animations/entrance_animations.dart';
import '../../countdown/widgets/countdown_widget.dart';

class HeroSection extends ConsumerWidget {
  final WeddingConfig config;
  final VoidCallback onExploreClick;

  const HeroSection({
    super.key,
    required this.config,
    required this.onExploreClick,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Container(
      constraints: BoxConstraints(
        minHeight: screenHeight.clamp(680.0, 1000.0),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundIvory,
            AppColors.surfaceCream,
            AppColors.surfaceCreamLight,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background subtle imagery
          Positioned(
            top: -50,
            right: -50,
            child: Opacity(
              opacity: 0.12,
              child: Image.network(
                'https://images.unsplash.com/photo-1583939003579-730e3918a45a?auto=format&fit=crop&w=800&q=80',
                width: 320,
                height: 320,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Opacity(
              opacity: 0.12,
              child: Image.network(
                'https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=800&q=80',
                width: 320,
                height: 320,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),

          // Central Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveLayout.horizontalPadding(context),
                vertical: 60,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeSlideEntrance(
                      delay: const Duration(milliseconds: 100),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.antiqueGold.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.antiqueGold, width: 1.2),
                        ),
                        child: Text(
                          config.invitationTitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cinzel(
                            fontSize: isMobile ? 12 : 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 3.0,
                            color: AppColors.primaryMaroon,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Couple Names
                    FadeSlideEntrance(
                      delay: const Duration(milliseconds: 250),
                      child: Column(
                        children: [
                          Text(
                            config.groomName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cinzelDecorative(
                              fontSize: isMobile ? 38 : 64,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryMaroon,
                              letterSpacing: isMobile ? 2.0 : 4.0,
                              shadows: [
                                Shadow(
                                  color: AppColors.antiqueGold.withValues(alpha: 0.4),
                                  blurRadius: 16,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: GentlePulse(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 1.5,
                                    width: isMobile ? 40 : 80,
                                    color: AppColors.antiqueGold,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Text(
                                      '&',
                                      style: GoogleFonts.cormorantGaramond(
                                        fontSize: isMobile ? 36 : 52,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.italic,
                                        color: AppColors.antiqueGoldDark,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1.5,
                                    width: isMobile ? 40 : 80,
                                    color: AppColors.antiqueGold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            config.brideName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cinzelDecorative(
                              fontSize: isMobile ? 38 : 64,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryMaroon,
                              letterSpacing: isMobile ? 2.0 : 4.0,
                              shadows: [
                                Shadow(
                                  color: AppColors.antiqueGold.withValues(alpha: 0.4),
                                  blurRadius: 16,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Romantic Quote
                    FadeSlideEntrance(
                      delay: const Duration(milliseconds: 400),
                      child: Text(
                        '"${config.invitationSubtitle}"',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: isMobile ? 18 : 22,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDarkBrown,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Date Placeholder Badge
                    FadeSlideEntrance(
                      delay: const Duration(milliseconds: 550),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month, color: AppColors.antiqueGold, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Monday, 26th April 2027',
                            style: GoogleFonts.cinzel(
                              fontSize: isMobile ? 14 : 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryMaroon,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Live Countdown
                    const FadeSlideEntrance(
                      delay: Duration(milliseconds: 700),
                      child: CountdownWidget(isCompact: false),
                    ),
                    const SizedBox(height: 36),

                    // Scroll Down Prompt
                    FadeSlideEntrance(
                      delay: const Duration(milliseconds: 850),
                      child: InkWell(
                        onTap: onExploreClick,
                        borderRadius: BorderRadius.circular(30),
                        child: Column(
                          children: [
                            Text(
                              'EXPLORE INVITATION',
                              style: GoogleFonts.cinzel(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                                color: AppColors.antiqueGoldDark,
                              ),
                            ),
                            const SizedBox(height: 6),
                            GentlePulse(
                              scaleDelta: 0.2,
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.antiqueGold,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
