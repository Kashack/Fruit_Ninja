import 'package:flutter/material.dart';
import 'package:fruit_ninja/presentation/authentication/sign_up.dart';
import 'package:fruit_ninja/presentation/components/custom_button.dart';

import '../components/text_form_field.dart';

class SignInPage extends StatelessWidget {
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
              Expanded(child: Image.asset('assets/images/logo.png')),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  'Login to your Acount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              TextFieldForm(
                hintText: 'Email....',
                prefix_icon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldForm(
                hintText: 'Password....',
                prefix_icon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                ),
                suffix_icon: Icon(Icons.remove_red_eye),
                isObscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'or continue with',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    icon: Image.asset('assets/images/facebook.png'),
                    label: Text(
                      'Facebook',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    icon: Image.asset('assets/images/google_icon.png'),
                    label: Text(
                      'Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget your password?',
                    style: TextStyle(
                        color: Colors.greenAccent,
                        decoration: TextDecoration.underline),
                  )),
              CustomButton(buttonText: 'Login', onPressed: () {}),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ));
                  },
                  child: Text(
                    'Click here to create an account',
                    style: TextStyle(
                        color: Colors.greenAccent,
                        decoration: TextDecoration.underline),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
