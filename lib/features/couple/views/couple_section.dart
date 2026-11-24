import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/wedding_config_model.dart';
import '../../../shared/animations/entrance_animations.dart';
import '../../../shared/widgets/section_header.dart';

class CoupleSection extends StatelessWidget {
  final WeddingConfig config;

  const CoupleSection({
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
                title: 'THE HAPPY COUPLE',
                subtitle: 'Two souls joined together by love and destined for eternity',
              ),
              if (isMobile)
                Column(
                  children: [
                    _buildProfileCard(
                      context,
                      name: config.groomName,
                      fullName: config.groomFullName,
                      title: config.groomTitle,
                      bio: config.groomBio,
                      imageAssetPath: 'assets/images/groom.jpg',
                      imageUrl:
                          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=600&q=80',
                      isGroom: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: _buildConnectingHeart(),
                    ),
                    _buildProfileCard(
                      context,
                      name: config.brideName,
                      fullName: config.brideFullName,
                      title: config.brideTitle,
                      bio: config.brideBio,
                      imageAssetPath: 'assets/images/bride.jpg',
                      imageUrl:
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=600&q=80',
                      isGroom: false,
                    ),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildProfileCard(
                        context,
                        name: config.groomName,
                        fullName: config.groomFullName,
                        title: config.groomTitle,
                        bio: config.groomBio,
                        imageAssetPath: 'assets/images/groom.jpg',
                        imageUrl:
                            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=600&q=80',
                        isGroom: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildConnectingHeart(),
                    ),
                    Expanded(
                      child: _buildProfileCard(
                        context,
                        name: config.brideName,
                        fullName: config.brideFullName,
                        title: config.brideTitle,
                        bio: config.brideBio,
                        imageAssetPath: 'assets/images/bride.jpg',
                        imageUrl:
                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=600&q=80',
                        isGroom: false,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectingHeart() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 2,
          height: 30,
          color: AppColors.antiqueGold.withValues(alpha: 0.6),
        ),
        GentlePulse(
          scaleDelta: 0.25,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryMaroon,
              border: Border.all(color: AppColors.antiqueGold, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.antiqueGold.withValues(alpha: 0.4),
                  blurRadius: 16,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(Icons.favorite, color: AppColors.antiqueGoldLight,
              size: 26,
            ),
          ),
        ),
        Container(
          width: 2,
          height: 30,
          color: AppColors.antiqueGold.withValues(alpha: 0.6),
        ),
      ],
    );
  }

  Widget _buildProfileCard(
    BuildContext context, {
    required String name,
    required String fullName,
    required String title,
    required String bio,
    String? imageAssetPath,
    required String imageUrl,
    required bool isGroom,
  }) {
    return LuxuryCardFrame(
      backgroundColor: Colors.white.withValues(alpha: 0.95),
      padding: const EdgeInsets.all(28),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [AppColors.antiqueGoldLight, AppColors.antiqueGoldDark],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.antiqueGold.withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
              ),
              Container(
                width: 178,
                height: 178,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              ClipOval(
                child: SizedBox(
                  width: 170,
                  height: 170,
                  child: imageAssetPath != null
                      ? Image.asset(
                          imageAssetPath,
                          fit: BoxFit.cover,
                          alignment: isGroom ? const Alignment(0.0, -0.4) : const Alignment(0.0, -0.3),
                          errorBuilder: (context, error, stackTrace) => Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: AppColors.surfaceCream,
                              child: Icon(
                                isGroom ? Icons.person : Icons.face,
                                size: 70,
                                color: AppColors.antiqueGoldDark,
                              ),
                            ),
                          ),
                        )
                      : Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.antiqueGold,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: AppColors.surfaceCream,
                            child: Icon(
                              isGroom ? Icons.person : Icons.face,
                              size: 70,
                              color: AppColors.antiqueGoldDark,
                            ),
                          ),
                        ),
                ),
              ),
              Positioned(
                bottom: -6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryMaroon,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.antiqueGold, width: 1),
                  ),
                  child: Text(
                    title.toUpperCase(),
                    style: GoogleFonts.cinzel(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: AppColors.antiqueGoldLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: GoogleFonts.cinzelDecorative(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryMaroon,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            height: 1,
            width: 100,
            color: AppColors.borderGold,
          ),
          const SizedBox(height: 14),
          Text(
            bio,
            textAlign: TextAlign.center,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 16,
              height: 1.6,
              color: AppColors.textDarkBrown,
            ),
          ),
        ],
      ),
    );
  }
}
