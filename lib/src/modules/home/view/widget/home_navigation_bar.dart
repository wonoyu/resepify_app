import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resepify_app/src/shared/constants/colors.dart';
import 'package:resepify_app/src/shared/resepify_icons.dart';

final selectedNavbarProvider = StateProvider<int>((ref) => 2);

class HomeNavigationBar extends ConsumerWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNavbar = ref.watch(selectedNavbarProvider);
    return NavigationBar(
      height: kBottomNavigationBarHeight,
      selectedIndex: selectedNavbar,
      onDestinationSelected: (newIndex) {
        ref.read(selectedNavbarProvider.notifier).state = newIndex;
      },
      destinations: [
        NavigationDestination(
            icon: _buildNavIcon(ResepifyIcons.home, 0, selectedNavbar),
            label: 'home'),
        NavigationDestination(
            icon: _buildNavIcon(ResepifyIcons.search, 1, selectedNavbar),
            label: 'search'),
        NavigationDestination(
            icon: _buildNavIcon(ResepifyIcons.bookmark, 2, selectedNavbar),
            label: 'bookmark'),
        NavigationDestination(
            icon: _buildNavIcon(ResepifyIcons.profile, 3, selectedNavbar),
            label: 'profile'),
      ],
    );
  }

  _buildNavIcon(IconData icon, int index, int selectedIndex) => Column(
        mainAxisSize:
            selectedIndex == index ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: selectedIndex == index
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            color: black,
          ),
          ClipPath(
            clipper: CstClipper(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              height: selectedIndex == index ? 30 : 0,
              color: selectedIndex == index ? primary : white,
            ),
          )
        ],
      );
}

class CstClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height)
      ..lineTo(0, size.width);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
