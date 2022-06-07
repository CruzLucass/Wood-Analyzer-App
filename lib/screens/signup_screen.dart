// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wood_analyzer/auth/authentication.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? name;
  late String mobilephone;
  bool _obscureText = false;

  bool agree = false;

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
                    alignment: Alignment.center,
                    child: Text(
                      'Faça seu cadastro',
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
                      'Este aplicativo vai te ajudar nos diagnósticos dos seus pacientes.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
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
                          labelText: 'Nome',
                          labelStyle: TextStyle(color: AppColors.textColor),
                          suffixIcon: Padding(
                            child: Icon(Icons.person),
                            padding: EdgeInsets.all(5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O nome é obrigatório';
                          } else {
                            name = value;
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(color: AppColors.textColor),
                          suffixIcon: Padding(
                            child: Icon(Icons.email),
                            padding: EdgeInsets.all(5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        validator: _validarEmail,
                        onSaved: (value) => email = value,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_obscureText,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: AppColors.textColor),
                          suffixIcon: Padding(
                            child: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            padding: EdgeInsets.all(5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'A senha é obrigatória';
                          } else {
                            password = value;
                          }
                          return null;
                        },
                        onChanged: (value) => password = value,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        inputFormatters: [
                          MaskTextInputFormatter(mask: "(##) # ####-####"),
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Celular',
                          suffixIcon: Padding(
                            child: Icon(
                              Icons.phone,
                            ),
                            padding: EdgeInsets.all(5),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: _validarCelular,
                        onChanged: (value) => mobilephone = value,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          onChanged: (_) {
                            setState(() {
                              agree = !agree;
                            });
                          },
                          value: agree,
                        ),
                        Flexible(
                          child: Text(
                              'Ao criar uma conta, concordo com os Termos e Condições e a Política de Privacidade.'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
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

                          Authentication()
                              .signUp(
                            email: email!,
                            password: password!,
                            name: name!,
                            mobilephone: mobilephone,
                          )
                              .then((result) {
                            if (result == null) {
                              Get.offNamed(Routes.login);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'Erro ao salvar usuário',
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
                          Dimensions.width350,
                          50,
                        ),
                      ),
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

String? _validarCelular(String? value) {
  if (value!.isEmpty) {
    return "Informe o celular";
  }
  return null;
}
