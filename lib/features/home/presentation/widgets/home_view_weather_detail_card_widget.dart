part of '../view/home_view.dart';

class _HomeViewWeatherDetailCardWidget extends StatelessWidget {
  const _HomeViewWeatherDetailCardWidget({required this.weather});
  final WeatherApiEntity weather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: context.defaultValue + 20).add(
              EdgeInsets.only(
                bottom: context.defaultValue + (context.isMinecraft ? 0 : 75),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.defaultValue,
              vertical: context.defaultValue,
            ),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onPrimary,
              borderRadius: ThemeConstants.defaultBorderRadiusCircular,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sunrise
                SizedBox(
                  width: context.dynamicWidth(66),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sunny,
                        color: context.theme.colorScheme.onSecondary,
                      ),
                      Text(
                        LocaleKeys.weather_detail_sunrise.tr(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                      Text(
                        DateFormat().add_jm().format(
                              weather.sys.sunrise.toDateTime(),
                            ),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Sunset
                SizedBox(
                  width: context.dynamicWidth(66),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.nightlight_round,
                        color: context.theme.colorScheme.onSecondary,
                      ),
                      Text(
                        LocaleKeys.weather_detail_sunset.tr(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                      Text(
                        DateFormat().add_jm().format(
                              weather.sys.sunset.toDateTime(),
                            ),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Max temperature
                SizedBox(
                  width: context.dynamicWidth(66),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.thermostat,
                        color: context.theme.colorScheme.onSecondary,
                      ),
                      Text(
                        LocaleKeys.weather_detail_temp_max.tr(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                      Text(
                        '${weather.main.tempMax.round()} °C',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Min temperature
                SizedBox(
                  width: context.dynamicWidth(66),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.thermostat_outlined,
                        color: context.theme.colorScheme.onSecondary,
                      ),
                      Text(
                        LocaleKeys.weather_detail_temp_min.tr(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                      Text(
                        '${weather.main.tempMin.round()}°C',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
