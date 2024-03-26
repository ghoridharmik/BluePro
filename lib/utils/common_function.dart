import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonFunction {
  bool isNullEmptyOrFalse(dynamic o) {
    if (o is Map<String, dynamic> || o is List<dynamic>) {
      return o == null || o.length == 0;
    }
    return o == null || false == o || "" == o;
  }
}

class ProgressDialog2 {
  static Future<void> showLoadingDialog(BuildContext context,
      {bool isCancellable = true}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: isCancellable,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Builder(builder: (context) {
            return WillPopScope(
              onWillPop: () async {
                return isCancellable;
              },
              child: const SizedBox(
                height: 40.0,
                width: 40.0,
                child: CupertinoActivityIndicator(
                  radius: 18,
                  color: Colors.white,
                ),
              ),
            );
          }),
        );
      },
    );
  }

  static void hideProgressDialog(context) {
    return Navigator.pop(context);
  }
}
