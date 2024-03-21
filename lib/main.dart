import 'package:amity_uikit_beta_service/amity_sle_uikit.dart';
import 'package:blupro/login/login_screen.dart';
import 'package:blupro/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
//  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  AmitySLEUIKit().initUIKit("",
      apikey: "b0e9bb096ed2f7364930881a540e428e830cdeb4b2306f2f",
      region: AmityRegion.us);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: AmitySLEProvider(
        child: Builder(builder: (context2) {
          return SplashScreen();
        }),
      ),
    );
  }
}
