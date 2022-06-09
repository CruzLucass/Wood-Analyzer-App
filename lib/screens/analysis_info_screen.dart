// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:wood_analyzer/controllers/pacient_controller.dart';

import 'package:wood_analyzer/screens/diagnostic_image.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:wood_analyzer/widgets/title_widget.dart';

import 'package:gallery_saver/gallery_saver.dart';

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

  List<String> phototypes = [
    'Pele extremamente branca',
    'Pele branca',
    'Pele morena clara',
    'Pele morena moderada',
    'Pele morena escura',
    'Pele negra'
  ];
  String? selectedItem = 'Pele extremamente branca';

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);

      //setState(() => this.image = imageTemporary);
      //final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imageTemporary);

      await GallerySaver.saveImage(image.path);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiagnosticImageScreen(
            imagePath: image.path,
            email: widget.email,
          ),
        ),
      );
    } on PlatformException catch (e) {
      // ignore: avoid_print
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: Dimensions.width400,
                padding: EdgeInsets.only(
                  right: Dimensions.padding20,
                  left: Dimensions.padding20,
                ),
                child: TitleWidget(
                  text: 'Entre com as informações de análise.',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            child: DropdownButtonFormField<String>(
                              value: selectedItem,
                              items: phototypes
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              decoration: InputDecoration(
                                labelText: 'Fototipo',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onChanged: (item) =>
                                  setState(() => phototype = item.toString()),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Tipo de Pele',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
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
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Informações Adicionais',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
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
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                PacientController()
                                    .updatePacient(
                                  moreInformation,
                                  phototype,
                                  skinType,
                                  widget.email,
                                )
                                    .then((result) {
                                  if (result == null) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        'Informações adicionadas com sucesso',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ));
                                    _formKey.currentState!.reset();
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        'Ocorreu um erro ao salvar as informações',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ));
                                  }
                                });
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
                                  color: AppColors.textColor),
                            ),
                          ),
                          SizedBox(
                            height: 20,
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
      ),
    );
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
