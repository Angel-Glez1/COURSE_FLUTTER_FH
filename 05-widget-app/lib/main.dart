import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetapp/config/router/router.dart';
import 'package:widgetapp/config/theme/app_theme.dart';
import 'package:widgetapp/presentations/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp()
    ) 
  );
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {    
    
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      theme: appTheme.getTheme(),
    ); 
  }
}