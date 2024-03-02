
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Provider - Se usa para valores inmutables
final colorListProvider = Provider((ref) => colorList);

// StateProvider - Estos se usan para mantener una pieza de estado
final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

// StateNotifierProvider - Se usa para matener el estado mas elaborado
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Se llama Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme>{

  // final bool isDarkMode;
  // final int selectedColorIndex;

  // State = es un nueva instancia de la clase AppTheme
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkMode() {
    state = state.copyWith( isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex( int colorIndex ) {
    state = state.copyWith( selectedColor: colorIndex);
  }

}