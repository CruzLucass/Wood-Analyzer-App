// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wood_analyzer/controllers/pacient_controller.dart';
import 'package:wood_analyzer/routes/routes.dart';

import 'package:wood_analyzer/screens/diagnostic_image.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

class AnalysisInfoScreen extends StatefulWidget {
  final String email;
  const AnalysisInfoScreen({Key? key, required this.email}) : super(key: key);

  @override
  _AnalysisInfoScreen createState() => _AnalysisInfoScreen();
}

class _AnalysisInfoScreen extends State<AnalysisInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  late String moreInformation;
  late String skinType;
  late String phototype;
  late String urlPhoto;
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);

      //setState(() => this.image = imageTemporary);
      //final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imageTemporary);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiagnosticImageScreen(imagePath: image.path),
        ),
      );
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.lilasColor,
          title: const Text('Informações Análise'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Dimensions.width400,
                  padding: EdgeInsets.only(
                    right: Dimensions.padding20,
                    left: Dimensions.padding20,
                  ),
                  child: Text(
                    'Entre com as informações de análise.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.lilasColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height40,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Tipo de Pele',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'O Tipo de Pele é obrigatório';
                                } else {
                                  skinType = value;
                                }
                                return null;
                              },
                              onChanged: (value) => skinType = value,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Fototipo',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'O Fototipo é obrigatório';
                                } else {
                                  phototype = value;
                                }
                                return null;
                              },
                              onChanged: (value) => phototype = value,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Informações Adicionais',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'A Informações Adicionais é obrigatório';
                                } else {
                                  moreInformation = value;
                                }
                                return null;
                              },
                              onChanged: (value) => moreInformation = value,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  PacientController()
                                      .updatePacient(moreInformation, phototype,
                                          skinType, widget.email)
                                      .then((result) {
                                    if (result == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Informações adicionadas com sucesso',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ));
                                      _formKey.currentState!.reset();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Ocorreu um erro ao salvar as informações',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ));
                                    }
                                  });
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
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height40,
                            ),
                            buildButton(
                              title: 'Tirar Foto',
                              icon: Icons.camera_alt_outlined,
                              onClicked: () => pickImage(ImageSource.camera),
                            ),
                            buildButton(
                              title: 'Selecionar da Galeria',
                              icon: Icons.image_outlined,
                              onClicked: () => pickImage(ImageSource.gallery),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget buildButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    Container(
      width: Dimensions.width350,
      margin:
          EdgeInsets.fromLTRB(0, Dimensions.height10, 0, Dimensions.height10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(Dimensions.height50),
          primary: AppColors.lilasColor,
          onPrimary: Colors.white,
          textStyle: TextStyle(fontSize: Dimensions.font20),
        ),
        child: Row(
          children: [
            Icon(icon, size: Dimensions.icon28),
            SizedBox(width: Dimensions.width16),
            Text(title),
          ],
        ),
        onPressed: onClicked,
      ),
    );

class ImageWidget extends StatelessWidget {
  final File image;
  final ValueChanged<ImageSource> onClicked;

  const ImageWidget({
    Key? key,
    required this.image,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(context),
          Positioned(
            bottom: 0, right: 4, child: Text(''), //buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    final imagePath = this.image.path;
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(
            File(imagePath),
          );

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 160,
          height: 160,
          child: InkWell(
            onTap: () async {
              final source = await showImageSource(context);
              if (source == null) return;

              onClicked(source);
            },
          ),
        ),
      ),
    );
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(ImageSource.camera),
              child: Text('Camera'),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
              child: Text('Gallery'),
            ),
          ],
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        ),
      );
    }
  }
}
