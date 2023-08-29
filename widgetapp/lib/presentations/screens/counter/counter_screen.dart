import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetapp/presentations/providers/counter_provider.dart';
import 'package:widgetapp/presentations/providers/theme_provider.dart';


class CounterScreen extends ConsumerWidget {

  static const String name = 'riverpod_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    final bool isdrakModeProvider = ref.watch(isDrakModeProvider);

    return Scaffold( 
      appBar: AppBar(
        title: const Text('RiverPod',),
        actions: [
          
          IconButton(
            icon: Icon( isdrakModeProvider ? Icons.dark_mode_outlined : Icons.light_mode_outlined ),
            onPressed: () {
              ref.read(isDrakModeProvider.notifier).update((state) => !state);
            }, 
          )
          
          
        ],
        
      ),
      body: Center(
        child: Text(
          'Valor $clickCounter',
          style: Theme.of(context).textTheme.titleLarge
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {
          ref.read(counterProvider.notifier).state++
        },
      ),

    );
  }
}



