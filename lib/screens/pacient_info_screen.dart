// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wood_analyzer/auth/authentication.dart';
import 'package:wood_analyzer/controllers/pacient_controller.dart';
import 'package:wood_analyzer/models/pacient_model.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:wood_analyzer/widgets/title_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: _validarNome,
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: _validarEmail,
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
                          borderRadius: BorderRadius.circular(8),
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
                      onSaved: (value) =>
                          value == "" ? age = 0 : age = int.parse(value!),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
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
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          PacientController().addPacient(
                            PacientModel(
                                name: name,
                                age: age,
                                email: email,
                                mobilephone: mobilephone),
                          );
                          Get.offNamed(
                            Routes.getAnalysisInfo(email),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: AppColors.lightColor,
                        fixedSize: Size(
                          300,
                          50,
                        ),
                      ),
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
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

String? _validarNome(String? value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(patttern);
  if (value!.isEmpty) {
    return "Informe o nome";
  } else if (!regExp.hasMatch(value)) {
    return "O nome deve conter caracteres de a-z ou A-Z";
  }
  return null;
}

String? _validarCelular(String? value) {
  if (value!.isEmpty) {
    return "Informe o celular";
  }
  return null;
}
