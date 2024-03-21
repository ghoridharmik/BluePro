import 'package:amity_uikit_beta_service/amity_sle_uikit.dart';
import 'package:amity_uikit_beta_service/components/alert_dialog.dart';
import 'package:blupro/bottombar_screen.dart';
import 'package:blupro/login/login_screen.dart';
import 'package:blupro/utils/common_function.dart';
import 'package:blupro/utils/images.dart';
import 'package:blupro/utils/storage_constant.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 1000), () async {
      if (!CommonFunction()
          .isNullEmptyOrFalse(GetStorage().read(StorageConstants.user))) {
        await AmitySLEUIKit().registerDevice(
          context: context,
          userId: GetStorage().read(StorageConstants.user),
          callback: (isSuccess, error) async {
            if (isSuccess) {
              return Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const BottomBarScreen(),
                ),
              );
            } else {
              AmityDialog().showAlertErrorDialog(
                  title: "Error", message: error.toString());
            }
          },
        );
      } else {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        ImageConstants.splashImage,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
