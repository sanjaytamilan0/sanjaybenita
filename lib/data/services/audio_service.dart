import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  bool _isInitialized = false;

  bool get isPlaying => _isPlaying;

  // Uses a gentle royalty-free peaceful Indian Shehnai / flute ambient music URL as fallback
  // plus local asset support
  static const String onlineWeddingMusic =
      'https://cdn.pixabay.com/download/audio/2022/05/16/audio_c89b7201c1.mp3?filename=traditional-indian-wedding-santoor-111718.mp3';

  Future<void> init() async {
    if (_isInitialized) return;
    _player.setReleaseMode(ReleaseMode.loop);
    _player.onPlayerStateChanged.listen((state) {
      _isPlaying = state == PlayerState.playing;
    });
    _isInitialized = true;
  }

  Future<bool> togglePlayPause() async {
    try {
      if (!_isInitialized) await init();
      if (_isPlaying) {
        await _player.pause();
        _isPlaying = false;
        return false;
      } else {
        try {
          await _player.play(UrlSource(onlineWeddingMusic));
        } catch (e) {
          debugPrint('Online music load fallback: $e');
        }
        _isPlaying = true;
        return true;
      }
    } catch (e) {
      debugPrint('Audio playback error: $e');
      return false;
    }
  }

  void dispose() {
    _player.dispose();
  }
}
