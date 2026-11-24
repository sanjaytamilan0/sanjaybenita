import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanjay_and_benita/core/theme/app_colors.dart';
import 'package:sanjay_and_benita/core/utils/responsive.dart';
import 'package:sanjay_and_benita/core/utils/url_helper.dart';
import 'package:sanjay_and_benita/data/models/wedding_config_model.dart';
import 'package:sanjay_and_benita/shared/animations/entrance_animations.dart';
import 'package:sanjay_and_benita/shared/widgets/section_header.dart';

class EventsSection extends StatelessWidget {
  final List<WeddingEvent> events;

  const EventsSection({
    super.key,
    required this.events,
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
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            children: [
              const SectionHeader(
                title: 'WEDDING EVENTS',
                subtitle: 'Join us across three cherished celebrations of love and unity',
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (isMobile) {
                    return Column(
                      children: events.map((event) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _buildEventCard(context, event),
                        );
                      }).toList(),
                    );
                  }

                  // 3 cards grid or row
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: events.map((event) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: _buildEventCard(context, event),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  Widget _buildEventCard(BuildContext context, WeddingEvent event) {
    IconData iconData;
    switch (event.iconName) {
      case 'ring':
        iconData = Icons.diamond_rounded;
        break;
      case 'church':
      case 'temple':
        iconData = Icons.church_rounded;
        break;
      case 'celebration':
      default:
        iconData = Icons.celebration_rounded;
        break;
    }

    return FadeSlideEntrance(
      child: LuxuryCardFrame(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [AppColors.antiqueGoldLight, AppColors.antiqueGoldDark],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.antiqueGold.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              event.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzelDecorative(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryMaroon,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.surfaceCream,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderGold, width: 0.8),
              ),
              child: Column(
                children: [
                  Text(
                    '${event.dateTime.day} ${_monthName(event.dateTime.month)} ${event.dateTime.year}',
                    style: GoogleFonts.cinzel(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryMaroon,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    event.timeDisplay,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.antiqueGoldDark,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              event.venue,
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textDarkBrown,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              event.address,
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 14,
                height: 1.5,
                color: AppColors.textMutedBrown,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              event.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: AppColors.textDarkBrown,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => UrlHelper.openUrl(event.googleMapsUrl),
              icon: const Icon(Icons.location_on_rounded, size: 18),
              label: Text(
                'GET DIRECTIONS',
                style: GoogleFonts.cinzel(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryMaroon,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
