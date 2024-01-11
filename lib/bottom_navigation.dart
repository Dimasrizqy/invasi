import 'package:flutter/material.dart';
import 'package:invasi/QRScannerScreen.dart';
import 'package:invasi/bottomNav/home_screen.dart';
import 'package:invasi/bottomNav/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<BottomNav> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    QRScannerScreen(),
    // SearchScreen(),
    // FavoritesScreen(),
    ProfileScreen()
    // Tambahkan widget lainnya sesuai kebutuhan
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 232, 230, 1),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: const Color.fromRGBO(15, 13, 2, 100),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scanner),
            label: 'Scann',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.favorite),
          //   label: 'Favorites',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(78, 130, 110, 1),
        unselectedItemColor: const Color.fromRGBO(5, 3, 4, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
