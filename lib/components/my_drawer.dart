import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/page/home_page.dart';
import 'package:music_app/page/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text('H O M E'),
              onTap: () {Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),),);},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('S E T T I N G'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage(),),);
              },
            ),
          ),
        ],
      ),
    );
  }
}
