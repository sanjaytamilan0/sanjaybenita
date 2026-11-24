import '../models/wedding_config_model.dart';
import '../../features/home/viewmodels/language_viewmodel.dart';

class WeddingConfigRepository {
  static WeddingConfig getConfig(AppLanguage lang) {
    if (lang == AppLanguage.tamil) {
      return tamilData;
    }
    return englishData;
  }

  static WeddingConfig get data => englishData;

  // ENGLISH DATA
  static final WeddingConfig englishData = WeddingConfig(
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
        'We joyfully invite you to celebrate the beginning of our beautiful journey together.\n\nYour presence, prayers, and blessings will make our special day even more memorable.',
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
        name: 'Holy Matrimony',
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
        name: 'Wedding Reception',
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
    contacts: [],
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

  // TAMIL DATA (தமிழ் பதிப்பு)
  static final WeddingConfig tamilData = WeddingConfig(
    groomName: 'சஞ்சய்',
    groomFullName: 'சஞ்சய்',
    groomTitle: 'மணமகன்',
    groomBio:
        'அன்பையும் பாசத்தையும் இதயத்தில் ஏந்தி, பெனிட்டாவுடன் தன் இனிய வாழ்க்கைப் பயணத்தைத் தொடங்கத் தயாராக இருக்கும் அன்பான மணமகன்.',
    groomParents: '',
    brideName: 'பெனிட்டா',
    brideFullName: 'பெனிட்டா',
    brideTitle: 'மணமகள்',
    brideBio:
        'அன்பும் அமைதியும் முகத்தில் தவழ, இனிமையான புன்னகையுடன் இல்லற வாழ்வில் அடியெடுத்து வைத்து சஞ்சயுடன் இணையும் அழகிய மணமகள்.',
    brideParents: '',
    invitationTitle: 'திருமணப் பெருவிழா அழைப்பிதழ்',
    invitationSubtitle: 'இரு மனங்கள் இணையும் புனிதமான இனிய இல்லற தொடக்கம்.',
    invitationMessage:
        'இறைவனின் திருவருளோடும், எங்கள் குடும்பத்தாரின் ஆசிகளோடும் நாங்கள் இல்லற வாழ்வில் இணையும் நன்னாளில், தங்களை அன்போடு அழைக்கின்றோம்.\n\nதாங்கள் வருகை தந்து எங்களை ஆசீர்வதிக்குமாறு அன்புடன் வேண்டுகிறோம்.',
    familyInvitationMessage:
        'அன்புடன் அழைக்கும்,\nசஞ்சய் & பெனிட்டா',
    mainWeddingDate: DateTime(2027, 4, 26, 10, 30),
    events: [
      WeddingEvent(
        id: 'engagement',
        name: 'நிச்சயதார்த்தம் (Engagement)',
        dateTime: DateTime(2027, 4, 25, 17, 30),
        timeDisplay: 'மாலை 5:30 மணி முதல்',
        venue: 'கிராண்ட் ராயல் பேங்க்வட் ஹால்',
        address: 'மாநில நெடுஞ்சாலை 45, தடிக்காரன்கோணம், கன்னியாகுமரி மாவட்டம், தமிழ்நாடு 629851 (Plus Code: 8CG9+373)',
        googleMapsUrl: 'https://www.google.com/maps/search/?api=1&query=8CG9%2B373+Thadikkarankonam+Tamil+Nadu',
        iconName: 'ring',
        description: 'மோதிரம் மாற்றும் வைபவம் மற்றும் இன்னிசை இரவு விருந்து கொண்டாட்டம்.',
      ),
      WeddingEvent(
        id: 'wedding_ceremony',
        name: 'திருமண நல்வைபவம் (Holy Matrimony)',
        dateTime: DateTime(2027, 4, 26, 10, 30),
        timeDisplay: 'காலை 10:30 மணி',
        venue: 'தடிக்காரன்கோணம் திருச்சபை / திருமண மண்டபம்',
        address: 'மாநில நெடுஞ்சாலை 45, தடிக்காரன்கோணம், கன்னியாகுமரி மாவட்டம், தமிழ்நாடு 629851 (Google Plus Code: 8CG9+373)',
        googleMapsUrl: 'https://www.google.com/maps/search/?api=1&query=8CG9%2B373+Thadikkarankonam+Tamil+Nadu',
        iconName: 'church',
        description: 'இறைவனின் திருமுன்னிலையில் நடைபெறும் புனிதமான திருமண நல்வைபவம்.',
      ),
      WeddingEvent(
        id: 'reception',
        name: 'வரவேற்பு நிகழ்ச்சி (Reception)',
        dateTime: DateTime(2027, 4, 26, 19, 0),
        timeDisplay: 'மாலை 7:00 மணி முதல்',
        venue: 'பெரிய தெரு மண்டபம் / வரவேற்பு திடல்',
        address: 'பெரிய தெரு, களக்காடு, திருநெல்வேலி மாவட்டம், தமிழ்நாடு',
        googleMapsUrl:
            'https://www.google.com/maps/dir/?api=1&destination=Kalakad+Periya+Street+Tamil+Nadu',
        iconName: 'celebration',
        description: 'மணமக்களை வாழ்த்தி மகிழும் கண்கவர் திருமண வரவேற்பு மற்றும் இரவு விருந்து.',
      ),
    ],
    loveStory: [
      const LoveStoryMilestone(
        title: 'முதல் சந்திப்பு',
        date: 'நவம்பர் 9',
        description:
            'இரு இதயங்களும் முதன்முதலில் சந்தித்து, இனிமையான அன்பின் தொடக்கத்தை உணர்ந்த நன்நாள்.',
        iconName: 'coffee',
      ),
      const LoveStoryMilestone(
        title: 'பூ வைத்தல் விழா',
        date: 'நவம்பர் 15',
        description:
            'மங்கல மலர்கள் சூடி, குடும்பத்தாரின் ஆசிகளோடு நடைபெற்ற மங்களகரமான பூ வைத்தல் விழா.',
        iconName: 'flower',
      ),
      const LoveStoryMilestone(
        title: 'இனிய தருணங்கள்',
        date: 'அழகிய நினைவுகள்',
        description:
            'அன்பும் புன்னகையும் கலந்த இனிய உரையாடல்கள் நிறைந்த அழகிய வாழ்க்கை பயணம்.',
        iconName: 'heart',
      ),
      const LoveStoryMilestone(
        title: 'என்றும் இணைந்திருக்க',
        date: 'ஏப்ரல் 26, 2027',
        description:
            'வாழ்நாள் முழுவதும் இணைபிரியா அன்புடன் கைக்கோர்த்து பயணிக்கும் புதிய விடியல்.',
        iconName: 'infinity',
      ),
    ],
    gallery: [
      const GalleryItem(
        id: 'g1',
        title: 'பூ வைத்தல் விழா',
        caption: 'குடும்பத்தாரின் ஆசிகளுடன் நடைபெற்ற இனிய மங்கல விழா.',
        category: 'சடங்குகள்',
        assetPath: 'assets/images/flower_ceremony.jpg',
        fallbackGradientKey: 'gold_maroon',
      ),
      const GalleryItem(
        id: 'g2',
        title: 'குடும்பத்தோடு மகிழ்ச்சி',
        caption: 'குழந்தைகளுடன் கூடி மகிழ்ந்த இனிய தருணங்கள்.',
        category: 'கொண்டாட்டம்',
        assetPath: 'assets/images/ceremony_family_1.jpg',
        fallbackGradientKey: 'rose_gold',
      ),
      const GalleryItem(
        id: 'g3',
        title: 'பெரியோரின் ஆசிகள்',
        caption: 'பாரம்பரிய முறைப்படி நடைபெற்ற மங்களகரமான நிகழ்வு.',
        category: 'பாரம்பரியம்',
        assetPath: 'assets/images/ceremony_family_2.jpg',
        fallbackGradientKey: 'warm_sunset',
      ),
      const GalleryItem(
        id: 'g4',
        title: 'உறவுகளுடன் ஆனந்தம்',
        caption: 'அனைவரும் ஒன்றிணைந்து வாழ்த்திய மறக்க முடியாத நாள்.',
        category: 'நினைவுகள்',
        assetPath: 'assets/images/ceremony_family_3.jpg',
        fallbackGradientKey: 'champagne',
      ),
      const GalleryItem(
        id: 'g5',
        title: 'சஞ்சய் & பெனிட்டா',
        caption: 'இரு இதயங்களின் எல்லையற்ற ஆனந்த சங்கமம்.',
        category: 'மணமக்கள்',
        assetPath: 'assets/images/couple.jpg',
        fallbackGradientKey: 'royal_gold',
      ),
      const GalleryItem(
        id: 'g6',
        title: 'அழகிய மணமகள்',
        caption: 'பட்டுச் சேலையில் புன்னகை பூக்கும் அழகிய பெனிட்டா.',
        category: 'மணமகள்',
        assetPath: 'assets/images/bride.jpg',
        fallbackGradientKey: 'deep_maroon',
      ),
      const GalleryItem(
        id: 'g7',
        title: 'அன்பு மணமகன்',
        caption: 'வாழ்க்கைப் பயணத்தைத் தொடங்கும் கம்பீரமான சஞ்சய்.',
        category: 'மணமகன்',
        assetPath: 'assets/images/groom.jpg',
        fallbackGradientKey: 'champagne',
      ),
      const GalleryItem(
        id: 'g8',
        title: 'என்றும் இணைந்தே',
        caption: 'புதிய விடியலை நோக்கி கைக்கோர்த்து செல்லும் அன்பு ஜோடி.',
        category: 'என்றென்றும்',
        assetPath: 'assets/images/couple.jpg',
        fallbackGradientKey: 'gold_maroon',
      ),
    ],
    contacts: [],
    musicAssetPath: 'assets/audio/wedding_instrumental.mp3',
    primaryVenueAddress:
        'மாநில நெடுஞ்சாலை 45, தடிக்காரன்கோணம், கன்னியாகுமரி மாவட்டம், தமிழ்நாடு 629851 (Google Plus Code: 8CG9+373)',
    primaryGoogleMapsUrl:
        'https://www.google.com/maps/search/?api=1&query=8CG9%2B373+Thadikkarankonam+Tamil+Nadu',
    whatsappShareMessage:
        '✨ சஞ்சய் ❤️ பெனிட்டா திருமண அழைப்பிதழ் ✨\n\n'
        'சஞ்சய் மற்றும் பெனிட்டா இணையும் திருமண விழாவிற்கு தங்களை அன்போடு அழைக்கின்றோம்!\n\n'
        '💍 நிச்சயதார்த்தம்: ஏப்ரல் 25, 2027 (மாலை 5:30)\n'
        '💒 திருமண நல்வைபவம்: ஏப்ரல் 26, 2027 (காலை 10:30)\n'
        '🎉 திருமண வரவேற்பு: ஏப்ரல் 26, 2027 (மாலை 7:00, பெரிய தெரு, களக்காடு)\n\n'
        '📍 திருமண இடம்: தடிக்காரன்கோணம், கன்னியாகுமரி மாவட்டம், தமிழ்நாடு 629851\n'
        '📍 வரவேற்பு இடம்: பெரிய தெரு, களக்காடு, தமிழ்நாடு\n\n'
        'எங்கள் திருமண டிஜிட்டல் அழைப்பிதழைக் காணவும் விவரங்களை அறியவும் வருகை தாருங்கள்:\n',
  );
}
