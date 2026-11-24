class RsvpSubmission {
  final String guestName;
  final String mobileNumber;
  final int numberOfGuests;
  final bool willAttend;
  final String? personalMessage;
  final DateTime submittedAt;

  const RsvpSubmission({
    required this.guestName,
    required this.mobileNumber,
    required this.numberOfGuests,
    required this.willAttend,
    this.personalMessage,
    required this.submittedAt,
  });

  Map<String, dynamic> toJson() => {
    'guestName': guestName,
    'mobileNumber': mobileNumber,
    'numberOfGuests': numberOfGuests,
    'willAttend': willAttend,
    'personalMessage': personalMessage,
    'submittedAt': submittedAt.toIso8601String(),
  };
}

abstract class RsvpService {
  Future<bool> submitRsvp(RsvpSubmission submission);
}

class LocalRsvpService implements RsvpService {
  final List<RsvpSubmission> _submissions = [];

  List<RsvpSubmission> get submissions => List.unmodifiable(_submissions);

  @override
  Future<bool> submitRsvp(RsvpSubmission submission) async {
    // Simulate real network delay for luxury smooth UI feel
    await Future.delayed(const Duration(milliseconds: 900));
    _submissions.add(submission);
    return true;
  }
}
