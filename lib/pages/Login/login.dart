import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sales/API/login.dart';
import 'package:sales/pages/Menu/home.dart';
import 'package:sales/theme.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  final username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Text('Login',
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: ungucerah),
              textAlign: TextAlign.center),
          Container(
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
            height: 170,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/truk.png'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username',
                      style: TextStyle(
                          color: ungucerah, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    cursorColor: white,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(color: white),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                    decoration: InputDecoration(
                        suffixIconColor: white,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: white, width: 0.0),
                            borderRadius: BorderRadius.circular(12.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: white, width: 0.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        hintText: 'Masukkan Username Anda',
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        hintStyle: TextStyle(color: white, fontSize: 13),
                        fillColor: ungucerah),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        color: ungucerah, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    cursorColor: white,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(color: white),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                    decoration: InputDecoration(
                        suffixIconColor: white,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: white, width: 0.0),
                            borderRadius: BorderRadius.circular(12.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: white, width: 0.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        hintText: 'Masukkan Password Anda',
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        hintStyle: TextStyle(color: white, fontSize: 13),
                        fillColor: ungucerah),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: SizedBox(
                      width: 90,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            try {
                              final data = await loginApi(_username, _password);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(token: data['token'])));
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: white)),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ungucerah,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
