import 'package:flutter/material.dart';
import 'package:resepify_app/src/modules/home/view/page/search_page.dart';
import 'package:resepify_app/src/modules/home/view/widget/home_navigation_bar.dart';
import 'package:resepify_app/src/shared/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => navigator.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          // fmd_good_outlined
          // location_on_outlined
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.grid_view_rounded))
        ],
      ),
      body: Container(color: white, child: const SearchPage()),
      bottomNavigationBar: const HomeNavigationBar(),
    );
  }
}
