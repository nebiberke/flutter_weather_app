part of '../view/home_view.dart';

class _HomeViewAppBarWidget extends StatelessWidget {
  const _HomeViewAppBarWidget({required this.weather});
  final WeatherApiEntity weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalHigh.add(
        EdgeInsets.only(
          top: context.statusBarHeight + 15.h,
          bottom: 10.h,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Weather date and location
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('dd, MMM yyyy').format(weather.dt.toDateTime()),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.colorScheme.surface,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/icons/location.svg',
                      colorFilter: ColorFilter.mode(
                        context.theme.colorScheme.onSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      ' ${weather.name}',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Theme switch
          Align(
            alignment: Alignment.centerRight,
            child: Switch(
              thumbColor: MaterialStatePropertyAll(
                context.theme.colorScheme.tertiary,
              ),
              trackOutlineColor:
                  MaterialStatePropertyAll(context.theme.colorScheme.outline),
              trackOutlineWidth: const MaterialStatePropertyAll(1),
              thumbIcon: MaterialStatePropertyAll(
                context.watch<ThemeCubit>().state.themeMode ==
                            ThemeMode.light ||
                        (context.watch<ThemeCubit>().state.themeMode ==
                                ThemeMode.system &&
                            context.mediaQuery.platformBrightness ==
                                Brightness.light)
                    ? const Icon(Icons.sunny)
                    : const Icon(Icons.nightlight_round),
              ),
              activeTrackColor: context.theme.colorScheme.primary,
              inactiveTrackColor: context.theme.colorScheme.primary,
              value: context.watch<ThemeCubit>().state.themeMode ==
                      ThemeMode.light ||
                  (context.watch<ThemeCubit>().state.themeMode ==
                          ThemeMode.system &&
                      context.mediaQuery.platformBrightness ==
                          Brightness.light),
              onChanged: (value) {
                context.read<ThemeCubit>().changeTheme(
                      brightness: value ? Brightness.dark : Brightness.light,
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
