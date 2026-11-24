import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/wedding_config_model.dart';
import '../../../shared/animations/entrance_animations.dart';
import '../../../shared/widgets/section_header.dart';

class InvitationMessageSection extends StatelessWidget {
  final WeddingConfig config;

  const InvitationMessageSection({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.horizontalPadding(context),
        vertical: 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: FadeSlideEntrance(
            child: LuxuryCardFrame(
              backgroundColor: Colors.white.withValues(alpha: 0.94),
              padding: EdgeInsets.all(isMobile ? 22 : 40),
              child: Column(
                children: [
                  // Christian Blessing Top Tag
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.church_rounded, color: AppColors.antiqueGold, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'IN GOD’S GRACE & LOVE',
                        style: GoogleFonts.cinzel(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: AppColors.antiqueGoldDark,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.church_rounded, color: AppColors.antiqueGold, size: 20),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '“What God has joined together, let no one separate.”  — Mark 10:9',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMutedBrown,
                    ),
                  ),
                  const SizedBox(height: 14),

                  const SectionHeader(
                    title: 'A JOYOUS INVITATION',
                    subtitle: 'Two lives united in faith, love, and divine blessings',
                  ),

                  // Responsive Invitation Layout with Couple Photo
                  if (isMobile)
                    Column(
                      children: [
                        _buildInvitationPhoto(),
                        const SizedBox(height: 24),
                        _buildInvitationText(isMobile),
                      ],
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: _buildInvitationPhoto(),
                        ),
                        const SizedBox(width: 36),
                        Expanded(
                          flex: 6,
                          child: _buildInvitationText(isMobile),
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

  Widget _buildInvitationPhoto() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.antiqueGold, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.antiqueGold.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 1.05,
        child: Image.asset(
          'assets/images/couple.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.surfaceCream,
            child: Center(
              child: Icon(Icons.favorite, size: 60, color: AppColors.antiqueGold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInvitationText(bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          config.invitationMessage,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.cormorantGaramond(
            fontSize: isMobile ? 18 : 21,
            height: 1.8,
            fontWeight: FontWeight.w500,
            color: AppColors.textDarkBrown,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.surfaceCream.withValues(alpha: 0.8),
            border: Border.all(
                color: AppColors.antiqueGold.withValues(alpha: 0.8), width: 1.2),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            '~ Sanjay & Benita ~',
            style: GoogleFonts.cinzelDecorative(
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryMaroon,
            ),
          ),
        ),
      ],
    );
  }
}
