import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/custom_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mask_background.png'),
              fit: BoxFit.cover,
            ),
          ),
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
                  'Forgot password?',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 80),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Select which contact details should we use to reset your password',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  onTap: () {

                  },
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  leading: SvgPicture.asset('assets/icons/message_icon.svg'),
                  title: Text('Via sms:'),
                  subtitle: Text('xxxx xxxx 5423'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  onTap: () {

                  },
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  leading: SvgPicture.asset('assets/icons/email_icon.svg'),
                  title: Text('Via email:'),
                  subtitle: Text('xxxxx @gmail.com'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
