import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ninja/business_logic/onboard_cubit.dart';
import 'package:fruit_ninja/presentation/authentication/sign_in.dart';

import '../components/custom_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageViewController = PageController();
  int current_page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageViewController,
                itemCount: 2,
                itemBuilder: (context, index) {
                  current_page = index;
                  return onboard_slides[index];
                },
              ),
            ),
            CustomButton(
              buttonText: 'Next',
              onPressed: (){
                if (current_page == 0) {
                  _pageViewController.jumpToPage(1);
                } else {
                  BlocProvider.of<OnboardCubit>(context).RemovePage();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(),));
                }
              }
              ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
  List<Widget> onboard_slides = slides
      .map((item) => Column(
    children: [
      Expanded(child: Image.asset(item['image'])),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: item['title'],
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
            TextSpan(
                text: item['title2'],
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
          ]),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: item['section'],
                style: TextStyle(color: Colors.black)),
            TextSpan(
                text: item['section2'],
                style: const TextStyle(
                  color: Colors.black,
                )),
          ]),
        ),
      ),
      
    ],
  ))
      .toList();
}

const List slides = [
  {
    'image': 'assets/images/Illustration1.png',
    'title': 'Find Your Comfort\n',
    'title2': 'Food here',
    'section': 'Here you can find a chef or dish for every\n',
    'section2': 'taste and color. Enjoy!'
  },
  {
    'image': 'assets/images/Illustration2.png',
    'title': 'Food ninja is where your\n',
    'title2': 'Comfort food lives',
    'section': 'Enjoy a fast and smooth food delivery at\n',
    'section2': 'your doorstep'
  },
];
