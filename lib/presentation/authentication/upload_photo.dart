import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_ninja/presentation/authentication/congrat.dart';

import '../components/custom_button.dart';

class UploadPhotoPage extends StatelessWidget {
  const UploadPhotoPage({Key? key}) : super(key: key);

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
                    'Upload Your Photo Profile',
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
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/images/gallery_icon.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/images/camera_icon.png',
                    height: 80,
                    width: 80,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CongratPage(),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
