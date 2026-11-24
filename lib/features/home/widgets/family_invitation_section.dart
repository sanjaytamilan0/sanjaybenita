import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/wedding_config_model.dart';
import '../../../shared/animations/entrance_animations.dart';
import '../../../shared/widgets/section_header.dart';

class FamilyInvitationSection extends StatelessWidget {
  final WeddingConfig config;

  const FamilyInvitationSection({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.surfaceCream.withValues(alpha: 0.4),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.horizontalPadding(context),
        vertical: 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880),
          child: FadeSlideEntrance(
            child: LuxuryCardFrame(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(isMobile ? 24 : 44),
              child: Column(
                children: [
                  const SectionHeader(
                    title: 'WITH SACRED BLESSINGS',
                    subtitle: 'From the Krishnan & Thomas Families',
                  ),
                  Text(
                    config.familyInvitationMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: isMobile ? 18 : 22,
                      height: 1.8,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDarkBrown,
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (isMobile)
                    Column(
                      children: [
                        _buildFamilyBox(
                          title: "Groom's Family",
                          details: 'Mr. & Mrs. R. Krishnan\n& Family',
                        ),
                        const SizedBox(height: 16),
                        _buildFamilyBox(
                          title: "Bride's Family",
                          details: 'Mr. & Mrs. P. Thomas\n& Family',
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: _buildFamilyBox(
                            title: "Groom's Family",
                            details: 'Mr. & Mrs. R. Krishnan\n& Family',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildFamilyBox(
                            title: "Bride's Family",
                            details: 'Mr. & Mrs. P. Thomas\n& Family',
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFamilyBox({required String title, required String details}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.surfaceCreamLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderGold, width: 1),
      ),
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: GoogleFonts.cinzel(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: AppColors.primaryMaroon,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            details,
            textAlign: TextAlign.center,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.textDarkBrown,
            ),
          ),
        ],
      ),
    );
  }
}
