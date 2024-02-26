part of '../view/home_view.dart';

class _HomeViewLoadedWidget extends StatefulWidget {
  const _HomeViewLoadedWidget({required this.weather});
  final WeatherApiEntity weather;

  @override
  State<_HomeViewLoadedWidget> createState() => _HomeViewLoadedWidgetState();
}

class _HomeViewLoadedWidgetState extends State<_HomeViewLoadedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeViewAppBarWidget(weather: widget.weather),
        _HomeViewWeatherCardWidget(weather: widget.weather),
        _HomeViewWeatherDetailCardWidget(weather: widget.weather),
      ],
    );
  }
}
