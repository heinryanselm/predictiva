import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppOnRefresh extends StatelessWidget {
  const AppOnRefresh({
    super.key,
    required this.onRefresh,
  });

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: onRefresh,
      builder: (context, refreshState, pulledExtent, refreshTriggerPullDistance,
          refreshIndicatorExtent) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: refreshIndicatorExtent,
          alignment: Alignment.center,
          child: Opacity(
            opacity: min(pulledExtent / refreshTriggerPullDistance, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  // Icon
                  refreshState == RefreshIndicatorMode.drag
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                ),
                Text(
                  refreshState == RefreshIndicatorMode.drag
                      ? 'Pull to refresh'
                      : refreshState == RefreshIndicatorMode.armed
                          ? 'Release to refresh'
                          : 'Refreshing...',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
