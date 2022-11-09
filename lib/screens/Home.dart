// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newsapp/screens/businees_screen.dart';
import 'package:newsapp/screens/siences_screen.dart';
import 'package:newsapp/screens/sports_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int index = 0;
List screens = [
  SportsScreen(),
  BusinessScreen(),
  ScienceScreen(),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          elevation: 10,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.amber,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports,
                  color: Colors.red,
                ),
                label: 'sports'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.business,
                  color: Colors.red,
                ),
                label: 'business'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.science,
                  color: Colors.red,
                ),
                label: 'Science'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
                label: 'search'),
          ]),
    );
  }
}
