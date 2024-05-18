import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NavigationScreen extends StatelessWidget {
  final Widget navigationScreen;

  const NavigationScreen({super.key, required this.navigationScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 12, 12, 1),
      body: SafeArea(child: navigationScreen),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => context.go("/"),
              borderRadius: BorderRadius.circular(32),
              child: Column(children: [
                SvgPicture.asset(
                  "assets/svg/navigation_plane.svg",
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(34, 97, 188, 1),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Авиабилеты",
                  style: TextStyle(
                    color: Color.fromRGBO(34, 97, 188, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
              ]),
            ),
            const CustomNavBarItem(
              label: "Отели",
              path: "assets/svg/navigation_bed.svg",
            ),
            const CustomNavBarItem(
              label: "Короче",
              path: "assets/svg/navigation_point.svg",
            ),
            const CustomNavBarItem(
              label: "Подписки",
              path: "assets/svg/navigation_subs.svg",
            ),
            const CustomNavBarItem(
              label: "Профиль",
              path: "assets/svg/navigation_profile.svg",
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  final String label;
  final String path;

  const CustomNavBarItem({super.key, required this.label, required this.path});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(
        path,
        width: 24,
        height: 24,
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        label,
        style: const TextStyle(
          color: Color.fromRGBO(159, 159, 159, 1),
          fontWeight: FontWeight.w400,
          fontSize: 10,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ]);
  }
}
