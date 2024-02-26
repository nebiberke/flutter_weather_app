part of '../view/home_view.dart';

class HomeViewLocationBuilder extends StatelessWidget {
  const HomeViewLocationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LocationService().determinePosition(),
      builder: (context, snap) {
        if (snap.hasData) {
          return BlocProvider<WeatherBloc>(
            create: (context) => Locator.weatherBloc
              ..add(
                FetchWeather(
                  latitude: snap.data!.latitude,
                  longitude: snap.data!.longitude,
                ),
              ),
            child: const HomeView(),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: context.theme.colorScheme.secondary,
              ),
            ),
          );
        }
      },
    );
  }
}
