import 'package:flutter/material.dart';

import 'layers/presenters/view/pages/login/login_page.dart';
import 'layers/presenters/view/pages/home/home_page.dart';
import 'shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seventh App',
      theme: DefaultTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
