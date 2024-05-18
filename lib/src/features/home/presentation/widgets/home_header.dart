part of 'imports_widgets_home.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const HomeTopBar(),
          Padding(
            padding: context.isMobile
                ? AppInsets.horizontalInsets(context) +
                    EdgeInsets.symmetric(vertical: 32.0.toH(context))
                : EdgeInsets.symmetric(
                      horizontal: 52.0.toW(context),
                    ) +
                    EdgeInsets.symmetric(vertical: 52.0.toH(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.header('Hi Heinry-Anselm,'),
                SizedBox(height: 8.0.toH(context)),
                AppText.subTitle(
                    'Here is an overview of your account activities.'),
              ],
            ),
          ),
        ],
      ),
    ); 
  }
}
