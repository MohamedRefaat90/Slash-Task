import 'package:flutter/material.dart';
import 'package:slash_tesk/core/constants/app_theme.dart';
import 'package:slash_tesk/core/dependency%20injection/dependency_injection.dart';
import 'package:slash_tesk/routes.dart';

void main() {
  DependencyInjection.init();
  runApp(const SlashTest());
}

class SlashTest extends StatelessWidget {
  const SlashTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.mainTheme,
      routerConfig: routers,
    );
  }
}
