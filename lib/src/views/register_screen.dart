import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import '../models/user.dart'; // Assuming User.dart is in the same directory

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  // Add other controllers for additional fields

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    // Dispose other controllers
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse(
            'https://yourbackend.com/register'), // Replace with your API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': _emailController.text,
          'userName': _usernameController.text,
          'password': _passwordController.text, // Server will handle hashing
          "firstName": _firstNameController.text,
          "lastName": _lastNameController.text,
          "age": _ageController.text,
          // Add other fields
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        // You might want to navigate the user to the login screen or a confirmation screen
      } else {
        // Handle error response
        // You might want to show an error message
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              // Add other fields in a similar way
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'firstName'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a firstName';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'LastName'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a LastName';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _registerUser,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
