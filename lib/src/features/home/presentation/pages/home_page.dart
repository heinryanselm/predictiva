part of 'imports_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    homeController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            AppOnRefresh(onRefresh: homeController.onRefresh),
            const HomeHeader(),
            HomeBody(controller: homeController),
          ],
        ),
      ),
    );
  }
}
