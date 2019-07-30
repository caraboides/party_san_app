import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:immortal/immortal.dart';
import 'package:optional/optional_internal.dart';
import 'model.dart';

class Bands extends InheritedWidget {
  Bands({
    Key key,
    @required Widget child,
    this.bands,
  }) : super(key: key, child: child);

  final ImmortalMap<String, BandData> bands;

  @override
  bool updateShouldNotify(Bands oldWidget) => oldWidget.bands != bands;

  static Optional<BandData> of(BuildContext context, String id) {
    Bands data = context.inheritFromWidgetOfExactType(Bands);
    return data.bands[id];
  }
}

class BandsProvider extends StatefulWidget {
  BandsProvider({
    Key key,
    this.child,
    this.firestore,
  }) : super(key: key);

  final Widget child;
  final Firestore firestore;

  @override
  BandsProviderState createState() => BandsProviderState();
}

class BandsProviderState extends State<BandsProvider> {
  Future<ImmortalMap<String, BandData>> loadInitialData() async {
    final bandRef = widget.firestore
        .collection('festivals')
        .document('party.san_2019')
        .collection('bands');
    return bandRef.getDocuments().then((snapshot) {
      return _parseBands(snapshot.documents);
      // TODO(SF) auch auf init json zurückfallen, wenn liste leer
    }).catchError((error) {
      print(error);
      return DefaultAssetBundle.of(context)
          .loadString("assets/bands.json")
          .then((v) => _parseJsonBands(jsonDecode(v)));
    });
  }

  MapEntry<String, BandData> _parseBand(DocumentSnapshot snapshot) {
    final data = snapshot.data;
    return MapEntry(
      snapshot.documentID,
      BandData(
        name: snapshot.documentID,
        image: data['img'],
        logo: data['logo'],
        origin: data['origin'],
        style: data['style'],
        roots: data['roots'],
        spotify: data['spotify'],
        text: data['description'],
      ),
    );
  }

  ImmortalMap<String, BandData> _parseBands(List<DocumentSnapshot> snapshots) =>
      ImmortalMap.fromEntriesIterable(snapshots.map(_parseBand));

  ImmortalMap<String, BandData> _parseJsonBands(Map<String, dynamic> jsonMap) =>
      ImmortalMap(jsonMap.map<String, BandData>(_parseJsonBand));

  MapEntry<String, BandData> _parseJsonBand(
          String bandName, Map<String, dynamic> data) =>
      MapEntry(
        bandName,
        BandData(
          name: bandName,
          image: data['img'],
          logo: data['logo'],
          origin: data['origin'],
          style: data['style'],
          roots: data['roots'],
          spotify: data['spotify'],
          text: data['description'],
        ),
      );

  /// Map of bands by name
  ImmortalMap<String, BandData> _bands = ImmortalMap<String, BandData>.empty();

  @override
  void initState() {
    super.initState();
    loadInitialData().then((bands) {
      setState(() {
        _bands = bands;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Bands(
      bands: _bands,
      child: widget.child,
    );
  }
}
