import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wood_analyzer/models/pacient_model.dart';

class PacientController {
  Future<String?> addPacient(PacientModel pacient) async {
    try {
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('pacient');

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

      // final docRef = pacients.where('email', isEqualTo: email);

      // final id = docRef.get().then((value) => {
      //       value.docs.forEach((doc) {
      //         doc.id;
      //       })
      //     });

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
}
