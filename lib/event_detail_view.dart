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
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                  Text(
                    '${i18n.dateTimeFormat.format(event.start.toLocal())}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FestivalTheme.eventDateTextStyle,
                  ),
                  Text(
                    event.stage,
                    style: FestivalTheme.eventStageTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 20),
              child: Text(data.map((a) => a.text).orElse(i18n.noInfo)),
            ),
            data
                .map<Widget>((d) => d.spotify != null
                    ? RaisedButton(
                        color: theme.accentColor,
                        onPressed: () {
                          launch(d.spotify);
                        },
                        child: Text(
                          "Play on Spotify",
                        ),
                      )
                    : Container())
                .orElse(Container()),
            //data.map((d) => Image.network(d.image)).orElse(Image.asset("")),
          ],
        ),
      ),
    );
  }
}
