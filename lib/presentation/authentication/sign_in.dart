import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_ninja/presentation/authentication/sign_up.dart';
import 'package:fruit_ninja/presentation/components/custom_button.dart';
import '../../data/authentication.dart';
import '../components/text_form_field.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool _isLoading = false;
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication(context);
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: Image.asset('assets/images/logo.png')),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      child: Text(
                        'Login to your Acount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    TextFieldForm(
                      hintText: 'Email....',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onchanged: (value) => email = value,
                      inputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldForm(
                      hintText: 'Password....',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onchanged: (value) => password = value,
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
                      inputType: TextInputType.text,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'or continue with',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                          onPressed: () {
                            authentication.GoogleAuthentication();
                          },
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
                    CustomButton(
                      buttonText: 'Login',
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          authentication.SigninAuthentication(
                              email: email!, password: password!);
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      },
                    ),
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
