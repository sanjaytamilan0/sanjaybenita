import '../models/wedding_config_model.dart';

class WeddingConfigRepository {
  static final WeddingConfig data = WeddingConfig(
    groomName: 'SANJAY',
    groomFullName: 'Sanjay',
    groomTitle: 'The Groom',
    groomBio:
        'A passionate soul with an eye for adventure and a heart anchored in love. Ready to embark on life’s most cherished journey with Benita.',
    groomParents: '',
    brideName: 'BENITA',
    brideFullName: 'Benita',
    brideTitle: 'The Bride',
    brideBio:
        'Graceful, radiant, and full of warmth. Benita brings vibrant joy and melody into every day, finding her eternal partner in Sanjay.',
    brideParents: '',
    invitationTitle: 'THE WEDDING CELEBRATION',
    invitationSubtitle: 'Two hearts, one beautiful journey, forever together.',
    invitationMessage:
        'We joyfully invite you to celebrate the beginning of our beautiful journey together.\n\nYour presence and blessings will make our special day even more memorable.',
    familyInvitationMessage:
        'With love and warm regards,\nSanjay & Benita',
    mainWeddingDate: DateTime(2027, 4, 26, 10, 30),
    events: [
      WeddingEvent(
        id: 'engagement',
        name: 'Engagement',
        dateTime: DateTime(2027, 4, 25, 17, 30),
        timeDisplay: '5:30 PM onwards',
        venue: 'Grand Royal Banquet Hall',
        address: 'State Highway 45, Thadikkarankonam, Kanyakumari District, Tamil Nadu 629851 (Plus Code: 8CG9+373)',
        googleMapsUrl: 'https://www.google.com/maps/search/?api=1&query=8CG9%2B373+Thadikkarankonam+Tamil+Nadu',
        iconName: 'ring',
        description: 'Ring exchange ceremony followed by an evening of music, dinner, and celebration.',
      ),
      WeddingEvent(
        id: 'wedding_ceremony',
        name: 'Wedding Ceremony',
        dateTime: DateTime(2027, 4, 26, 10, 30),
        timeDisplay: '10:30 AM – Holy Matrimony',
        venue: 'Thadikkarankonam Church / Kalyana Mandapam',
        address: 'State Highway 45, Thadikkarankonam, Kanyakumari District, Tamil Nadu 629851 (Google Plus Code: 8CG9+373)',
        googleMapsUrl: 'https://www.google.com/maps/search/?api=1&query=8CG9%2B373+Thadikkarankonam+Tamil+Nadu',
        iconName: 'church',
        description: 'Sacred holy matrimony solemnized with eternal vows and divine heavenly blessings.',
      ),
      WeddingEvent(
        id: 'reception',
        name: 'Reception',
        dateTime: DateTime(2027, 4, 26, 19, 0),
        timeDisplay: 'Evening 7:00 PM onwards',
        venue: 'Periya Street Hall / Reception Ground',
        address: 'Periya Street, Kalakad, Tirunelveli District, Tamil Nadu',
        googleMapsUrl:
            'https://www.google.com/maps/dir/?api=1&destination=Kalakad+Periya+Street+Tamil+Nadu',
        iconName: 'celebration',
        description: 'An elegant grand evening dinner, felicitations, and joyous toast to the newly wedded couple.',
      ),
    ],
    loveStory: [
      const LoveStoryMilestone(
        title: 'First Meeting',
        date: 'November 9',
        description:
            'The serendipitous moment our eyes first met. What began as a simple hello blossomed into an everlasting connection.',
        iconName: 'coffee',
      ),
      const LoveStoryMilestone(
        title: 'Poo Vaithal (Flower Ceremony)',
        date: 'November 15',
        description:
            'The auspicious traditional flower putting ceremony where our commitment was solemnized with fragrant blooms and radiant joy.',
        iconName: 'flower',
      ),
      const LoveStoryMilestone(
        title: 'Special Moments',
        date: 'Our Beautiful Journey',
        description:
            'Cherished memories, laughter-filled conversations, and discovering that life is so much sweeter together.',
        iconName: 'heart',
      ),
      const LoveStoryMilestone(
        title: 'Forever Together',
        date: 'April 26, 2027',
        description:
            'Stepping hand in hand into eternity, surrounded by warmth, unconditional love, and sacred blessings.',
        iconName: 'infinity',
      ),
    ],
    gallery: [
      const GalleryItem(
        id: 'g1',
        title: 'Poo Vaithal Ceremony',
        caption: 'Sacred flower putting ceremony filled with divine blessings and family warmth.',
        category: 'Rituals',
        assetPath: 'assets/images/flower_ceremony.jpg',
        fallbackGradientKey: 'gold_maroon',
      ),
      const GalleryItem(
        id: 'g2',
        title: 'Joyous Family Moments',
        caption: 'Together in pink and smiles with the lovely little ones.',
        category: 'Celebration',
        assetPath: 'assets/images/ceremony_family_1.jpg',
        fallbackGradientKey: 'rose_gold',
      ),
      const GalleryItem(
        id: 'g3',
        title: 'Cherished Blessings',
        caption: 'Auspicious celebrations, loving smiles, and precious traditions.',
        category: 'Heritage',
        assetPath: 'assets/images/ceremony_family_2.jpg',
        fallbackGradientKey: 'warm_sunset',
      ),
      const GalleryItem(
        id: 'g4',
        title: 'With Loved Ones',
        caption: 'Surrounded by heartfelt smiles, vibrant attire, and blessings.',
        category: 'Moments',
        assetPath: 'assets/images/ceremony_family_3.jpg',
        fallbackGradientKey: 'champagne',
      ),
      const GalleryItem(
        id: 'g5',
        title: 'Sanjay & Benita',
        caption: 'A moment of boundless joy and eternal togetherness.',
        category: 'The Couple',
        assetPath: 'assets/images/couple.jpg',
        fallbackGradientKey: 'royal_gold',
      ),
      const GalleryItem(
        id: 'g6',
        title: 'Radiant Bride',
        caption: 'Benita in traditional auspicious pink and golden silk.',
        category: 'Bride',
        assetPath: 'assets/images/bride.jpg',
        fallbackGradientKey: 'deep_maroon',
      ),
      const GalleryItem(
        id: 'g7',
        title: 'The Groom',
        caption: 'Sanjay ready to embark on life’s greatest journey.',
        category: 'Groom',
        assetPath: 'assets/images/groom.jpg',
        fallbackGradientKey: 'champagne',
      ),
      const GalleryItem(
        id: 'g8',
        title: 'Forever In Love',
        caption: 'Hand in hand, stepping gracefully into our beautiful tomorrow.',
        category: 'Together',
        assetPath: 'assets/images/couple.jpg',
        fallbackGradientKey: 'gold_maroon',
      ),
    ],
    contacts: [
      const ContactPerson(
        role: 'Wedding Coordinator',
        name: 'Event Helpdesk & Hospitality',
        phone: '+919876543210',
        relation: 'Travel & Venue Guidance',
      ),
      const ContactPerson(
        role: 'Guest Concierge',
        name: 'Guest Inquiries & Assistance',
        phone: '+919876543211',
        relation: 'Accommodation & Reception Help',
      ),
    ],
    musicAssetPath: 'assets/audio/wedding_instrumental.mp3',
    primaryVenueAddress:
        'State Highway 45, Thadikkarankonam, Kanyakumari District, Tamil Nadu 629851 (Google Plus Code: 8CG9+373)',
    primaryGoogleMapsUrl:
        'https://www.google.com/maps/search/?api=1&query=8CG9%2B373+Thadikkarankonam+Tamil+Nadu',
    whatsappShareMessage:
        '✨ SANJAY ❤️ BENITA WEDDING INVITATION ✨\n\n'
        'We cordially invite you to celebrate the joyous wedding of Sanjay and Benita!\n\n'
        '💍 Engagement: April 25, 2027 (5:30 PM)\n'
        '💒 Holy Matrimony: April 26, 2027 (10:30 AM)\n'
        '🎉 Evening Reception: April 26, 2027 (Periya Street, Kalakad)\n\n'
        '📍 Marriage Venue: State Highway 45, Thadikkarankonam, Kanyakumari District, Tamil Nadu 629851 (Plus Code: 8CG9+373)\n'
        '📍 Reception Venue: Periya Street, Kalakad, Tamil Nadu\n\n'
        'Kindly visit our digital wedding invitation for all event details, directions, and gallery:\n',
  );
}
