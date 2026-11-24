import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/indian_ornaments.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isDark;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Traditional Motif
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.antiqueGold.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
            Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.antiqueGold,
                ),
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.wb_sunny_outlined,
              size: 22,
              color: AppColors.antiqueGold,
            ),
            SizedBox(width: 8),
            Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.antiqueGold,
                ),
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: 1,
              width: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.antiqueGold.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.cinzelDecorative(
            fontSize: MediaQuery.of(context).size.width < 600 ? 26 : 34,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: isDark ? AppColors.antiqueGoldLight : AppColors.primaryMaroon,
          ),
        ),
        if (subtitle != null) ...[
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.surfaceCream : AppColors.textMutedBrown,
              ),
            ),
          ),
        ],
        SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 2,
              width: 36,
              color: AppColors.antiqueGold.withValues(alpha: 0.6),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.favorite,
              size: 14,
              color: AppColors.primaryMaroon,
            ),
            SizedBox(width: 8),
            Container(
              height: 2,
              width: 36,
              color: AppColors.antiqueGold.withValues(alpha: 0.6),
            ),
          ],
        ),
        SizedBox(height: 36),
      ],
    );
  }
}

class LuxuryCardFrame extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;

  const LuxuryCardFrame({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderGold, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.antiqueGold.withValues(alpha: 0.12),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              width: 44,
              height: 44,
              child: CustomPaint(painter: IndianCornerOrnamentPainter()),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Transform.flip(
              flipX: true,
              child: SizedBox(
                width: 44,
                height: 44,
                child: CustomPaint(painter: IndianCornerOrnamentPainter()),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Transform.flip(
              flipY: true,
              child: SizedBox(
                width: 44,
                height: 44,
                child: CustomPaint(painter: IndianCornerOrnamentPainter()),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Transform.flip(
              flipX: true,
              flipY: true,
              child: SizedBox(
                width: 44,
                height: 44,
                child: CustomPaint(painter: IndianCornerOrnamentPainter()),
              ),
            ),
          ),
          Padding(
            padding: padding ?? const EdgeInsets.all(28),
            child: child,
          ),
        ],
      ),
    );
  }
}
