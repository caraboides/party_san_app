import 'package:flutter/material.dart';
import 'package:immortal/immortal.dart';

CrossAxisAlignment stageAlignment(stage) =>
    stage == "Mainstage" ? CrossAxisAlignment.start : CrossAxisAlignment.end;

ImmortalList<DateTime> get days => ImmortalList<DateTime>([
      DateTime(2019, 8, 8),
      DateTime(2019, 8, 9),
      DateTime(2019, 8, 10),
    ]);

const String festivalName = 'Party.San';

const String geoLocationQuery = 'lat=51.25&' + 'lon=10.67&';
