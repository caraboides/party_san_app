import 'package:flutter/material.dart';
import 'package:dcache/dcache.dart';

import 'openWeather.dart';
import 'utils.dart';

Cache c = SimpleCache<int, List<Weather>>(storage: SimpleStorage(size: 1));

class WeatherWidget extends StatefulWidget {
  WeatherWidget(
    this.date, {
    Key key,
  }) : super(key: key);

  final DateTime date;

  @override
  State<StatefulWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Widget _lastWeather;

  Future<List<Weather>> _loadWeather() {
    WeatherStation weatherStation =
        WeatherStation("4b62a945622a3c28596f5a03a346a0a9");
    int currenthour = DateTime.now().hour;
    List<Weather> oldValue = c.get(currenthour);
    if (oldValue != null) {
      return Future.value(oldValue);
    } else {
      return weatherStation.fiveDayForecast().then((value) {
        c.set(currenthour, value);
        return Future.value(value);
      });
    }
  }

  Weather getWeatherForDate(List<Weather> weathers, DateTime date) =>
      weathers.firstWhere(
        (current) => isSameDay(current.date, date), // TODO(SF) korrekt?
        orElse: () => null,
      );

  Widget _buildWeatherCard(Weather weather) => Card(
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${weather.temperature.celsius.toStringAsFixed(1)}°C  ${weather.weatherDescription}",
              ),
              Image.network(
                "http://openweathermap.org/img/wn/${weather.weatherIcon}@2x.png",
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Weather>>(
      future: _loadWeather(),
      builder: (BuildContext context, AsyncSnapshot<List<Weather>> list) {
        switch (list.connectionState) {
          case ConnectionState.done:
            if (list.hasError) return Text('Error: ${list.error}');
            Weather weather = getWeatherForDate(list.data, widget.date);
            if (weather == null) {
              return _lastWeather ?? Container();
            }
            _lastWeather = _buildWeatherCard(weather);
            return _lastWeather;
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
          default:
            return _lastWeather ?? Container();
        }
      },
    );
  }
}
