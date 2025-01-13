import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/all/screen_controller_page.dart';
import 'package:egov/widgets/data_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'UI/all/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  // getAppLocalVersion() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   box.write('localversion', packageInfo.version);
  // }

  getAppOnlineVersion() async {
    await FirebaseFirestore.instance
        .collection("settings")
        .doc("mobileapp")
        .get()
        .then((value) async {
      box.write('onlineversion', value["onlineversion"]);
    });
  }

  await getAppOnlineVersion();
  // await getAppLocalVersion();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E - Governance',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: currentUser == null
          ? const LoginPage()
          : const ScreenControllerPage(),
    );
    // MultiProvider(
    //   providers: [
    //     //ChangeNotifierProvider.value(value: UserProvider.initialize()),
    //     //ChangeNotifierProvider.value(value: SettingsProvider.initialize()),
    //     // ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
    //   ],
    //   child: GetMaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Alpha Shipping and logistics',
    //     theme: ThemeData(
    //       splashColor: Colors.transparent,
    //       highlightColor: Colors.black,
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: false,
    //     ),
    //     home: currentUser == null ? const LoginPage() : const HomePage(),
    //   ),
    // );
  }
}
