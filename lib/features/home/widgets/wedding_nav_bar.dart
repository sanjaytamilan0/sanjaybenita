import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/wedding_config_model.dart';
import '../viewmodels/audio_viewmodel.dart';
import 'theme_selector_dialog.dart';

class WeddingNavBar extends ConsumerWidget {
  final WeddingConfig config;
  final Function(int) onNavigate;
  final VoidCallback onDownloadPdf;
  final VoidCallback onShareWhatsApp;

  const WeddingNavBar({
    super.key,
    required this.config,
    required this.onNavigate,
    required this.onDownloadPdf,
    required this.onShareWhatsApp,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final isCompact = screenWidth < 700;
    final audioState = ref.watch(audioViewModelProvider);

    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.horizontalPadding(context),
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundIvory.withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(color: AppColors.borderGold, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo / Brand
          Flexible(
            child: InkWell(
              onTap: () => onNavigate(0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite, color: AppColors.primaryMaroon, size: 20),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      '${config.groomName} ❤️ ${config.brideName}',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cinzelDecorative(
                        fontSize: isCompact ? 14 : 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryMaroon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Actions & Navigation
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isDesktop) ...[
                _buildNavItem('Couple', () => onNavigate(1)),
                _buildNavItem('Story', () => onNavigate(2)),
                _buildNavItem('Events', () => onNavigate(3)),
                _buildNavItem('Gallery', () => onNavigate(4)),
                _buildNavItem('Venue', () => onNavigate(5)),
                const SizedBox(width: 6),
              ],

              // Theme Switcher Button
              Tooltip(
                message: 'Change Wedding Theme Palette',
                child: IconButton(
                  onPressed: () => ThemeSelectorDialog.show(context),
                  icon: Icon(Icons.palette_outlined, color: AppColors.antiqueGoldDark),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.antiqueGold.withValues(alpha: 0.15),
                  ),
                ),
              ),

              // Music Toggle Button
              Tooltip(
                message: audioState.isPlaying ? 'Mute Music' : 'Play Wedding Music',
                child: IconButton(
                  onPressed: () =>
                      ref.read(audioViewModelProvider.notifier).toggleMusic(),
                  icon: Icon(
                    audioState.isPlaying
                        ? Icons.music_note_rounded
                        : Icons.music_off_rounded,
                    color: audioState.isPlaying
                        ? AppColors.primaryMaroon
                        : AppColors.textMutedBrown,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: audioState.isPlaying
                        ? AppColors.antiqueGold.withValues(alpha: 0.2)
                        : Colors.transparent,
                  ),
                ),
              ),

              // WhatsApp Share
              Tooltip(
                message: 'Share Invitation on WhatsApp',
                child: IconButton(
                  onPressed: onShareWhatsApp,
                  icon: const Icon(Icons.share_rounded, color: Colors.green),
                ),
              ),

              // PDF Download Button
              if (isDesktop)
                ElevatedButton.icon(
                  onPressed: onDownloadPdf,
                  icon: const Icon(Icons.download_rounded, size: 16),
                  label: Text(
                    'DOWNLOAD INVITATION',
                    style: GoogleFonts.cinzel(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                )
              else
                IconButton(
                  onPressed: onDownloadPdf,
                  icon: Icon(Icons.picture_as_pdf, color: AppColors.primaryMaroon),
                  tooltip: 'Download PDF',
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Text(
            title,
            style: GoogleFonts.cinzel(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textDarkBrown,
            ),
          ),
        ),
      ),
    );
  }
}
