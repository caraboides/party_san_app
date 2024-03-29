import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

import 'festival_config.dart';
import 'i18n.dart';
import 'menu.dart';

class About extends StatelessWidget {
  Widget _buildLink(
    ThemeData theme,
    String url, {
    String label,
    bool shrink = false,
  }) =>
      FlatButton(
        textColor: theme.accentColor,
        child: Text(label ?? url),
        onPressed: () => launch(url),
        materialTapTargetSize: shrink
            ? MaterialTapTargetSize.shrinkWrap
            : MaterialTapTargetSize.padded,
      );

  Widget _buildCreator(
    String name,
    List<Widget> links, {
    bool heartIcon = false,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            heartIcon ? Icons.favorite : Icons.star,
            color: heartIcon ? Colors.purple : Colors.white70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(name),
              ),
              ...links,
            ],
          )
        ],
      );

  Widget get divider => Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Divider(color: FestivalTheme.dividerColor, height: 1),
      );

  @override
  Widget build(BuildContext context) {
    final i18n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        textTheme: Typography.whiteMountainView,
      ),
      child: Scaffold(
        drawer: const Menu(),
        appBar: AppBar(
          title: Text(
            i18n.about,
            style: FestivalTheme.appBarTextStyle,
          ),
        ),
        backgroundColor: theme.primaryColor,
        body: ListView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
          children: <Widget>[
            Text(i18n.appDescription(festivalFullName)),
            Align(
              alignment: Alignment.center,
              child: _buildLink(theme, 'https://www.party-san.de'),
            ),
            Text(i18n.sourceCodeUnder),
            Align(
              alignment: Alignment.center,
              child: _buildLink(
                  theme, 'https://github.com/caraboides/party_san_app'),
            ),
            divider,
            SizedBox(height: 5),
            Text(i18n.aboutCreated),
            SizedBox(height: 10),
            _buildCreator(
              'Stephanie Freitag',
              <Widget>[
                _buildLink(theme, 'https://github.com/strangeAeon',
                    shrink: true),
              ],
              heartIcon: true,
            ),
            _buildCreator(
              'Christian Hennig',
              <Widget>[
                _buildLink(theme, 'https://github.com/caraboides',
                    shrink: true),
                _buildLink(theme, 'https://twitter.com/carabiodes',
                    label: '@carabiodes', shrink: true),
              ],
              heartIcon: true,
            ),
            divider,
            SizedBox(height: 5),
            _buildCreator(i18n.weatherDataBy, <Widget>[
              _buildLink(theme, 'https://openweathermap.org', shrink: true),
            ]),
            _buildCreator(i18n.fontBy('Pirata One'), <Widget>[
              _buildLink(theme, 'http://www.rfuenzalida.com/',
                  label: 'Rodrigo Fuenzalida', shrink: true),
            ]),
            divider,
            GestureDetector(
              child: Image.asset('assets/mar.gif'),
              onTap: () => launch('http://www.metalheadsagainstracism.org/'),
            ),
            SizedBox(height: 8),
            divider,
            SizedBox(height: 5),
            RaisedButton(
              color: theme.accentColor,
              child: Text(
                  MaterialLocalizations.of(context).viewLicensesButtonLabel),
              onPressed: () async {
                final packageInfo = await PackageInfo.fromPlatform();
                showLicensePage(
                  context: context,
                  applicationName: '$festivalName App',
                  applicationVersion: packageInfo.version,
                  applicationLegalese: i18n.aboutLicense,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
