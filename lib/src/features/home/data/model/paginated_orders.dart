// import 'package:predictiva/src/features/home/data/model/order_model.dart';
//
// class PaginatedOrders {
//   List<OrderModel> orders;
//   int currentPage;
//   final int itemsPerPage;
//   final int totalItems;
//
//   PaginatedOrders({
//     required this.orders,
//     this.currentPage = 1,
//     this.itemsPerPage = 5,
//     required this.totalItems,
//   });
//
//   String get displayText {
//     int startItem = (currentPage - 1) * itemsPerPage + 1;
//     int endItem = startItem + itemsPerPage - 1;
//     if (endItem > totalItems) {
//       endItem = totalItems;
//     }
//     return '$startItem-$endItem of $totalItems trades';
//   }
//
//   bool get isLeftArrowDisabled => currentPage == 1;
//   bool get isRightArrowDisabled => currentPage * itemsPerPage >= totalItems;
//
//   void nextPage() {
//     if (!isRightArrowDisabled) {
//       currentPage++;
//       _updateOrdersForCurrentPage();
//     }
//   }
//
//   void previousPage() {
//     if (!isLeftArrowDisabled) {
//       currentPage--;
//       _updateOrdersForCurrentPage();
//     }
//   }
//
//   void _updateOrdersForCurrentPage() {
//     int start = (currentPage - 1) * itemsPerPage;
//     int end = start + itemsPerPage;
//
//     end = end > totalItems ? totalItems : end;
//
//     start = start > totalItems ? totalItems : start;
//
//     // If the total number of items is 0 or the start index is beyond the total items, set orders to empty
//     if (totalItems == 0 || start >= totalItems) {
//       orders = [];
//     } else {
//       // Adjust the sublist to ensure it's within the bounds of the orders list
//       orders = orders.sublist(start, end);
//     }
//   }
// }
