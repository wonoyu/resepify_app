import 'package:flutter/material.dart';
import 'package:resepify_app/src/modules/home/view/page/home_page.dart';
import 'package:resepify_app/src/shared/constants/themes.dart';

class ResepifyApp extends StatelessWidget {
  const ResepifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
