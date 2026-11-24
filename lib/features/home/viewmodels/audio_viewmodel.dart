import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/services/audio_service.dart';

class AudioState {
  final bool isPlaying;
  final bool isInitialized;

  const AudioState({
    this.isPlaying = false,
    this.isInitialized = false,
  });

  AudioState copyWith({
    bool? isPlaying,
    bool? isInitialized,
  }) {
    return AudioState(
      isPlaying: isPlaying ?? this.isPlaying,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }
}

class AudioViewModel extends StateNotifier<AudioState> {
  final AudioService _audioService;

  AudioViewModel(this._audioService) : super(const AudioState());

  Future<void> toggleMusic() async {
    final playing = await _audioService.togglePlayPause();
    state = state.copyWith(isPlaying: playing, isInitialized: true);
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }
}

final audioServiceProvider = Provider<AudioService>((ref) {
  return AudioService();
});

final audioViewModelProvider =
    StateNotifierProvider<AudioViewModel, AudioState>((ref) {
  final service = ref.watch(audioServiceProvider);
  return AudioViewModel(service);
});
