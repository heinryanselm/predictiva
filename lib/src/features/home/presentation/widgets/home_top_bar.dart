part of 'imports_widgets_home.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79.0.toH(context),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        border: Border(
          bottom: BorderSide(
            color: AppColors.divider,
            width: 1.0.toH(context),
          ),
        ),
      ),
    );
  }
}
