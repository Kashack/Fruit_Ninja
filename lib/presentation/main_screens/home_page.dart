import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_ninja/presentation/main_screens/cart.dart';
import 'package:fruit_ninja/presentation/main_screens/home.dart';
import 'package:fruit_ninja/presentation/main_screens/user.dart';

import 'chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: bottomNavigationPages[_selectindex],
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            currentIndex: _selectindex,
            onTap: (value) => setState(() {
              _selectindex = value;
            }),
            type: BottomNavigationBarType.shifting,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold),
            showUnselectedLabels: false,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/message_logo.svg',
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/user_logo.svg'),
                  label: 'user'
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/cart_icon.svg'),
                  label: 'cart'
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/message_icon.svg',
                    height: 24,
                    width: 24,
                  ),
                  label: 'Chat'
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: 1,
      //   destinations: [
      //     NavigationDestination(
      //         icon: SvgPicture.asset(
      //           'assets/icons/lock_logo.svg',
      //           color: Colors.green,
      //         ),
      //         label: 'home',
      //     ),
      //     NavigationDestination(
      //       icon: SvgPicture.asset(
      //         'assets/icons/lock_logo.svg',
      //       ),
      //       selectedIcon: SvgPicture.asset(
      //         'assets/icons/lock_logo.svg',
      //         color: Colors.lightGreenAccent,
      //       ),
      //       label: 'loc',
      //     ),
      //     NavigationDestination(
      //       icon: SvgPicture.asset(
      //         'assets/icons/message_logo.svg',
      //       ),
      //       label: 'home',
      //     ),
      //   ],
      // ),
      //
    );
  }
}
List bottomNavigationPages = [
  Home(),
  UserProfile(),
  Cart(),
  Chat(),
];