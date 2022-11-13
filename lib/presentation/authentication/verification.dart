import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  'Enter 4-digit\nVerification code',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 50),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Code send to your email. This code will expired in 01:30',
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

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
