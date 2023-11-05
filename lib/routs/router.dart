import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/features/app/splash_screen/splash_screen.dart';
import 'package:firebase_authentication/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:firebase_authentication/routs/route_constents.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/user_auth/presentation/pages/home_page.dart';
import '../features/user_auth/presentation/pages/login_page.dart';

class AppRouter
{
  GoRouter router=GoRouter(
    routes: [
    GoRoute(
      name: RouteConstants.splash,
        path: '/',
    pageBuilder: (context,state)
    {
      return const MaterialPage(child: SplashScreen());
    }
    ),
      GoRoute(
        name: RouteConstants.home,
          path: '/home',
        pageBuilder: (context,state)
        {
          print("kjkjklj");
          return const MaterialPage(child: HomePage());
        }
      ),
      GoRoute(
         name: RouteConstants.signUp,
          path: '/signup',
          pageBuilder: (context,state)
          {
            return const MaterialPage(child: SignUpPage());
          }
      ),
      GoRoute(
         name: RouteConstants.logIn,
          path: '/login',
          pageBuilder: (context,state)
          {
            return const MaterialPage(child: LoginPage());
          }
      ),
  ],
    // redirect: (context,state)
    // {
    //   User? user=FirebaseAuth.instance.currentUser;
    //   if(user!=null)
    //     {
    //       return null;
    //      // return '/home';
    //     }
    //   else
    //       return '/';
    // }
  );

}


