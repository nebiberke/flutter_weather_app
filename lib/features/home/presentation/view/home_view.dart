import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/app/l10n/app_l10n.g.dart';
import 'package:weather_app/app/theme/cubit/theme_cubit.dart';
import 'package:weather_app/app/theme/theme_constants.dart';
import 'package:weather_app/core/enums/bloc_state.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/services/location_service.dart';
import 'package:weather_app/core/utils/extension/context_extension.dart';
import 'package:weather_app/core/utils/extension/int_extension.dart';
import 'package:weather_app/features/home/domain/entities/api/weather_api_entity.dart';
import 'package:weather_app/features/home/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/locator.dart';

part '../widgets/home_view_appbar_widget.dart';
part '../widgets/home_view_background.dart';
part '../widgets/home_view_body.dart';
part '../widgets/home_view_loaded_widget.dart';
part '../widgets/home_view_location_builder.dart';
part '../widgets/home_view_weather_card_widget.dart';
part '../widgets/home_view_weather_detail_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          _HomeViewBackground(),
          _HomeViewBody(),
        ],
      ),
    );
  }
}
