import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/models/wedding_config_model.dart';

class FooterSection extends StatelessWidget {
  final WeddingConfig config;
  final Function(int) onNavigateToSection;

  const FooterSection({
    super.key,
    required this.config,
    required this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryMaroon,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    config.groomName,
                    style: GoogleFonts.cinzelDecorative(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.antiqueGoldLight,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 22,
                    ),
                  ),
                  Text(
                    config.brideName,
                    style: GoogleFonts.cinzelDecorative(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.antiqueGoldLight,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '"Made with love, for a lifetime of togetherness."',
                textAlign: TextAlign.center,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: AppColors.surfaceCream,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Monday, April 26, 2027 • Thadikkarankonam, Tamil Nadu',
                style: GoogleFonts.cinzel(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.antiqueGold,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 10,
                children: [
                  _buildFooterLink('Invitation', () => onNavigateToSection(0)),
                  _buildFooterLink('Couple', () => onNavigateToSection(1)),
                  _buildFooterLink('Love Story', () => onNavigateToSection(2)),
                  _buildFooterLink('Events', () => onNavigateToSection(3)),
                  _buildFooterLink('Gallery', () => onNavigateToSection(4)),
                  _buildFooterLink('Venue & Location', () => onNavigateToSection(5)),
                ],
              ),
              const SizedBox(height: 28),
              Container(
                height: 1,
                width: 280,
                color: AppColors.antiqueGold.withValues(alpha: 0.4),
              ),
              const SizedBox(height: 18),
              Text(
                '© 2027 Sanjay & Benita Wedding Celebration. All Rights Reserved.',
                textAlign: TextAlign.center,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 13,
                  color: AppColors.surfaceCream.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLink(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: GoogleFonts.cinzel(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.surfaceCreamLight,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
