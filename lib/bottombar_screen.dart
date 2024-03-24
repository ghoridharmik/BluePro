import 'package:amity_uikit_beta_service/amity_sle_uikit.dart';
import 'package:amity_uikit_beta_service/view/UIKit/social/explore_page.dart';
import 'package:amity_uikit_beta_service/view/UIKit/social/post_target_page.dart';
import 'package:amity_uikit_beta_service/view/user/user_profile.dart';
import 'package:blupro/component/common_webview.dart';
import 'package:blupro/home/home_screen.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    CommunityPage(),
    PostToPage(),
    LeaderBoardScreen(),
    StreamingScreen(),
    UserProfileScreen(
      amityUser: AmitySLEUIKit().getCurrentUser(),
      isEnableBackButtton: false,
      amityUserId: AmitySLEUIKit().getCurrentUser().userId ?? "",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      // body: IndexedStack(
      //   index: _selectedIndex,
      //   children: [
      //     HomeScreen(),
      //     PostToPage(),
      //     CommunityPage(),
      //     UserProfileScreen(
      //       amityUser: AmitySLEUIKit().getCurrentUser(),
      //       isEnableBackButtton: false,
      //       amityUserId: AmitySLEUIKit().getCurrentUser().userId ?? "",
      //     )
      //     // Container(
      //     //   color: Colors.yellow,
      //     //   child: Text("profile  ${AmitySLEUIKit().getCurrentUser().userId}"),
      //     // )
      //   ],
      // ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'My Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_rounded),
              label: 'LeaderBoard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.live_tv_rounded),
              label: 'Streaming',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
