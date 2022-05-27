// ignore_for_file: prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:wood_analyzer/widgets/button_widget.dart';
import 'package:wood_analyzer/widgets/input_form_widget.dart';

class AnalysisInfoScreen extends StatefulWidget {
  const AnalysisInfoScreen({Key? key}) : super(key: key);

  @override
  _AnalysisInfoScreen createState() => _AnalysisInfoScreen();
}

class _AnalysisInfoScreen extends State<AnalysisInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFA675A1),
        title: const Text('Informações Análise'),
      ),
      body: Center(
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
                  color: Color(0xFFA675A1),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            Column(
              children: [
                InputFormWidget(
                  text: 'Tipo de Pele',
                  type: TextInputType.text,
                ),
                InputFormWidget(
                  text: 'Fototipo',
                  type: TextInputType.text,
                ),
                InputFormWidget(
                  text: 'Informações Adicionais',
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: Dimensions.height40,
                ),
                ButtonWidget(
                  text: 'CARREGAR IMAGEM',
                  route: Routes.diagnostic,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            // If the picture was taken, display it on a new screen.
            Routes.getDiagnosticPage(image.path);
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
