import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/resto_booking_page.dart';
import 'package:kuliner_go_mobile/pages/resto_menu_page.dart';
import 'package:kuliner_go_mobile/pages/resto_profile_page.dart';
import 'package:kuliner_go_mobile/pages/resto_review_page.dart';
import 'package:kuliner_go_mobile/theme.dart';

class RestoNav extends StatefulWidget {
  const RestoNav({super.key});

  @override
  State<RestoNav> createState() => _RestoNavState();
}

class _RestoNavState extends State<RestoNav> {
  int _selectedIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.menu_book),
        label: 'Menu',
      ),
      const BottomNavigationBarItem(icon: Icon(Icons.book_rounded), label: 'Booking'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.reviews_rounded), label: 'Review'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded), label: 'Profil'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: <Widget>[
          const RestoMenu(),
          const RestoBookingList(),
          const RestoReviewList(),
          const RestoProfile()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: blueColor,
        showUnselectedLabels: true,
        unselectedItemColor: greyColor,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}
