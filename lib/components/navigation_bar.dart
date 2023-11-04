import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travelapp/screens/dashboard_screens/notifications.dart';
import 'package:travelapp/screens/dashboard_screens/settings.dart';
import '../constant.dart';
import '../screens/dashboard_screens/badges.dart';
import '../screens/dashboard_screens/games.dart';
import '../screens/dashboard_screens/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AI App'),
      //   centerTitle: true,
      // ),
      extendBody: true,
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          Center(
            child: HomeScreen(),
          ),
          Center(
            child: Games(),
          ),
          Center(
            child: Badges(),
          ),
          Center(
            child: Settings(),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.star),
      //     elevation: 0.1,
      //     onPressed: () {
      //       Navigator.push(
      //           context, MaterialPageRoute(builder: (_) => Badges()));
      //     }),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 7.0,
      //   clipBehavior: Clip.antiAlias,
      //   child: SizedBox(
      //     height: 60,
      //     child: BottomNavigationBar(
      //       type: BottomNavigationBarType.fixed,
      //       backgroundColor: Colors.transparent,
      //       elevation: 0.1,
      //       currentIndex: _selectedIndex,
      //       selectedItemColor: Colors.white,
      //       unselectedItemColor: Colors.black,
      //       onTap: (index) {
      //         setState(() {
      //           _selectedIndex = index;
      //           pageController.jumpToPage(index);
      //         });
      //       },
      //       items: const [
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.home_outlined),
      //           label: 'home',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.games),
      //           label: 'Games',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.notifications_active),
      //           label: 'Notifications',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.settings),
      //           label: 'Settings',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      bottomNavigationBar: Container(
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            backgroundColor: primaryColor,
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            gap: 5,
            padding: EdgeInsets.all(10),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                pageController.jumpToPage(index);
              });
            },
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.games,
                text: "Games",
              ),
              GButton(
                icon: Icons.military_tech,
                text: "Badges",
                iconSize: 28,
              ),
              GButton(
                icon: Icons.settings,
                text: "Setting",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
