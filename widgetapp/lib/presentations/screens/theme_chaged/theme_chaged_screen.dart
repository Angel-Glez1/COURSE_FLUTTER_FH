import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetapp/presentations/providers/theme_provider.dart';

class ThemeChagedScreen extends ConsumerWidget {
  static const String name = 'theme_change_screen';
  const ThemeChagedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RiverPod',
        ),
        actions: [
          IconButton(
            icon: Icon(themeNotifier.isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          )
        ],
      ),
      body: const _ThemeChagedView(),
    );
  }
}

class _ThemeChagedView extends ConsumerWidget {


  const _ThemeChagedView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final themeNotifier = ref.watch(themeNotifierProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}', style: TextStyle(color: color),),
          activeColor: color,
          value: index,
          groupValue: themeNotifier.selectedColor, 
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index); 
          },
        );
      },
    );
  }
}
