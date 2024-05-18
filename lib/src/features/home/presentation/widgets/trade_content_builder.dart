part of 'imports_widgets_home.dart';

class TradeContentBuilder extends StatefulWidget {
  final List<OrderModel> orders;

  const TradeContentBuilder({
    super.key,
    required this.orders,
  });

  @override
  TradeContentBuilderState createState() => TradeContentBuilderState();
}

class TradeContentBuilderState extends State<TradeContentBuilder> {
  List<OrderModel> displayedOrders = [];
  List<OrderModel> orders = [];
  int currentPage = 1; // Start with page 1
  int itemsPerPage = 5;
  int totalItems = 0;
  bool isLeftArrowDisabled = true;
  bool isRightArrowDisabled = false;

  String get displayText {
    int startItem = (currentPage - 1) * itemsPerPage + 1;
    int endItem = startItem + itemsPerPage - 1;
    if (endItem > totalItems) {
      endItem = totalItems;
    }
    return '$startItem-$endItem of $totalItems trades';
  }

  void _updateOrdersForCurrentPage() {
    int start = (currentPage - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    end = end > totalItems ? totalItems : end;
    start = start > totalItems ? totalItems : start;

    if (totalItems == 0 || start >= totalItems) {
      displayedOrders = [];
    } else {
      displayedOrders = orders.sublist(start, end);
    }
    // Update arrow states
    isRightArrowDisabled = currentPage * itemsPerPage >= totalItems;
    isLeftArrowDisabled = currentPage == 1;
  }

  void onNextPage() {
    if (!isRightArrowDisabled) {
      setState(() {
        currentPage++;
        _updateOrdersForCurrentPage();
      });
    }
  }

  void onPreviousPage() {
    if (!isLeftArrowDisabled) {
      setState(() {
        currentPage--;
        _updateOrdersForCurrentPage();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    orders = widget.orders;
    totalItems = orders.length;
    _updateOrdersForCurrentPage();
  }

  @override
  Widget build(BuildContext context) {
    final itemHeight = context.isMobile ? 87.0 : 120.0;
    double totalHeight =
        displayedOrders.isEmpty ? 0 : displayedOrders.length * itemHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (displayedOrders.isEmpty)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'No more orders to display.',
              style: TextStyle(fontSize: 16),
            ),
          )
        else
          SizedBox(
            height: totalHeight,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: displayedOrders.length,
              separatorBuilder: (context, index) => const AppDivider(),
              itemBuilder: (context, itemIndex) {
                final order = displayedOrders[itemIndex];
                return TradeContent(trade: order);
              },
            ),
          ),
        Visibility(
          visible: context.isMobile,
          replacement: SizedBox(height: 16.toH(context)),
          child: const AppDivider(),
        ),
        Row(
          children: [
            AppText(
              displayText,
              fontSize: 14,
              color: AppColors.subTitle,
            ),
            const Spacer(),
            ButtonArrow(
              icon: Icons.arrow_back_ios,
              isDisabled: isLeftArrowDisabled,
              onTap: onPreviousPage,
            ),
            const SizedBox(width: 8),
            ButtonArrow(
              icon: Icons.arrow_forward_ios,
              isDisabled: isRightArrowDisabled,
              onTap: onNextPage,
            ),
          ],
        ),
      ],
    );
  }
}
