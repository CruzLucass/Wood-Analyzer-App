// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;

    String? _password;
    String? _email;

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Dimensions.height300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFA675A1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height160,
                      width: Dimensions.width160,
                      child: Image.asset(
                        'images/logo1.jpg',
                      ),
                    ),
                    Center(
                      child: Text(
                        'Faça Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
