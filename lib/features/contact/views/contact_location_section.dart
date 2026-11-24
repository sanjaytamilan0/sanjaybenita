import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanjay_and_benita/core/theme/app_colors.dart';
import 'package:sanjay_and_benita/core/utils/responsive.dart';
import 'package:sanjay_and_benita/core/utils/url_helper.dart';
import 'package:sanjay_and_benita/data/models/wedding_config_model.dart';
import 'package:sanjay_and_benita/shared/animations/entrance_animations.dart';
import 'package:sanjay_and_benita/shared/widgets/section_header.dart';

class ContactLocationSection extends StatelessWidget {
  final WeddingConfig config;

  const ContactLocationSection({
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
          constraints: const BoxConstraints(maxWidth: 1050),
          child: Column(
            children: [
              const SectionHeader(
                title: 'VENUE & LOCATION',
                subtitle: 'Find directions to our auspicious wedding and celebration venues',
              ),
              if (isMobile)
                Column(
                  children: [
                    _buildMarriageVenueCard(context),
                    const SizedBox(height: 24),
                    _buildReceptionVenueCard(context),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildMarriageVenueCard(context)),
                    const SizedBox(width: 24),
                    Expanded(child: _buildReceptionVenueCard(context)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarriageVenueCard(BuildContext context) {
    return FadeSlideEntrance(
      child: LuxuryCardFrame(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryMaroon,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.account_balance, color: AppColors.antiqueGoldLight, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MARRIAGE DESTINATION',
                        style: GoogleFonts.cinzel(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: AppColors.antiqueGoldDark,
                        ),
                      ),
                      Text(
                        'Thadikkarankonam Kalyana Mandapam',
                        style: GoogleFonts.cinzelDecorative(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryMaroon,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'State Highway 45, Thadikkarankonam, Kanyakumari District, Tamil Nadu 629851 (Google Plus Code: 8CG9+373)',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 16,
                height: 1.5,
                color: AppColors.textDarkBrown,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.borderGold, width: 1.2),
                gradient: LinearGradient(
                  colors: [
                    AppColors.surfaceCream,
                    AppColors.backgroundIvory,
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map_outlined, size: 44, color: AppColors.antiqueGold),
                      const SizedBox(height: 8),
                      Text(
                        'Thadikkarankonam, Kanyakumari',
                        style: GoogleFonts.cinzel(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryMaroon,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Google Plus Code: 8CG9+373',
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.antiqueGoldDark,
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () => UrlHelper.openUrl(config.primaryGoogleMapsUrl),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => UrlHelper.openUrl(config.primaryGoogleMapsUrl),
                icon: Icon(Icons.directions, size: 18),
                label: Text(
                  'NAVIGATE TO MARRIAGE VENUE',
                  style: GoogleFonts.cinzel(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceptionVenueCard(BuildContext context) {
    const receptionMapsUrl =
        'https://www.google.com/maps/dir/?api=1&destination=Kalakad+Periya+Street+Tamil+Nadu';

    return FadeSlideEntrance(
      delay: const Duration(milliseconds: 150),
      child: LuxuryCardFrame(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryMaroon,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.celebration, color: AppColors.antiqueGoldLight, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RECEPTION DESTINATION',
                        style: GoogleFonts.cinzel(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: AppColors.antiqueGoldDark,
                        ),
                      ),
                      Text(
                        'Periya Street, Kalakad',
                        style: GoogleFonts.cinzelDecorative(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryMaroon,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Periya Street, Kalakad, Tirunelveli District, Tamil Nadu (Evening 7:00 PM Reception)',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 16,
                height: 1.5,
                color: AppColors.textDarkBrown,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.borderGold, width: 1.2),
                gradient: LinearGradient(
                  colors: [
                    AppColors.surfaceCream,
                    AppColors.backgroundIvory,
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined, size: 44, color: AppColors.antiqueGold),
                      const SizedBox(height: 8),
                      Text(
                        'Periya Street, Kalakad',
                        style: GoogleFonts.cinzel(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryMaroon,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tirunelveli District, Tamil Nadu',
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.antiqueGoldDark,
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () => UrlHelper.openUrl(receptionMapsUrl),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => UrlHelper.openUrl(receptionMapsUrl),
                icon: Icon(Icons.directions, size: 18),
                label: Text(
                  'NAVIGATE TO RECEPTION VENUE',
                  style: GoogleFonts.cinzel(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
