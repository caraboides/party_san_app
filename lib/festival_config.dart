import 'package:flutter/material.dart';
import 'package:immortal/immortal.dart';

CrossAxisAlignment stageAlignment(String stage) =>
    stage == 'Mainstage' ? CrossAxisAlignment.start : CrossAxisAlignment.end;

ImmortalList<DateTime> get days => ImmortalList<DateTime>([
      DateTime(2019, 8, 8),
      DateTime(2019, 8, 9),
      DateTime(2019, 8, 10),
    ]);

Duration daySwitchOffset = Duration(hours: 3);

const String festivalName = 'Party.San';

const String geoLocationQuery = 'lat=51.25&lon=10.67';

class FestivalTheme {
  static final ThemeData theme = ThemeData(
    primaryColor: Colors.grey[850],
    accentColor: Color(0xFFD2D522),
    textTheme: Typography.blackMountainView.copyWith(
      headline: TextStyle(
        fontFamily: 'Pirata One',
        fontSize: 28,
        color: Colors.black,
      ),
      display1: TextStyle(
        fontFamily: 'Pirata One',
        fontSize: 26,
        color: Colors.white,
      ),
      title: TextStyle(
        fontFamily: 'Pirata One',
        fontSize: 24,
        color: Colors.black,
      ),
    ),
  );

  static final Color menuBackgroundColor = theme.primaryColor;
  static final Color menuIconColor = theme.accentColor.withOpacity(0.87);

  static final TextStyle appBarTextStyle = theme.textTheme.display1;
  static final TextStyle bandNameTextStyle = theme.textTheme.headline;
  static final TextStyle bandDetailTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
  static const TextStyle eventBandTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
  static const TextStyle eventDateTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.black54,
  );
  static const TextStyle eventStageTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.black87,
  );
  static final TextStyle menuEntryTextStyle = theme.textTheme.title.copyWith(
    color: theme.accentColor,
  );
}
