import 'package:flutter/material.dart';
import 'child_widget.dart';
import 'package:todolist/theme.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {

  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Scaffold(
            body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 25),
                  FlatButton(
                    onPressed: () {
                      pageController.animateToPage(2, duration: Duration(milliseconds: 450),
                      curve: Curves.linear);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Skip', style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                        SizedBox(width: 5),
                        Image.asset('assets/vector-skip.png',
                          width: 8,
                          height: 10,
                          fit: BoxFit.fill)
                      ],
                    ),
                  ),
                SizedBox(
              height: 5,
            ),
            Container(
              // color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 36),
              child: Image.asset('assets/1.png',
                width: 350,
                height: 300,
                fit: BoxFit.cover,),
            ),
            Stack(
              children: [
                Image.asset('assets/gelombang-merah.png',
                  width: 750,
                  height: 660,
                  fit: BoxFit.cover),
                Container(
                  margin: EdgeInsets.only(top: 155, left: 36),
                    child: Text(
                      'Welcome to\nAking',
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 30
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 260, left: 36),
                    child: Text(
                      'whats going to happen tomorrow?',
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 14
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 310, right: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.brightness_1, color: whiteColor, size: 12),
                      SizedBox(width: 5),
                      Icon(Icons.brightness_1, color: Color.fromRGBO(255, 255, 255, 0.35), size: 12),
                      SizedBox(width: 5),
                      Icon(Icons.brightness_1, color: Color.fromRGBO(255, 255, 255, 0.35), size: 12)
                    ],
                  ),
                ),
              ],),
          ],
        ),
              ),
          ),
          ChildWidgets2(),
          ChildWidgets3()
        ],
      
      ),
    );

    
  }
}