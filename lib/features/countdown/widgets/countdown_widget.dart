import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../viewmodels/countdown_viewmodel.dart';

class CountdownWidget extends ConsumerWidget {
  final bool isCompact;

  const CountdownWidget({
    super.key,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(countdownProvider);

    if (countdown.isCompleted) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.primaryMaroon.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.antiqueGold, width: 1.5),
        ),
        child: Text(
          '✨ The Celebration Has Begun! ✨',
          style: GoogleFonts.cinzel(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.antiqueGoldLight,
          ),
        ),
      );
    }

    final items = [
      {'label': 'DAYS', 'val': countdown.days.toString().padLeft(2, '0')},
      {'label': 'HOURS', 'val': countdown.hours.toString().padLeft(2, '0')},
      {'label': 'MINUTES', 'val': countdown.minutes.toString().padLeft(2, '0')},
      {'label': 'SECONDS', 'val': countdown.seconds.toString().padLeft(2, '0')},
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: isCompact ? 12 : 20,
      runSpacing: 12,
      children: items.map((item) {
        return _buildCountdownCard(
          context,
          value: item['val']!,
          label: item['label']!,
          isCompact: isCompact,
        );
      }).toList(),
    );
  }

  Widget _buildCountdownCard(
    BuildContext context, {
    required String value,
    required String label,
    required bool isCompact,
  }) {
    final double cardWidth = isCompact ? 72 : 92;
    final double cardHeight = isCompact ? 78 : 96;

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderGold, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: AppColors.antiqueGold.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.cinzelDecorative(
              fontSize: isCompact ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryMaroon,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.cinzel(
              fontSize: isCompact ? 10 : 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: AppColors.antiqueGoldDark,
            ),
          ),
        ],
      ),
    );
  }
}
