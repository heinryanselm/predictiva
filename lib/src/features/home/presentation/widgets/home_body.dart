part of 'imports_widgets_home.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.controller,
  });

  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
      valueListenable: controller.state,
      builder: (BuildContext context, HomeState state, Widget? child) {
        if (HomeState.loading == state || HomeState.initial == state) {
          return const SliverFillRemaining(
            child: Center(
              child: AppLoader(),
            ),
          );
        } else if (HomeState.error == state) {
          return SliverFillRemaining(
            child: Center(
              child: AppErrorWidget(
                error: 'An error occurred',
                onRetry: controller.getData,
              ),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildListDelegate(
            [
              TransactionActivityCard(portfolio: controller.portfolio),
              OpenTradesCard(orders: controller.orders),
            ],
          ),
        );
      },
    );
  }
}
