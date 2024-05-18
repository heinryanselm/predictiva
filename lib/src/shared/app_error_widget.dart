import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;
  const AppErrorWidget({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          error,
          style: const TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: () {
            // Do something
          },
          child: const Text('retry'),
        ),
      ],
    );
  }
}
