import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_ninja/data/authentication.dart';
import 'package:fruit_ninja/presentation/components/custom_button.dart';

import '../components/text_form_field.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? password;
  String? confirmPassword;
  bool _isLoading = false;
  bool _isObsecure = true;
  bool _isObsecure2 = true;

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication(context);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/onboarding.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo.png'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Sign up for free',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      TextFieldForm(
                        hintText: 'User name.....',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        onchanged: (value) => username = value,
                        prefix_icon: Image.asset('assets/images/user_icon.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldForm(
                        hintText: 'Email.....',
                        onchanged: (value) => email = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        prefix_icon:
                            Image.asset('assets/images/message_icon.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldForm(
                        hintText: 'Password.....',
                        onchanged: (value) => password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        prefix_icon: Image.asset('assets/images/lock_icon.png'),
                        suffix_icon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObsecure = !_isObsecure;
                            });
                          },
                          icon: _isObsecure == true
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                        ),
                        isObscureText: _isObsecure,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldForm(
                        hintText: 'Confirm Password.....',
                        onchanged: (value) => confirmPassword = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value != password) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        prefix_icon: Image.asset('assets/images/lock_icon.png'),
                        suffix_icon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObsecure2 = !_isObsecure2;
                            });
                          },
                          icon: _isObsecure2 == true
                              ? Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          )
                              : Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                        isObscureText: _isObsecure2,
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
                          setState(() {
                            _isLoading = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            authentication.CreateAnAccount(
                              username: username!,
                              email: email!,
                              password: password!,
                            );
                          }
                          setState(() {
                            _isLoading = false;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black12,
            ),
          ),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }
}
