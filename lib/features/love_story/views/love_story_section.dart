import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/wedding_config_model.dart';
import '../../../shared/animations/entrance_animations.dart';
import '../../../shared/widgets/section_header.dart';

class LoveStorySection extends StatelessWidget {
  final List<LoveStoryMilestone> milestones;

  const LoveStorySection({
    super.key,
    required this.milestones,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.surfaceCream.withValues(alpha: 0.5),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.horizontalPadding(context),
        vertical: 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              const SectionHeader(
                title: 'OUR LOVE STORY',
                subtitle: 'A sweet chronicle of how destiny brought our lives together',
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: milestones.length,
                itemBuilder: (context, index) {
                  final milestone = milestones[index];
                  final isLast = index == milestones.length - 1;

                  return FadeSlideEntrance(
                    delay: Duration(milliseconds: 150 * index),
                    child: isMobile
                        ? _buildMobileTimelineItem(milestone, isLast)
                        : _buildDesktopTimelineItem(milestone, isLast, index.isEven),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileTimelineItem(LoveStoryMilestone item, bool isLast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _buildMilestoneIcon(item.iconName),
            if (!isLast)
              Container(
                width: 2,
                height: 70,
                color: AppColors.antiqueGold.withValues(alpha: 0.6),
              ),
          ],
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _buildMilestoneCard(item),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopTimelineItem(
      LoveStoryMilestone item, bool isLast, bool isLeft) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: isLeft
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 28, right: 24),
                  child: _buildMilestoneCard(item),
                )
              : const SizedBox(),
        ),
        Column(
          children: [
            _buildMilestoneIcon(item.iconName),
            if (!isLast)
              Container(
                width: 2,
                height: 70,
                color: AppColors.antiqueGold.withValues(alpha: 0.6),
              ),
          ],
        ),
        Expanded(
          child: !isLeft
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 28, left: 24),
                  child: _buildMilestoneCard(item),
                )
              : const SizedBox(),
        ),
      ],
    );
  }

  Widget _buildMilestoneIcon(String iconName) {
    IconData icon;
    switch (iconName) {
      case 'coffee':
        icon = Icons.favorite_rounded;
        break;
      case 'flower':
        icon = Icons.local_florist_rounded;
        break;
      case 'journey':
        icon = Icons.directions_car_rounded;
        break;
      case 'heart':
        icon = Icons.favorite_rounded;
        break;
      case 'infinity':
      default:
        icon = Icons.all_inclusive_rounded;
        break;
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryMaroon,
        border: Border.all(color: AppColors.antiqueGold, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.antiqueGold.withValues(alpha: 0.3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: AppColors.antiqueGoldLight,
        size: 20,
      ),
    );
  }

  Widget _buildMilestoneCard(LoveStoryMilestone item) {
    return LuxuryCardFrame(
      backgroundColor: Colors.white.withValues(alpha: 0.95),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 6,
            children: [
              Text(
                item.title,
                style: GoogleFonts.cinzelDecorative(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryMaroon,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.surfaceCream,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderGold, width: 0.8),
                ),
                child: Text(
                  item.date,
                  style: GoogleFonts.cinzel(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.antiqueGoldDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.description,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 16,
              height: 1.5,
              color: AppColors.textDarkBrown,
            ),
          ),
        ],
      ),
    );
  }
}
