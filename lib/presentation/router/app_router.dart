import 'package:flutter/material.dart';
import 'package:fruit_ninja/presentation/authentication/congrat.dart';
import 'package:fruit_ninja/presentation/authentication/sign_in.dart';
import 'package:fruit_ninja/presentation/authentication/sign_up.dart';
import 'package:fruit_ninja/presentation/authentication/upload_photo.dart';
import 'package:fruit_ninja/presentation/authentication/user_bio.dart';
import 'package:fruit_ninja/presentation/main_screens/home_page.dart';

import '../onboarding/onboarding_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => OnboardingPage(),
        );
      case '/signup':
        return MaterialPageRoute(builder: (context) => SignUpPage(),);
      case '/signin':
        return MaterialPageRoute(builder: (context) => SignInPage(),);
      case '/homepage':
        return MaterialPageRoute(builder: (context) => HomePage(),);
      case '/congrat':
        return MaterialPageRoute(builder: (context) => CongratPage(),);
      case '/userbio':
        return MaterialPageRoute(builder: (context) => UserBioPage(),);
      case '/uploadphoto':
        return MaterialPageRoute(builder: (context) => UploadPhotoPage(),);
      default:
        return null;
    }
  }
}
