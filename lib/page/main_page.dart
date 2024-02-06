import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

int _selectedIndex = 0;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("data"),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (v) {
          setState(
            () {
              _selectedIndex = v;
            },
          );
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled),label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart),label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: ""),
        ],
      ),
    );
  }
}
