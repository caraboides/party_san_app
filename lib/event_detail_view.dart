import 'package:flutter/material.dart';
import 'package:optional/optional_internal.dart';
import 'package:url_launcher/url_launcher.dart';

import 'band.dart';
import 'festival_config.dart';
import 'i18n.dart';
import 'model.dart';
import 'my_schedule.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView(this.event);

  final Event event;

  String _buildFlag(String country) =>
      String.fromCharCodes(country.runes.map((code) => code + 127397));

  List<Widget> _buildDetails(
          ThemeData theme, AppLocalizations i18n, BandData data) =>
      <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 15),
          child: Text(data.text),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 75,
                child: Text(
                  '${i18n.origin}:',
                  style: FestivalTheme.bandDetailTextStyle,
                ),
              ),
              Text(_buildFlag(data.origin)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 75,
                child: Text(
                  '${i18n.style}:',
                  style: FestivalTheme.bandDetailTextStyle,
                ),
              ),
              Text(data.style),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 75,
                child: Text(
                  '${i18n.roots}:',
                  style: FestivalTheme.bandDetailTextStyle,
                ),
              ),
              Text(data.roots),
            ],
          ),
        ),
        if (data.spotify != null)
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15),
            child: RaisedButton(
              color: theme.accentColor,
              onPressed: () {
                launch(data.spotify);
              },
              child: Text(
                "Play on Spotify",
              ),
            ),
          ),
        // Padding(
        //   padding: EdgeInsets.only(top: 15),
        //   child: Image.network(data.image),
        // ),
      ];

  @override
  Widget build(BuildContext context) {
    final myScheduleController = MyScheduleController.of(context);
    final i18n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final Optional<BandData> data = Bands.of(context, event.bandName);
    final isLiked = myScheduleController.mySchedule.isEventLiked(event.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          i18n.eventDetailsHeader,
          style: FestivalTheme.appBarTextStyle,
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            // data.map<Widget>((d) => Image.network(d.logo)).orElse(Container()),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                event.bandName.toUpperCase(),
                style: FestivalTheme.bandNameTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 20, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(isLiked ? Icons.star : Icons.star_border),
                    tooltip: isLiked
                        ? i18n.removeEventFromSchedule
                        : i18n.addEventToSchedule,
                    onPressed: () =>
                        myScheduleController.toggleEvent(i18n, event),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      '${i18n.dateTimeFormat.format(event.start.toLocal())}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FestivalTheme.eventDateTextStyle,
                    ),
                  ),
                  Text(
                    event.stage,
                    style: FestivalTheme.eventStageTextStyle,
                  ),
                ],
              ),
            ),
            ...data
                .map<List<Widget>>((d) => _buildDetails(theme, i18n, d))
                .orElse(<Widget>[
              Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 20),
                alignment: Alignment.center,
                child: Text(i18n.noInfo),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
