import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentations/providers/theme_provider.dart';
import 'package:widgets_app/presentations/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentations/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentations/screens/home/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
      ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch( isDarkModeProvider );
    // final int selectedColor = ref.watch( selectedIndexColorProvider );
    final appTheme = ref.watch( themeNotifierProvider );

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode).getTheme(),
      theme: appTheme.getTheme(),
      // home: const HomeScreen(),
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen(),
      // },
    );
  }
}
