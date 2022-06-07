import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wood_analyzer/models/pacient_model.dart';

class PacientController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

  Future<String?> addPacient(PacientModel pacient) async {
    try {
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('pacient');

      pacient.professional = _auth.currentUser!.email;

      await pacients.doc(pacient.email).set(
            pacient.toMap(),
          );

      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<String?> updatePacient(String moreInformation, String phototype,
      String skinType, String email) async {
    try {
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('pacient');

      await pacients.doc(email).update({
        'moreInformation': moreInformation,
        'phototype': phototype,
        'skinType': skinType,
      });

      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Stream<DocumentSnapshot?> getInfoPacient(String email) {
    CollectionReference pacients =
        FirebaseFirestore.instance.collection('pacient');
    return pacients.doc(email).snapshots();
  }

//TODO: testar se o método vai listar todos os documentos do p
  CollectionReference<Object?> getAllDiagnostics() {
    CollectionReference pacients =
        FirebaseFirestore.instance.collection('pacient');
    return pacients
      ..where('professional', isEqualTo: _auth.currentUser!.email).get();
  }
}
