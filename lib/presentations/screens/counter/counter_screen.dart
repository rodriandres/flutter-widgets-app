import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentations/providers/counter_provider.dart';
import 'package:widgets_app/presentations/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counterValue = ref.watch( counterProvider );
    final bool isDarkMode = ref.watch( isDarkModeProvider );


    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon( isDarkMode? 
              Icons.dark_mode_outlined
              : 
              Icons.light_mode_outlined
            ),

            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((currentMode) => !currentMode);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Valor: $counterValue', style: Theme.of(context).textTheme.titleLarge,)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          // counterValue++;
        },
        child: Icon( Icons.add ),
      ),
    );
  }
}