import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_ninja/presentation/authentication/congrat.dart';

import '../components/text_form_field.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mask_background.png'),
              ),
            ),
            child: ListView(
              children: [
                //heading
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Find Your Favorite Food',
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Color(0xFFFAFDFF),
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        elevation: 8,
                      ),
                      padding: EdgeInsets.all(10),
                      onPressed: () {},
                      icon: Icon(Icons.notifications_none),
                    ),
                  ],
                ),
                //search
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF9A84D),
                          hintText: 'What do you want to order?',
                          hintStyle: TextStyle(color: Color(0xFFDA6317)),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(style: BorderStyle.none)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFFDA6317),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color(0xFFF9A84D),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      icon: SvgPicture.asset('assets/icons/filter_icon.svg'),
                    )
                  ],
                ),
                //Slidding
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Color(0xFF53E88B), Color(0xFF15BE77)]),
                      image: DecorationImage(
                          image: AssetImage('assets/images/fish_bg.png'),
                          fit: BoxFit.fitWidth
                      )),
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'assets/images/ice_cream.png',
                              alignment: Alignment.bottomRight,
                            ),
                          )),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Special Deal For October',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            TextButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 40,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: Text(
                                'Buy Now',
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //Nearest Resturant
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearest Resturant',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          'View More',
                          style: TextStyle(
                            color: Color(0xFFFF7C32),
                          ),
                        ))
                  ]
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Container(
                          height: 20,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x125A6CEA),
                                  // color: Color.fromRGBO(90, 108, 234, 0.07),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: Offset(12, 26))
                            ],
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/vegan_image.png'),
                              Text('Vegan'),
                              Text('12 mins'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Menu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View More',
                          style: TextStyle(
                            color: Color(0xFFFF7C32),
                          ),
                        ))
                  ],
                ),
                ListTile(
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: Image.asset('assets/images/food1.png'),
                  title: Text(
                    'Green Noodle',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  subtitle: Text('Noodle Home'),
                  trailing: Text(
                    '\$15',
                    style: TextStyle(
                        color: Color(0xFFFEAD1D),
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
