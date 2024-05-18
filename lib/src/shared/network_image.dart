import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  final BorderRadius borderRadius;

  const ImageNetwork(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageUrl),
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(
          CupertinoIcons.photo_fill_on_rectangle_fill,
          size: 50,
          color: Colors.grey,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          child: child,
        );
      },
    );
  }
}
