import 'package:flutter/material.dart';
import 'package:fruit_ninja/business_logic/onboard_cubit.dart';
import 'package:fruit_ninja/presentation/authentication/sign_in.dart';
import 'package:fruit_ninja/presentation/onboarding/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardCubit>(
      create: (context) => OnboardCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OnboardingPage()
      ),
    );
  }
}
