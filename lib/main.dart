import 'package:flutter/material.dart';
import 'package:post_app/injection_container.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/routes/routes.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Posts',
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1455, name: "DESKTOPSMALL"),
          const Breakpoint(start: 1455, end: double.infinity, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
