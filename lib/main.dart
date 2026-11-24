import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/wedding_theme_palette.dart';
import 'features/home/viewmodels/theme_viewmodel.dart';
import 'features/home/views/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: SanjayAndBenitaWeddingApp(),
    ),
  );
}

class SanjayAndBenitaWeddingApp extends ConsumerWidget {
  const SanjayAndBenitaWeddingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = ref.watch(weddingThemeStateProvider);
    final themePalette = WeddingThemeColors.fromType(themeType);

    return MaterialApp(
      title: 'Sanjay ❤️ Benita | Wedding Celebration',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(themePalette),
      home: const HomeScreen(),
    );
  }
}
