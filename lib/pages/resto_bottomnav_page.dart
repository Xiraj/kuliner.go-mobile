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
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.menu_book),
        label: 'Menu',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.book_rounded), label: 'Booking'),
      BottomNavigationBarItem(icon: Icon(Icons.reviews_rounded), label: 'Review'),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded), label: 'Profil'),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: <Widget>[
          RestoMenu(),
          RestoBookingList(),
          RestoReviewList(),
          RestoProfile()
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