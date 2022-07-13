import 'package:flutter/material.dart';
import 'package:todolist/dashboard/home_screen.dart';
import 'package:todolist/theme.dart';
import 'walktrough.dart';

// class ChildWidgets1 extends StatefulWidget {

//   @override
//   State<ChildWidgets1> createState() => _ChildWidgets1State();
// }

// class _ChildWidgets1State extends State<ChildWidgets1> {

//   final controller = ScrollController();
//   var currentIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: NeverScrollableScrollPhysics(),
//           child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             SizedBox(
//               height: 25,
//             ),
//             FlatButton(
//               onPressed: () {
                
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text('Skip', style: blackTextStyle.copyWith(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                   ),),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Image.asset('assets/vector-skip.png',
//                   width: 8,
//                   height: 10,
//                   fit: BoxFit.fill)
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               // color: Colors.black,
//               margin: EdgeInsets.symmetric(horizontal: 36),
//               child: Image.asset('assets/1.png',
//                 width: 350,
//                 height: 300,
//                 fit: BoxFit.cover,),
//             ),
//             Stack(
//               children: [
//                 Image.asset('assets/gelombang-merah.png',
//                   width: 750,
//                   height: 660,
//                   fit: BoxFit.cover),
//                 Container(
//                   margin: EdgeInsets.only(top: 155, left: 36),
//                     child: Text(
//                       'Welcome to\nAking',
//                       style: whiteTextStyle.copyWith(
//                         fontWeight: FontWeight.w800,
//                         fontSize: 30
//                       ),
//                     ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 260, left: 36),
//                     child: Text(
//                       'whats going to happen tomorrow?',
//                       style: whiteTextStyle.copyWith(
//                         fontWeight: FontWeight.w300,
//                         fontSize: 14
//                       ),
//                     ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 310, right: 36),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Icon(Icons.brightness_1, color: whiteColor, size: 12),
//                       SizedBox(width: 5),
//                       Icon(Icons.brightness_1, color: Color.fromRGBO(255, 255, 255, 0.35), size: 12),
//                       SizedBox(width: 5),
//                       Icon(Icons.brightness_1, color: Color.fromRGBO(255, 255, 255, 0.35), size: 12)
//                     ],
//                   ),
//                 ),
//               ],),
//           ],
//         ),
//               ),
//     );
//   }
// }

class ChildWidgets2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 95,
            ),
            Container(
              // color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 36),
              child: Image.asset('assets/illustration2.png',
                width: 350,
                height: 275,
                fit: BoxFit.cover,),
            ),
            Stack(
              children: [
                Image.asset('assets/gelombang-biru.png',
                  width: 500,
                  height: 850,
                  fit: BoxFit.cover),
                Container(
                  margin: EdgeInsets.only(top: 165, left: 36),
                    child: Text(
                      'Work Happens',
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 30
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 225, left: 36),
                    child: Text(
                      'Get notified when work happens.',
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 14
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 320, right: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.brightness_1, color: Color.fromRGBO(255, 255, 255, 0.35), size: 12),
                      SizedBox(width: 5),
                      Icon(Icons.brightness_1, color: whiteColor, size: 12),
                      SizedBox(width: 5),
                      Icon(Icons.brightness_1, color: Color.fromRGBO(255, 255, 255, 0.35), size: 12)
                    ],
                  ),
                ),
              ],),
          ],
        ),
              ),
    );
  }
}

class ChildWidgets3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 75,
            ),
            Container(
              // color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 36),
              child: Image.asset('assets/illustration3.png',
                width: 350,
                height: 250,
                fit: BoxFit.cover,),
            ),
            Stack(
              children: [
                Image.asset('assets/gelombang-ungu.png',
                  width: 750,
                  height: 690,
                  fit: BoxFit.cover),
                Container(
                  margin: EdgeInsets.only(top: 155, left: 36),
                    child: Text(
                      'Tasks and Assign',
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 30
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 215, left: 36),
                    child: Text(
                      'Task and assign them to colleage',
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 14
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 275, left: 36),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: RaisedButton(
                      color: whiteColor,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder:(context) => HomeScreen(),
                        ));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Get Started',
                        style: purpleTextStyle,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 365, right: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.brightness_1, color: Color.fromRGBO(255, 255, 255, 0.35), size: 12),
                      SizedBox(width: 5),
                      Icon(Icons.brightness_1, color: Color.fromRGBO(255, 255, 255, 0.35), size: 12),
                      SizedBox(width: 5),
                      Icon(Icons.brightness_1, color: whiteColor, size: 12)
                    ],
                  ),
                ),
              ],),
          ],
        ),
              ),
    );
  }
}