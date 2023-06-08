import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/favorite_page.dart';
import 'package:kuliner_go_mobile/pages/history_page.dart';
import 'package:kuliner_go_mobile/pages/home_page.dart';
import 'package:kuliner_go_mobile/pages/profile_page.dart';
import 'package:kuliner_go_mobile/theme.dart';

class homeBottomNav extends StatefulWidget {
  const homeBottomNav({super.key});

  @override
  State<homeBottomNav> createState() => _homeBottomNavState();
}

class _homeBottomNavState extends State<homeBottomNav> {
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
        icon: Icon(Icons.home_filled),
        label: 'Beranda',
      ),
      const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
      const BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
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
        children: const <Widget>[
          HomePage(),
          FavoritePage(),
          HistoryPage(),
          ProfilePage()
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
