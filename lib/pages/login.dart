import 'package:flutter/material.dart';
import 'package:inthon_frontend/components/image_data.dart';
import '../app.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _idcontroller = TextEditingController();
  bool _isDisabled = true;

  @override
  void dispose() {
    _idcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Text(
                  'Welcome !',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                  ),
                )),
            SizedBox(height: 38),
            Container(
                child: Text(
              'Sign In',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 50,
              child: TextFormField(
                controller: _idcontroller,
                enabled: true,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.50,
                    color: _isDisabled ? Color(0xff9e9e9e) : Color(0xff212121)),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'ID',
                  hintStyle: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    letterSpacing: -0.50,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // 원하는 모양으로 조절
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // 원하는 모양으로 조절
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 50,
              child: TextFormField(
                controller: _idcontroller,
                enabled: true,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.50,
                    color: _isDisabled ? Color(0xff9e9e9e) : Color(0xff212121)),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    letterSpacing: -0.50,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // 원하는 모양으로 조절
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // 원하는 모양으로 조절
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(160, 10, 0, 0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFFA6633C),
                    decoration: TextDecoration.underline,
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => App()));
                },
                child: Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFFD9AE89),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xFFD9AE89),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(children: [
                  SizedBox(width: 45.0),
                  ImageData(IconsPath.googlelogo, width: 20, height: 20),
                  SizedBox(width: 10.0),
                  Text(
                    'Sign In with Google',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(70, 10, 0, 0),
                    child: Text(
                      'Don\'t have an acount?',
                      style: TextStyle(
                        color: Color(0xFF9F9F9F),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Sign Up!',
                      style: TextStyle(
                        color: Color(0xFFA6633C),
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
