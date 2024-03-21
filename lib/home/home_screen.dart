import 'package:amity_uikit_beta_service/amity_sle_uikit.dart';
import 'package:blupro/login/login_screen.dart';
import 'package:blupro/main.dart';
import 'package:blupro/utils/storage_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restart_app/restart_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
            'Welcome, ${GetStorage().read(StorageConstants.user).toString()}'),
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Home Page",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              )
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const Scaffold(body: PostToPage()),
              //     ));
              //   },
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              //     decoration: BoxDecoration(
              //       color: Colors.grey[100],
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: const Text(
              //       "Create Post",
              //       style: TextStyle(
              //         fontSize: 18,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const Scaffold(body: CommunityPage()),
              //     ));
              //   },
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              //     decoration: BoxDecoration(
              //       color: Colors.grey[100],
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: const Text(
              //       "Explore Post",
              //       style: TextStyle(
              //         fontSize: 18,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     logout();
              //   },
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              //     decoration: BoxDecoration(
              //       color: Colors.grey[100],
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: const Text(
              //       "Logout",
              //       style: TextStyle(
              //         fontSize: 18,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  logout() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(false); // Return false to indicate cancel
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              AmitySLEUIKit().unRegisterDevice();
              await GetStorage().erase();
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => LoginScreen(),
              //     ),
              //     (route) => false);
              // RestartWidget.restartApp(context);
              await Future.delayed(Duration(milliseconds: 500));
              Restart.restartApp();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void cupertinoDialog(
    BuildContext? context, {
    String? dialogTitle = "",
    String? dialogDesc = "",
    String? dialogConfirmTitle = "",
    List<Widget>? widgets,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context!,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          dialogTitle!,
        ),
        content: Text(
          dialogDesc!,
        ),
        actions: widgets ??
            <Widget>[
              CupertinoDialogAction(
                child: Text(
                  dialogConfirmTitle!,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
      ),
    );
  }

  // Future<void> logOutTap() async {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (_) => AlertDialog(
  //       title: Text(
  //         "Are you sure you want logout?",
  //         style: TextStyle(fontSize: 18, color: Colors.black),
  //       ),
  //       content: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           GestureDetector(
  //             onTap: () {

  //             },
  //             child: Text(
  //               "Yes",
  //             ),
  //           ),
  //           GestureDetector(
  //             onTap: () => Navigator.pop(context),
  //             child: Text(
  //               "No",
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
