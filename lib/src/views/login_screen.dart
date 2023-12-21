import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    void toggleVisibility() {
      setState(() {
        isHidden = !isHidden;
      });
    }

    return Scaffold(
        backgroundColor: Colors.black45,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              title: Text('Login'),
              // backgroundColor: Colors.black45,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10), // Here specify the radius
                ),
              ),
            )),
        body: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/app-background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        obscureText: isHidden,
                        decoration: InputDecoration(
                          // fillColor: Colors.white,
                          // filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: isHidden
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: toggleVisibility,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ]));
  }
}
