import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winery/ui/devs_screen.dart';

import 'wines_screen.dart';

class WinesPage extends StatefulWidget {
  const WinesPage({Key? key}) : super(key: key);

  @override
  State<WinesPage> createState() => _WinesPageState();
}

class _WinesPageState extends State<WinesPage> {
   void launchEmail() async {
      String url = 'https://github.com/Karumaidoi/dogify';

      await canLaunch(url) ? launch(url) : print('Unable');
    }
  int index = 0;
  final pages = [
     WineScreen(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lush Vine',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                launchEmail();
              },
              icon: const Icon(
                Icons.code,
                color: Colors.white,
              ))
        ],
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          // indicatorColor: Colors.blue.shade200,
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          )),
        ),
        child: NavigationBar(
            selectedIndex: index,
            height: 80,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                  selectedIcon: Icon(Icons.home_filled)),
              NavigationDestination(
                  icon: Icon(Icons.code),
                  label: 'Dev',
                  selectedIcon: Icon(Icons.code)),
            ]),
      ),
    );
  }
}
