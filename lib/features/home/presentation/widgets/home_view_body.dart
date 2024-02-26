part of '../view/home_view.dart';

class _HomeViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return switch (state.blocState) {
          BlocState.initial || BlocState.loading => Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: context.theme.colorScheme.secondary,
              ),
            ),
          BlocState.failure => Center(
              child: _buildErrorWidget(state, context),
            ),
          BlocState.loaded => _HomeViewLoadedWidget(weather: state.weather),
        };
      },
    );
  }

  // Show error message based on the failure type
  Text _buildErrorWidget(WeatherState state, BuildContext context) {
    if (state.failure is NetworkFailure) {
      return Text(
        LocaleKeys.errors_network_error.tr(),
        style: context.textTheme.titleLarge?.copyWith(
          color: context.theme.colorScheme.error,
        ),
      );
    } else if (state.failure is NullResponseFailure) {
      return Text(
        LocaleKeys.errors_null_error.tr(),
        style: context.textTheme.titleLarge?.copyWith(
          color: context.theme.colorScheme.error,
        ),
      );
    } else {
      return Text(
        LocaleKeys.errors_unknown_error.tr(),
        style: context.textTheme.titleLarge?.copyWith(
          color: context.theme.colorScheme.error,
        ),
      );
    }
  }
}
