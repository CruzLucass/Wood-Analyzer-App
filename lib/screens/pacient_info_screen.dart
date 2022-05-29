// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wood_analyzer/auth/authentication.dart';
import 'package:wood_analyzer/controllers/pacient_controller.dart';
import 'package:wood_analyzer/models/pacient_model.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:wood_analyzer/widgets/title_widget.dart';

class PacientInfoScreen extends StatefulWidget {
  const PacientInfoScreen({Key? key}) : super(key: key);

  @override
  _PacientInfoScreenState createState() => _PacientInfoScreenState();
}

class _PacientInfoScreenState extends State<PacientInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String mobilephone;
  late int age;
  //final PacientController _pacientController = PacientController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFA675A1),
        title: const Text('Cadastro do paciente'),
        actions: [
          IconButton(
            onPressed: () {
              Authentication().signOut().then(
                    (value) => Get.offNamed(Routes.login),
                  );
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitleWidget(
                text: 'Informações do paciente para o relatório',
              ),
              SizedBox(height: Dimensions.height40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Nome completo',
                        suffixIcon: Padding(
                          child: Icon(Icons.person),
                          padding: EdgeInsets.all(5),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O nome é obrigatório';
                        } else {
                          name = value;
                        }
                        return null;
                      },
                      onChanged: (value) => name = value,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        suffixIcon: Padding(
                          child: Icon(Icons.email),
                          padding: EdgeInsets.all(5),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O e-mail é obrigatório';
                        } else {
                          email = value;
                        }
                        return null;
                      },
                      onChanged: (value) => email = value,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Idade',
                        suffixIcon: Padding(
                          child: Icon(
                            Icons.perm_contact_calendar_sharp,
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A idade é obrigatório';
                        } else {
                          age = int.parse(value);
                        }
                        return null;
                      },
                      onChanged: (value) => age = int.parse(value),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O celular é obrigatório';
                        } else {
                          mobilephone = value;
                        }
                        return null;
                      },
                      onChanged: (value) => mobilephone = value,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          CollectionReference pacients = FirebaseFirestore.instance.collection('pacient');

                          await pacients.add(
                            {
                              'name': name,
                              'email': email,
                              'age': age,
                            },
                          ).then(
                            (value) => Get.offNamed(Routes.analysisInfo),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        primary: AppColors.lightColor,
                        fixedSize: Size(
                          300,
                          Dimensions.height50,
                        ),
                      ),
                      child: Text(
                        'Salvar',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
