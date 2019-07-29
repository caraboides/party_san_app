import 'package:flutter/material.dart';

CrossAxisAlignment stageAlignment(stage) =>
    stage == "Mainstage" ? CrossAxisAlignment.start : CrossAxisAlignment.end;

List<DateTime> get days => <DateTime>[
      DateTime(2019, 8, 8),
      DateTime(2019, 8, 9),
      DateTime(2019, 8, 10),
    ];

String get festivalName => 'Party.San';
