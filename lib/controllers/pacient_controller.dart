import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wood_analyzer/models/pacient_model.dart';

class PacientController {
  Future<String?> addPacient(PacientModel pacient) async {
    try {
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('pacient');

      await pacients.add(
        pacient.toJson(),
      );

      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
