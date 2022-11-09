import 'package:flutter/material.dart';
import 'package:fruit_ninja/presentation/authentication/user_bio.dart';
import 'package:fruit_ninja/presentation/components/custom_button.dart';

import '../components/text_form_field.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/logo.png'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Sign up for free',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              TextFieldForm(
                hintText: 'User name.....',
                prefix_icon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset('assets/images/user_icon.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldForm(
                hintText: 'Email.....',
                prefix_icon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset('assets/images/message_icon.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldForm(
                hintText: 'Password.....',
                prefix_icon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset('assets/images/lock_icon.png'),
                ),
                suffix_icon: Icon(Icons.remove_red_eye),
                isObscureText: true,
              ),
              Row(
                children: [
                  Checkbox(
                    shape: CircleBorder(),
                    // fillColor:
                    activeColor: Colors.greenAccent,
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text('Keep me signed in')
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    shape: CircleBorder(),
                    // fillColor:
                    activeColor: Colors.greenAccent,
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text('Email me about special pricing')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                buttonText: 'Create Account',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserBioPage(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
