import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme.dart';
import 'routes.dart';
import '../presentation/navigation/bottom_navigation.dart';

class WaddleApp extends ConsumerWidget {
  const WaddleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Waddle',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Default to light theme
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
} 