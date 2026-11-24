class WeddingEvent {
  final String id;
  final String name;
  final DateTime dateTime;
  final String timeDisplay;
  final String venue;
  final String address;
  final String googleMapsUrl;
  final String iconName;
  final String description;

  const WeddingEvent({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.timeDisplay,
    required this.venue,
    required this.address,
    required this.googleMapsUrl,
    required this.iconName,
    required this.description,
  });
}

class LoveStoryMilestone {
  final String title;
  final String date;
  final String description;
  final String iconName;

  const LoveStoryMilestone({
    required this.title,
    required this.date,
    required this.description,
    required this.iconName,
  });
}

class GalleryItem {
  final String id;
  final String title;
  final String caption;
  final String category;
  final String? assetPath;
  final String fallbackGradientKey;

  const GalleryItem({
    required this.id,
    required this.title,
    required this.caption,
    required this.category,
    this.assetPath,
    required this.fallbackGradientKey,
  });
}

class ContactPerson {
  final String role;
  final String name;
  final String phone;
  final String relation;

  const ContactPerson({
    required this.role,
    required this.name,
    required this.phone,
    required this.relation,
  });
}

class WeddingConfig {
  final String groomName;
  final String groomFullName;
  final String groomTitle;
  final String groomBio;
  final String groomParents;

  final String brideName;
  final String brideFullName;
  final String brideTitle;
  final String brideBio;
  final String brideParents;

  final String invitationTitle;
  final String invitationSubtitle;
  final String invitationMessage;
  final String familyInvitationMessage;

  final DateTime mainWeddingDate;
  final List<WeddingEvent> events;
  final List<LoveStoryMilestone> loveStory;
  final List<GalleryItem> gallery;
  final List<ContactPerson> contacts;

  final String musicAssetPath;
  final String primaryVenueAddress;
  final String primaryGoogleMapsUrl;
  final String whatsappShareMessage;

  const WeddingConfig({
    required this.groomName,
    required this.groomFullName,
    required this.groomTitle,
    required this.groomBio,
    required this.groomParents,
    required this.brideName,
    required this.brideFullName,
    required this.brideTitle,
    required this.brideBio,
    required this.brideParents,
    required this.invitationTitle,
    required this.invitationSubtitle,
    required this.invitationMessage,
    required this.familyInvitationMessage,
    required this.mainWeddingDate,
    required this.events,
    required this.loveStory,
    required this.gallery,
    required this.contacts,
    required this.musicAssetPath,
    required this.primaryVenueAddress,
    required this.primaryGoogleMapsUrl,
    required this.whatsappShareMessage,
  });
}
