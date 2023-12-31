import 'package:firebase_authentication/routs/route_constents.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),(){
        context.replaceNamed(RouteConstants.logIn);
    }
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Welcome To Flutter Test Project",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
