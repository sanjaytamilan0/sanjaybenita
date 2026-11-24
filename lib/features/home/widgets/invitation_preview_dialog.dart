import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/wedding_config_model.dart';
import '../../../data/services/pdf_invitation_service.dart';
import '../../home/viewmodels/language_viewmodel.dart';

class InvitationPreviewDialog extends ConsumerStatefulWidget {
  final WeddingConfig config;

  const InvitationPreviewDialog({
    super.key,
    required this.config,
  });

  static Future<void> show(BuildContext context, WeddingConfig config) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => InvitationPreviewDialog(config: config),
    );
  }

  @override
  ConsumerState<InvitationPreviewDialog> createState() =>
      _InvitationPreviewDialogState();
}

class _InvitationPreviewDialogState
    extends ConsumerState<InvitationPreviewDialog> {
  bool _isDownloading = false;

  void _handleDownload() async {
    setState(() => _isDownloading = true);
    final messenger = ScaffoldMessenger.of(context);
    try {
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            'Downloading high-quality wedding invitation PDF...',
            style: GoogleFonts.cormorantGaramond(fontSize: 16),
          ),
          backgroundColor: AppColors.primaryMaroon,
          duration: const Duration(seconds: 2),
        ),
      );
      await PdfInvitationService.downloadInvitationPdf(widget.config);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(
            content: Text('Could not download PDF: $e'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isDownloading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final currentLang = ref.watch(languageProvider);
    final isTamil = currentLang == AppLanguage.tamil;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 32,
        vertical: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 580,
            maxHeight: MediaQuery.of(context).size.height * 0.92,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceCream,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
              border: Border.all(
                color: AppColors.antiqueGold,
                width: 2.5,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Header Bar
                _buildHeaderBar(isTamil),

                // Invitation Card Preview Area with Couple Background
                Flexible(
                  child: SingleChildScrollView(
                    child: _buildInvitationCard(context, isMobile, isTamil),
                  ),
                ),

                // Bottom Action Buttons
                _buildBottomBar(isTamil),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderBar(bool isTamil) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.primaryMaroon,
        border: Border(
          bottom: BorderSide(
            color: AppColors.antiqueGold.withValues(alpha: 0.6),
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.mark_email_read_outlined,
                  color: AppColors.antiqueGold, size: 22),
              const SizedBox(width: 10),
              Text(
                isTamil ? 'அழைப்பிதழ் முன்னோட்டம்' : 'INVITATION PREVIEW',
                style: GoogleFonts.cinzel(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close_rounded, color: Colors.white70),
            tooltip: 'Close',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildInvitationCard(
      BuildContext context, bool isMobile, bool isTamil) {
    final titleStyle = isTamil
        ? GoogleFonts.notoSerifTamil(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryMaroon,
          )
        : GoogleFonts.cinzelDecorative(
            fontSize: isMobile ? 26 : 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryMaroon,
          );

    final bodyStyle = isTamil
        ? GoogleFonts.notoSerifTamil(
            fontSize: isMobile ? 14 : 16,
            height: 1.7,
            color: AppColors.textDarkBrown,
          )
        : GoogleFonts.cormorantGaramond(
            fontSize: isMobile ? 16 : 18,
            height: 1.7,
            color: AppColors.textDarkBrown,
          );

    return Container(
      margin: EdgeInsets.all(isMobile ? 12 : 20),
      decoration: BoxDecoration(
        color: AppColors.surfaceCream,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.antiqueGold,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background Image of Couple (Bride and Groom) with clean luxury tint
          Positioned.fill(
            child: Image.asset(
              'assets/images/couple.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.surfaceCream,
              ),
            ),
          ),

          // Semi-transparent luxury ivory parchment overlay so text is crisp and readable
          Positioned.fill(
            child: Container(
              color: Colors.white.withValues(alpha: 0.82),
            ),
          ),

          // Luxury Inner Decorative Gold Border
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.antiqueGold.withValues(alpha: 0.7),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          // Content overlay
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 28,
              vertical: 24,
            ),
            child: Column(
              children: [
                // In God's Grace
                Text(
                  '~ IN GOD’S GRACE & LOVE ~',
                  style: GoogleFonts.cinzel(
                    fontSize: isMobile ? 11 : 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: AppColors.antiqueGoldDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '“What God has joined together, let no one separate.”  — Mark 10:9',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: isMobile ? 12 : 13,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textMutedBrown,
                  ),
                ),
                const SizedBox(height: 16),

                // Couple portrait round avatar in card
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.antiqueGold, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryMaroon.withValues(alpha: 0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/images/couple.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                const SizedBox(height: 14),

                // Invitation Title
                Text(
                  widget.config.invitationTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cinzel(
                    fontSize: isMobile ? 13 : 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                    color: AppColors.primaryMaroon,
                  ),
                ),
                const SizedBox(height: 10),

                // Names
                Text(
                  '${widget.config.groomName}  &  ${widget.config.brideName}',
                  textAlign: TextAlign.center,
                  style: titleStyle,
                ),
                const SizedBox(height: 6),
                Text(
                  '“${widget.config.invitationSubtitle}”',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: isMobile ? 13 : 15,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textMutedBrown,
                  ),
                ),
                const SizedBox(height: 14),

                // Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 1, width: 60, color: AppColors.antiqueGold),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.favorite,
                          size: 14, color: AppColors.antiqueGold),
                    ),
                    Container(height: 1, width: 60, color: AppColors.antiqueGold),
                  ],
                ),
                const SizedBox(height: 16),

                // Invitation Message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.config.invitationMessage,
                    textAlign: TextAlign.center,
                    style: bodyStyle,
                  ),
                ),
                const SizedBox(height: 20),

                // Events Highlights
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceCream.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.antiqueGold.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        isTamil ? 'திருமண நிகழ்வுகள்' : 'WEDDING ITINERARY',
                        style: GoogleFonts.cinzel(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: AppColors.primaryMaroon,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...widget.config.events.map(
                        (event) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  event.name,
                                  style: GoogleFonts.cormorantGaramond(
                                    fontSize: isMobile ? 14 : 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryMaroon,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  event.timeDisplay,
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.cormorantGaramond(
                                    fontSize: isMobile ? 12 : 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.antiqueGoldDark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                Text(
                  isTamil
                      ? 'அன்புடன் அழைக்கும் சஞ்சய் & பெனிட்டா'
                      : 'Warmly Invited by Sanjay & Benita',
                  textAlign: TextAlign.center,
                  style: isTamil
                      ? GoogleFonts.notoSerifTamil(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryMaroon,
                        )
                      : GoogleFonts.cinzel(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryMaroon,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(bool isTamil) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceCream,
        border: Border(
          top: BorderSide(
            color: AppColors.antiqueGold.withValues(alpha: 0.4),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryMaroon,
                side: BorderSide(color: AppColors.primaryMaroon),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                isTamil ? 'மூடு' : 'Close',
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: _isDownloading ? null : _handleDownload,
              icon: _isDownloading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Icon(Icons.picture_as_pdf_rounded,
                      color: Colors.white, size: 20),
              label: Text(
                _isDownloading
                    ? (isTamil ? 'தயாராகிறது...' : 'Generating...')
                    : (isTamil ? 'அழைப்பிதழ் பதிவிறக்கு' : 'Download Invitation PDF'),
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryMaroon,
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
