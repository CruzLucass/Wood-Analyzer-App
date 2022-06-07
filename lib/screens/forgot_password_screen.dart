// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wood_analyzer/auth/authentication.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: Dimensions.height300,
              decoration: BoxDecoration(
                color: AppColors.lilasColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(
                      right: Dimensions.width300,
                      top: Dimensions.height20,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.login);
                      },
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    alignment: Alignment.center,
                    child: Text(
                      'Recuperação de senha',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.lightColor,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    child: Text(
                      'Receba uma email para trocar sua senha.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(color: AppColors.textColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        validator: _validarEmail,
                        onSaved: (value) => email = value,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          Authentication().resetPassword(email!).then((result) {
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Email enviado com sucesso.',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              );
                              Get.offNamed(Routes.login);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'Erro ao enviar email. $result',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ));
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: AppColors.lilasColor,
                        fixedSize: Size(
                          300,
                          50,
                        ),
                      ),
                      child: Text(
                        'Recuperar Senha',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

String? _validarEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return "Informe o Email";
  } else if (!regExp.hasMatch(value)) {
    return "Email inválido";
  } else {
    return null;
  }
}
