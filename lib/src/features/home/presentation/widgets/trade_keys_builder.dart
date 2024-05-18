part of 'imports_widgets_home.dart';

class TradeKeysBuilder extends StatelessWidget {
  const TradeKeysBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24.0.toH(context),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TradeTitle('Symbol'),
          _TradeTitle('Price'),
          _TradeTitle('Type'),
          _TradeTitle('Action'),
          _TradeTitle('Quantity'),
          _TradeTitle('Date'),
        ],
      ),
    );
  }
}

class _TradeTitle extends StatelessWidget {
  const _TradeTitle(this.title);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppText(
        title,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
