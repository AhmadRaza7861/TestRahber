import 'package:firebase_authentication/routs/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: AppRouter().router.routerDelegate,
      routeInformationProvider: AppRouter().router.routeInformationProvider,
      routeInformationParser: AppRouter().router.routeInformationParser,
    );
  }
}
