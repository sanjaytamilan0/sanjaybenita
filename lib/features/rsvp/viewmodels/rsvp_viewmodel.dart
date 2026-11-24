import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/services/rsvp_service.dart';

enum RsvpStatus { idle, loading, success, error }

class RsvpState {
  final RsvpStatus status;
  final String? errorMessage;
  final String? successMessage;

  const RsvpState({
    this.status = RsvpStatus.idle,
    this.errorMessage,
    this.successMessage,
  });

  RsvpState copyWith({
    RsvpStatus? status,
    String? errorMessage,
    String? successMessage,
  }) {
    return RsvpState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}

class RsvpViewModel extends StateNotifier<RsvpState> {
  final RsvpService _rsvpService;

  RsvpViewModel(this._rsvpService) : super(const RsvpState());

  Future<bool> submitRsvp({
    required String guestName,
    required String mobileNumber,
    required int numberOfGuests,
    required bool willAttend,
    String? personalMessage,
  }) async {
    state = state.copyWith(status: RsvpStatus.loading);

    try {
      final submission = RsvpSubmission(
        guestName: guestName,
        mobileNumber: mobileNumber,
        numberOfGuests: numberOfGuests,
        willAttend: willAttend,
        personalMessage: personalMessage,
        submittedAt: DateTime.now(),
      );

      final success = await _rsvpService.submitRsvp(submission);
      if (success) {
        state = state.copyWith(
          status: RsvpStatus.success,
          successMessage: willAttend
              ? 'Thank you, $guestName! Your attendance is confirmed. We look forward to celebrating with you!'
              : 'Thank you for letting us know, $guestName. You will be missed dearly!',
        );
        return true;
      } else {
        state = state.copyWith(
          status: RsvpStatus.error,
          errorMessage: 'Unable to submit RSVP. Please try again.',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        status: RsvpStatus.error,
        errorMessage: 'An unexpected error occurred: $e',
      );
      return false;
    }
  }

  void reset() {
    state = const RsvpState();
  }
}

final rsvpServiceProvider = Provider<RsvpService>((ref) {
  return LocalRsvpService();
});

final rsvpViewModelProvider =
    StateNotifierProvider<RsvpViewModel, RsvpState>((ref) {
  final service = ref.watch(rsvpServiceProvider);
  return RsvpViewModel(service);
});
