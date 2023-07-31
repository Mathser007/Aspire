import 'package:aspire/hm.dart';
import 'package:aspire/listing.dart';
import 'package:aspire/main.dart';
import 'package:aspire/nurse.dart';
import 'package:aspire/scheduling.dart';
import 'package:aspire/support.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List pages = [Home1(), Scheduling(), Support(),Nurse()];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
        body:pages[_selectedIndex],
    bottomNavigationBar:  BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.work_history_outlined),
          ),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.chat),
          ),
          label: 'Support',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      showUnselectedLabels: true,
      selectedItemColor: Colors.green[800],
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    ),);
  }
}

