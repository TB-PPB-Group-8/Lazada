import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/lazada_icon.svg', // Path file SVG
            width: 15,
            height: 15,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/message_light_mode_icon.svg',
            width: 24,
            height: 24,
          ),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/cart_light_mode_icon.svg',
            width: 24,
            height: 24,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/account_light_mode_icon.svg',
            width: 24,
            height: 24,
          ),
          label: 'Account',
        ),
      ],
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontSize: 12, // Ukuran font yang sama untuk label yang dipilih
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12, // Ukuran font yang sama untuk label yang tidak dipilih
      ),
    );
  }
}
