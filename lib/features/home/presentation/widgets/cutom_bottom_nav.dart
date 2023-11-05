import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function? onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
      onTap: (value) {
        onTap!(value);
      },
      backgroundColor: const Color(0xff004182),
      currentIndex: currentIndex,
      items: [
        _bottomNavigationBarItem(
          label: '',
          imagePath: 'assets/images/home.png',
        ),
        _bottomNavigationBarItem(
          label: '',
          imagePath: 'assets/images/category_icon.png',
        ),
        _bottomNavigationBarItem(
          label: '',
          widget: const Icon(Icons.production_quantity_limits),
        ),
        _bottomNavigationBarItem(
          label: '',
          imagePath: 'assets/images/liked.png',
        ),
        _bottomNavigationBarItem(
          label: '',
          imagePath: 'assets/images/profile.png',
        ),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required String label,
    String? imagePath,
    Widget? widget,
  }) {
    return BottomNavigationBarItem(
      activeIcon: CircleAvatar(
        backgroundColor: Colors.white,
        child: widget ??
            ImageIcon(
              AssetImage(imagePath ?? ''),
              color: const Color(0xff004182),
            ),
      ),
      label: label,
      icon: widget ??
          ImageIcon(
            AssetImage(imagePath ?? ''),
            color: Colors.white,
          ),
    );
  }
}
