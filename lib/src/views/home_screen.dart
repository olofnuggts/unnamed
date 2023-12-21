import 'package:flutter/material.dart';
import 'package:unnamed/src/views/register_screen.dart';
import '../views/login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            title: Text('Welcome to Unnamed'),
            // backgroundColor: Colors.black45,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10), // Here specify the radius
              ),
            ),
          )),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/app-background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 25,
            right: 25,
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    // child: Text('Log In'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.white12, // Use backgroundColor
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Log In'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the Row

                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.white60),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Sign up tapped");
                          // Navigate to the Sign Up screen
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => SignUpScreen()),
                          // );
                        },
                        child: Text(
                          '\t Sign up',
                          style: TextStyle(
                            color: Colors.blue, // Text color
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration:
                                TextDecoration.underline, // Underline text
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
