import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/custom_button.dart';

class CongratPage extends StatelessWidget {
  const CongratPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/ready_illustration.png'),
              Text(
                'Congrats!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Your Profile is ready',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              CustomButton(buttonText: 'Next', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
