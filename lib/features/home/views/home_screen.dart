import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanjay_and_benita/core/theme/app_colors.dart';
import 'package:sanjay_and_benita/core/utils/url_helper.dart';
import 'package:sanjay_and_benita/data/models/wedding_config_model.dart';
import 'package:sanjay_and_benita/data/repositories/wedding_config_repository.dart';
import 'package:sanjay_and_benita/data/services/pdf_invitation_service.dart';
import 'package:sanjay_and_benita/features/couple/views/couple_section.dart';
import 'package:sanjay_and_benita/features/love_story/views/love_story_section.dart';
import 'package:sanjay_and_benita/features/events/views/events_section.dart';
import 'package:sanjay_and_benita/features/gallery/views/gallery_section.dart';
import 'package:sanjay_and_benita/features/contact/views/contact_location_section.dart';
import 'package:sanjay_and_benita/features/home/widgets/wedding_nav_bar.dart';
import 'package:sanjay_and_benita/features/home/widgets/hero_section.dart';
import 'package:sanjay_and_benita/features/home/widgets/invitation_message_section.dart';
import 'package:sanjay_and_benita/features/home/widgets/footer_section.dart';
import 'package:sanjay_and_benita/features/home/viewmodels/theme_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final WeddingConfig config = WeddingConfigRepository.data;

  // Global Keys for smooth scrolling navigation
  final GlobalKey _invitationKey = GlobalKey();
  final GlobalKey _coupleKey = GlobalKey();
  final GlobalKey _storyKey = GlobalKey();
  final GlobalKey _eventsKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _locationKey = GlobalKey();

  void _scrollToSection(int index) {
    GlobalKey targetKey;
    switch (index) {
      case 0:
        targetKey = _invitationKey;
        break;
      case 1:
        targetKey = _coupleKey;
        break;
      case 2:
        targetKey = _storyKey;
        break;
      case 3:
        targetKey = _eventsKey;
        break;
      case 4:
        targetKey = _galleryKey;
        break;
      case 5:
      default:
        targetKey = _locationKey;
        break;
    }

    final sectionContext = targetKey.currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _downloadPdf() async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            'Preparing your personalized wedding invitation PDF...',
            style: GoogleFonts.cormorantGaramond(fontSize: 16),
          ),
          backgroundColor: AppColors.primaryMaroon,
          duration: const Duration(seconds: 2),
        ),
      );
      await PdfInvitationService.downloadInvitationPdf(config);
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('Could not generate PDF: $e'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _shareWhatsApp() {
    final currentUrl = Uri.base.toString();
    final message = '${config.whatsappShareMessage}\n$currentUrl';
    UrlHelper.openWhatsApp(phoneOrEmpty: '', message: message);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch theme changes to trigger full UI rebuild
    ref.watch(weddingThemeStateProvider);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 70),
                HeroSection(
                  config: config,
                  onExploreClick: () => _scrollToSection(0),
                ),
                Container(
                  key: _invitationKey,
                  child: InvitationMessageSection(config: config),
                ),
                Container(
                  key: _coupleKey,
                  child: CoupleSection(config: config),
                ),
                Container(
                  key: _storyKey,
                  child: LoveStorySection(milestones: config.loveStory),
                ),
                Container(
                  key: _eventsKey,
                  child: EventsSection(events: config.events),
                ),
                Container(
                  key: _galleryKey,
                  child: GallerySection(items: config.gallery),
                ),
                Container(
                  key: _locationKey,
                  child: ContactLocationSection(config: config),
                ),
                FooterSection(
                  config: config,
                  onNavigateToSection: _scrollToSection,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: WeddingNavBar(
              config: config,
              onNavigate: _scrollToSection,
              onDownloadPdf: _downloadPdf,
              onShareWhatsApp: _shareWhatsApp,
            ),
          ),
        ],
      ),
    );
  }
}
