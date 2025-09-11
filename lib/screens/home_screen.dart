import 'package:flutter/material.dart';
import 'package:naruto_bloc/app_theme/app_colors.dart';

import 'akatsuki_screen/akatsuki_screen.dart';
import 'characters_screen/characters_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    CharactersScreen(),
    AkatsukiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:AppColors.green,
        selectedItemColor: AppColors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: 'Akatsuki'
          )
        ],
      ),
    );
  }
}
