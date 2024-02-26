part of '../view/home_view.dart';

class _HomeViewBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingAllDefault,
      height: context.height * (context.isMinecraft ? 0.92 : 0.84),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        borderRadius: BorderRadius.all(ThemeConstants.mediumRadiusCircular),
      ),
    );
  }
}
