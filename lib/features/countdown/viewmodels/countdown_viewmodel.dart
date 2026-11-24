import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/wedding_config_repository.dart';

class CountdownTime {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final bool isCompleted;

  const CountdownTime({
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.isCompleted,
  });

  factory CountdownTime.fromTarget(DateTime target) {
    final now = DateTime.now();
    final difference = target.difference(now);

    if (difference.isNegative || difference.inSeconds <= 0) {
      return const CountdownTime(
        days: 0,
        hours: 0,
        minutes: 0,
        seconds: 0,
        isCompleted: true,
      );
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    return CountdownTime(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      isCompleted: false,
    );
  }
}

class CountdownNotifier extends StateNotifier<CountdownTime> {
  final DateTime targetDate;
  Timer? _timer;

  CountdownNotifier(this.targetDate) : super(CountdownTime.fromTarget(targetDate)) {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = CountdownTime.fromTarget(targetDate);
      if (state.isCompleted) {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final countdownProvider =
    StateNotifierProvider<CountdownNotifier, CountdownTime>((ref) {
  final target = WeddingConfigRepository.data.mainWeddingDate;
  return CountdownNotifier(target);
});
