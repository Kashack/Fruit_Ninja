import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_ninja/business_logic/onboard_cubit.dart';
import 'package:fruit_ninja/presentation/authentication/sign_in.dart';
import 'package:fruit_ninja/presentation/authentication/verification.dart';
import 'package:fruit_ninja/presentation/main_screens/home_page.dart';
import 'package:fruit_ninja/presentation/onboarding/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/router/app_router.dart';

bool? initScreen = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences? prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getBool('isFirstTime');
  await prefs.setBool('isFirstTime', false);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // onGenerateRoute: (settings) => initScreen == true ? ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: initScreen == true || initScreen == null  ? OnboardingPage() : MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return VerificationPage();
          }else{
            return SignInPage();
          }
        },
      ),
    );
  }
}

