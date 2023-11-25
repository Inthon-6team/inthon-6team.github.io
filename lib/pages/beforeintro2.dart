import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/components/image_data.dart';
import 'package:inthon_frontend/pages/intro.dart';
import 'package:inthon_frontend/pages/login.dart';

class BeforeIntro2 extends StatefulWidget {
  const BeforeIntro2({super.key});

  @override
  State<BeforeIntro2> createState() => _BeforeIntro2State();
}

class _BeforeIntro2State extends State<BeforeIntro2> {
  double opacity1 = 1.0;

  @override
  void initState() {
    super.initState();
    fadeInImage();
  }

  fadeInImage() {
    Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        opacity1 = 1.0;
      });

      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Intro()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Text(
                "멀리서도\n가족과 함께",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  color: Color(0xff000000),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 430,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  /*Container(
                    width: 393,
                    height: 175,
                    child: ImageData(IconsPath.intro2),
                  ),*/
                  AnimatedOpacity(
                    opacity: opacity1,
                    duration: Duration(seconds: 3),
                    child: Container(
                      width: 393,
                      height: 421,
                      child: ImageData(IconsPath.pressedintro),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 30),
            AnimatedOpacity(
              opacity: opacity1,
              duration: Duration(seconds: 3),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Intro()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: (size.width - 283.238) / 2),
                  width: 283.238,
                  height: 36.813,
                  decoration: BoxDecoration(
                    color: Color(0xffd9ae89),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    "Click to sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
                    ),
                  )),
                ),
              ),
            ),
          ],
        ));
  }
}
