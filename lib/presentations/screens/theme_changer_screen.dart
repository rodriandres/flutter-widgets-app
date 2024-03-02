import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:widgets_app/presentations/providers/theme_provider.dart";

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen'; 
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch( themeNotifierProvider ).isDarkMode; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            icon: Icon( isDarkMode? 
              Icons.dark_mode_outlined
              : 
              Icons.light_mode_outlined
            ),

            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch( colorListProvider );

    // final int selectedIndex = ref.watch( selectedIndexColorProvider );
    final int selectedIndex = ref.watch( themeNotifierProvider ).selectedColor;
    
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedIndex,
          onChanged: (value) {
            // ref.read( selectedIndexColorProvider.notifier).state = index;
            ref.read( themeNotifierProvider.notifier ).changeColorIndex(index);
          },
        );
      },
    );
  }
}