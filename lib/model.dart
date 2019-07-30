import 'package:flutter/material.dart';
import 'package:optional/optional.dart';

class Event {
  final String bandName;
  final String id;
  final String stage;
  final DateTime start;
  final DateTime end;

  Event({
    this.bandName,
    this.id,
    this.stage,
    this.start,
    this.end,
  });
}

class Faq {
  final String question;
  final String answer;

  Faq({
    this.question,
    this.answer,
  });
}

class BandData {
  final String name;
  final String spotify;
  final String image;
  final String logo;
  final String origin;
  final String style;
  final String roots;
  final String text;

  BandData({
    this.name,
    this.spotify,
    this.image,
    this.logo,
    this.origin,
    this.style,
    this.roots,
    this.text,
  });
}

class MySchedule {
  final Map<String, int> _mySchedule;

  const MySchedule([this._mySchedule = const {}]);

  bool isEventLiked(String eventId) => _mySchedule[eventId] != null;

  Optional<int> getEventNotificationId(String eventId) =>
      Optional.ofNullable(_mySchedule[eventId]);

  void toggleEvent(
    String eventId, {
    ValueChanged<int> onRemove,
    ValueGetter<Future<int>> getValueToInsert,
    VoidCallback onUpdate,
  }) {
    Optional.ofNullable(
      _mySchedule.remove(eventId),
    ).ifPresent((notificationId) {
      onRemove(notificationId);
      onUpdate();
    }, orElse: () async {
      _mySchedule[eventId] = await getValueToInsert();
      onUpdate();
    });
  }

  Map<String, int> toJson() => _mySchedule;

  MySchedule createCopy() => MySchedule(_mySchedule);

  bool get isEmpty => _mySchedule.isEmpty;
}
