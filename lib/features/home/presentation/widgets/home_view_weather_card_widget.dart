part of '../view/home_view.dart';

class _HomeViewWeatherCardWidget extends StatelessWidget {
  const _HomeViewWeatherCardWidget({required this.weather});
  final WeatherApiEntity weather;
  // Get the weather icon based on the weather code
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/images/weather/1.png',
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/images/weather/2.png',
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/images/weather/3.png',
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/images/weather/4.png',
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/images/weather/5.png',
        );
      case 800:
        return Image.asset(
          'assets/images/weather/6.png',
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/images/weather/7.png',
        );

      default:
        return Image.asset(
          'assets/images/weather/7.png',
        );
    }
  }

  // Get the greeting based on the time of the day
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return LocaleKeys.good_morning.tr();
    } else if (hour < 18) {
      return LocaleKeys.good_afternoon.tr();
    } else {
      return LocaleKeys.good_evening.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Weather card
        Align(
          child: Container(
            margin: EdgeInsets.only(top: context.defaultValue + 50)
                .add(context.paddingHorizontalHigh),
            padding: context.paddingTopHigh,
            height: context.isMinecraft
                ? context.veryhighValue4x * 0.9
                : context.veryhighValue3x,
            width: context.isMinecraft
                ? context.veryhighValue4x * 0.9
                : context.veryhighValue3x,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.theme.colorScheme.secondaryContainer,
                  context.theme.colorScheme.secondary,
                ],
              ),
              borderRadius: ThemeConstants.mediumBorderRadiusCircular,
            ),
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white24,
                    ],
                  ).createShader(bounds),
                  child: Text(
                    weather.weather[0].main,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white10,
                    ],
                  ).createShader(bounds),
                  child: Text(
                    '${weather.main.temp.round()}°',
                    style: context.textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Greeting text
        Align(
          child: Text(
            getGreeting(),
            style: GoogleFonts.engagement(
              textStyle: context.textTheme.displayMedium?.copyWith(
                color: context.theme.colorScheme.tertiary,
              ),
            ),
          ),
        ),
        // Weather icon
        Align(
          child: Padding(
            padding: context.paddingTopHigh * (context.isMinecraft ? 6 : 4.5),
            child: SizedBox(
              width: context.veryhighValue4x,
              child: getWeatherIcon(
                weather.weather[0].id,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
