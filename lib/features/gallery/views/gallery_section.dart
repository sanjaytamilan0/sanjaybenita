import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanjay_and_benita/core/theme/app_colors.dart';
import 'package:sanjay_and_benita/core/utils/responsive.dart';
import 'package:sanjay_and_benita/data/models/wedding_config_model.dart';
import 'package:sanjay_and_benita/shared/animations/entrance_animations.dart';
import 'package:sanjay_and_benita/shared/widgets/section_header.dart';

class GallerySection extends StatefulWidget {
  final List<GalleryItem> items;

  const GallerySection({
    super.key,
    required this.items,
  });

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  final List<String> _stockPhotos = [
    'https://images.unsplash.com/photo-1583939003579-730e3918a45a?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1511285560929-80b456fea0bc?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1606800052052-a08af7148866?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1532712938310-34cb3982ef74?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1544077960-604201fe74bc?auto=format&fit=crop&w=800&q=80',
  ];

  void _showImagePreview(BuildContext context, int index, GalleryItem item) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(16),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800, maxHeight: 600),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundIvory,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.antiqueGold, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.antiqueGold.withValues(alpha: 0.3),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: InteractiveViewer(
                          panEnabled: true,
                          boundaryMargin: const EdgeInsets.all(20),
                          minScale: 0.8,
                          maxScale: 3.5,
                          child: item.assetPath != null
                              ? Image.asset(
                                  item.assetPath!,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    color: AppColors.surfaceCream,
                                    child: Center(
                                      child: Icon(Icons.favorite, size: 80, color: AppColors.antiqueGold),
                                    ),
                                  ),
                                )
                              : Image.network(
                                  _stockPhotos[index % _stockPhotos.length],
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    color: AppColors.surfaceCream,
                                    child: Center(
                                      child: Icon(Icons.favorite, size: 80, color: AppColors.antiqueGold),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Container(
                        color: AppColors.primaryMaroon,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cinzelDecorative(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.antiqueGoldLight,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.caption,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cormorantGaramond(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                color: AppColors.surfaceCream,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close, color: Colors.white, size: 28),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              const SectionHeader(
                title: 'CAPTURED MOMENTS',
                subtitle: 'Glimpses of love, laughter, and timeless celebrations',
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : (ResponsiveLayout.isTablet(context) ? 2 : 3),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.85,
                ),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  final photoUrl = _stockPhotos[index % _stockPhotos.length];

                  return FadeSlideEntrance(
                    delay: Duration(milliseconds: 100 * index),
                    child: _GalleryCard(
                      item: item,
                      imageUrl: photoUrl,
                      onTap: () => _showImagePreview(context, index, item),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GalleryCard extends StatefulWidget {
  final GalleryItem item;
  final String imageUrl;
  final VoidCallback onTap;

  const _GalleryCard({
    required this.item,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  State<_GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<_GalleryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(0.0, _isHovered ? -8.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? AppColors.antiqueGold : AppColors.borderGold,
              width: _isHovered ? 2.0 : 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.antiqueGold.withValues(alpha: _isHovered ? 0.35 : 0.12),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 10 : 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              widget.item.assetPath != null
                  ? Image.asset(
                      widget.item.assetPath!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.surfaceCream,
                        child: Center(
                          child: Icon(Icons.favorite, color: AppColors.antiqueGold, size: 48),
                        ),
                      ),
                    )
                  : Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.surfaceCream,
                        child: Center(
                          child: Icon(Icons.favorite, color: AppColors.antiqueGold, size: 48),
                        ),
                      ),
                    ),
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: _isHovered ? 0.8 : 0.4),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.primaryMaroon,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.antiqueGold, width: 0.8),
                      ),
                      child: Text(
                        widget.item.category.toUpperCase(),
                        style: GoogleFonts.cinzel(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: AppColors.antiqueGoldLight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.item.title,
                      style: GoogleFonts.cinzelDecorative(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.item.caption,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: AppColors.surfaceCreamLight,
                      ),
                    ),
                  ],
                ),
              ),
              if (_isHovered)
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryMaroon.withValues(alpha: 0.85),
                      border: Border.all(color: AppColors.antiqueGold, width: 1),
                    ),
                    child: Icon(Icons.zoom_in, color: AppColors.antiqueGoldLight,
                      size: 20,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
