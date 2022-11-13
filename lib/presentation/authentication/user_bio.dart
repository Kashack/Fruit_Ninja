import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_ninja/data/authentication.dart';
import 'package:fruit_ninja/presentation/authentication/upload_photo.dart';
import 'package:fruit_ninja/presentation/components/custom_button.dart';

import '../components/text_form_field.dart';

class UserBioPage extends StatelessWidget {
  String? first_name;
  String? last_name;
  String? mobile_number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mask_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0x74F9A84D),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        CupertinoIcons.chevron_left,
                        color: Color(0xffDA6317),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Fill in your bio to get started',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'This data will be displayed in your account profile for security',
                      style: TextStyle(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFieldForm(
                      hintText: 'First Name',
                      onchanged: (value) => first_name = value,
                      prefix_icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFieldForm(
                      hintText: 'Last name',
                      onchanged: (value) => last_name = value,
                      prefix_icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFieldForm(
                      hintText: 'Mobile Number',
                      onchanged: (value) => mobile_number = value,
                      prefix_icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CustomButton(
                      buttonText: 'Next',
                      onPressed: () {
                        Authentication(context).authenticationUserBio(
                            first_name: first_name!,
                            last_name: last_name!,
                            mobile_number: mobile_number);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
