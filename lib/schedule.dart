import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:immortal/immortal.dart';

import 'festival_config.dart';
import 'model.dart';
import 'utils.dart';

typedef EventFilter = ImmortalList<Event> Function(BuildContext context);

class Schedule extends InheritedWidget {
  Schedule({
    Key key,
    @required Widget child,
    this.events,
  }) : super(key: key, child: child);

  final ImmortalList<Event> events;

  static ImmortalList<Event> of(BuildContext context) {
    Schedule schedule = context.inheritFromWidgetOfExactType(Schedule);
    return schedule.events;
  }

  static ImmortalList<Event> allBandsOf(BuildContext context) =>
      of(context).sort((a, b) => a.bandName.compareTo(b.bandName));

  static EventFilter dayOf(DateTime date) =>
      (BuildContext context) => of(context)
          .where((item) => isSameDay(item.start, date, offset: daySwitchOffset))
          .sort((a, b) => a.start.compareTo(b.start));

  @override
  bool updateShouldNotify(Schedule oldWidget) => oldWidget.events != events;
}

class ScheduleProvider extends StatefulWidget {
  ScheduleProvider({
    Key key,
    this.child,
    this.firestore,
  }) : super(key: key);

  final Widget child;
  final Firestore firestore;

  @override
  ScheduleProviderState createState() => ScheduleProviderState();
}

class ScheduleProviderState extends State<ScheduleProvider> {
  Future<ImmortalList<Event>> loadInitialData() async {
    final scheduleRef = widget.firestore
        .collection('festivals')
        .document('party.san_2019')
        .collection('schedule');
    return scheduleRef.getDocuments().then((snapshot) {
      return parseEvents(snapshot.documents);
      // TODO(SF) auch auf init json zurückfallen, wenn liste leer
      // TODO(SF) reschedule notifications for updates
    }).catchError((error) {
      print(error);
      return DefaultAssetBundle.of(context)
          .loadString("assets/initial_schedule.json")
          .then((v) => parseJsonEvents(jsonDecode(v)));
    });
  }

  Event _buildEventFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data;
    return Event(
      bandName: data['band'],
      id: snapshot.documentID,
      stage: data['stage'],
      start: data['start'].toDate(),
      end: data['end'].toDate(),
    );
  }

  ImmortalList<Event> parseEvents(List<DocumentSnapshot> snapshots) =>
      ImmortalList(snapshots.map(_buildEventFromSnapshot));

  Event _buildEventFromJson(Map<String, dynamic> json) => Event(
        bandName: json['band'],
        id: json['id'], // TODO(SF) nicht enthalten!
        stage: json['stage'],
        start: DateTime.parse(json['start']), // TODO(SF) korrekt?
        end: DateTime.parse(json['end']),
      );

  ImmortalList<Event> parseJsonEvents(List<dynamic> json) =>
      ImmortalList(json.map<Event>(_buildEventFromJson));

  /// List of events
  ImmortalList<Event> _events = ImmortalList<Event>.empty();

  @override
  void initState() {
    super.initState();
    loadInitialData().then((newEvents) {
      setState(() {
        _events = newEvents;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Schedule(
      events: _events,
      child: widget.child,
    );
  }
}
