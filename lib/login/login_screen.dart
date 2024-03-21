import 'dart:developer';

import 'package:amity_uikit_beta_service/amity_sle_uikit.dart';
import 'package:amity_uikit_beta_service/components/alert_dialog.dart';
import 'package:amity_uikit_beta_service/viewmodel/amity_viewmodel.dart';
import 'package:amity_uikit_beta_service/viewmodel/user_viewmodel.dart';
import 'package:blupro/bottombar_screen.dart';
import 'package:blupro/component/common_button.dart';
import 'package:blupro/utils/images.dart';
import 'package:blupro/utils/storage_constant.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();

  @override
  void initState() {

    _userNameController.text = "dharmik";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 60),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.4,
                  decoration: const BoxDecoration(color: Color(0xff4718AD)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          ImageConstants.loginImage,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 36,
                          right: 36,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hii",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Welcome to bluePRO",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.only(top: 30, left: 20, right: 20),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 9.5),
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff200A4D).withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: _userNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CommonButton(
                                btnColor:
                                    _userNameController.text.isNotEmpty
                                        ? const Color(0xff8658E8)
                                        : Colors.grey[300],
                                textColor:
                                    _userNameController.text.isNotEmpty
                                        ? Colors.white
                                        : Colors.black,
                                width: MediaQuery.of(context).size.width,
                                onTap: () async {
                                  // ProgressDialog2.showLoadingDialog(context);
    
                                  log("login");
                                  ///Step 3: login with Amity
                                  await AmitySLEUIKit().registerDevice(
                                    context: context,
                                    userId: _userNameController.text,
                                    callback: (isSuccess, error) async {
                                      await GetStorage().write(
                                          StorageConstants.user,
                                          _userNameController.text);
    
                                      // Navigator.pop(context);
                                      log("callback:$isSuccess");
                                      if (isSuccess) {
                                        // ProgressDialog2.hideProgressDialog(
                                        //     context);
                                        log("success");
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BottomBarScreen(),
                                          ),
                                        );
                                      } else {
                                        AmityDialog().showAlertErrorDialog(
                                            title: "Error",
                                            message: error.toString());
                                      }
                                    },
                                  );
                                },
                                text: "Login",
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerDevice1(
      {required BuildContext context,
      required String userId,
      String? displayName,
      String? authToken,
      Function(bool isSuccess, String? error)? callback}) async {
    await Provider.of<AmityVM>(context, listen: false)
        .login(userID: userId, displayName: displayName, authToken: authToken)
        .then((value) async {
      log("login success");
      await Provider.of<UserVM>(context, listen: false)
          .initAccessToken()
          .then((value) {
        log("initAccessToken success");
        if (Provider.of<UserVM>(context, listen: false).accessToken != null ||
            Provider.of<UserVM>(context, listen: false).accessToken != "") {
          if (callback != null) {
            callback(true, null);
          }
        } else {
          if (callback != null) {
            callback(false, "Initialize accesstoken fail...");
          }
        }
      }).onError((error, stackTrace) {
        log("initAccessToken fail...");
        log(error.toString());
        if (callback != null) {
          callback(true, error.toString());
        }
      });
    }).onError((error, stackTrace) {
      log("registerDevice...Error:$error");
      if (callback != null) {
        callback(false, "Initialize accesstoken fail...");
      }
    });
  }
}
