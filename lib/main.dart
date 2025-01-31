import 'package:flutter/material.dart';
import 'package:post_app/injection_container.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Posts',
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 550, name: MOBILE),
          const Breakpoint(start: 551, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1470, name: "DESKTOPSMALL"),
          const Breakpoint(start: 1471, end: double.infinity, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
