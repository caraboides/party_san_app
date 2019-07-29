import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config.dart';

Future<Firestore> initFirestore() async {
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'init',
    options: firebaseOptions,
  );
  final Firestore firestore = Firestore(app: app);
  await firestore.settings(
    timestampsInSnapshotsEnabled: true,
    sslEnabled: true,
  );
  return firestore;
}

// Future<void> runInitFirebaseApp() async {
//   final Firestore firestore = await initFirestore();

//   runApp(
//     MaterialApp(
//       title: 'Firestore Example',
//       home: InitFirebasePage(
//         firestore: firestore,
//       ),
//     ),
//   );
// }

// class InitFirebasePage extends StatelessWidget {
//   InitFirebasePage({this.firestore});

//   final Firestore firestore;

//   Future<void> _initSchedule(BuildContext context) async {
//     final List<dynamic> schedule = await DefaultAssetBundle.of(context)
//         .loadString("assets/initial_schedule.json")
//         .then((v) => Future.value(jsonDecode(v)));
//     final scheduleRef = firestore
//         .collection('festivals')
//         .document('party.san_2019')
//         .collection('schedule');
//     final existingSchedule = await scheduleRef.getDocuments();
//     existingSchedule.documents.forEach((documentSnapshot) async {
//       await documentSnapshot.reference.delete();
//       print('Deleted event ${documentSnapshot.documentID}');
//     });
//     var counter = 0;
//     print('0/${schedule.length}');
//     schedule.forEach((event) async {
//       event['updated'] = Timestamp.now();
//       event['start'] = Timestamp.fromDate(DateTime.parse(event['start']));
//       event['end'] = Timestamp.fromDate(DateTime.parse(event['end']));
//       final docRef = await scheduleRef.add(event);
//       print('Wrote event ${docRef.documentID}');
//       print('${++counter}/${schedule.length}');
//     });
//   }

//   Future<void> _initBands(BuildContext context) async {
//     final Map<String, dynamic> bands = await DefaultAssetBundle.of(context)
//         .loadString("assets/bands.json")
//         .then((v) => Future.value(jsonDecode(v)));
//     final bandRef = firestore
//         .collection('festivals')
//         .document('party.san_2019')
//         .collection('bands');
//     var counter = 0;
//     print('0/${bands.length}');
//     bands.forEach((bandName, data) async {
//       await bandRef.document(bandName).setData(data);
//       print('Wrote band $bandName');
//       print('${++counter}/${bands.length}');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RaisedButton(
//         child: Text('Init data'),
//         onPressed: () => _initBands(context),
//       ),
//     );
//   }
// }
