import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ImageType { network, asset, svg }

typedef ImageMetaData = (ImageType? type, String? url);

class ImageView extends StatefulWidget {
  const ImageView({
    super.key,
    required this.child,
    required this.imageMetaData,
    this.minScale = 0.0,
    this.maxScale = 1.0,
    this.onDownloadImage,
    this.tag,
    this.showOptions = true,
  });

  final Widget child;
  final ImageMetaData imageMetaData;
  final double minScale;
  final double maxScale;
  final Future Function(ImageMetaData? data)? onDownloadImage;
  final String? tag;
  final bool showOptions;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  double minScale = 0.0;
  double maxScale = 1.0;

  void onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy > 0) {
      Navigator.pop(context);
    } else if (details.velocity.pixelsPerSecond.dy < 0) {
      Navigator.pop(context);
    }
  }

  void onScaleEnd(ScaleEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy > 0) {
      Navigator.pop(context);
    } else if (details.velocity.pixelsPerSecond.dy < 0) {
      Navigator.pop(context);
    }
  }

  // zooms in and out
  void onDoubleClick() {
    if (minScale == 0.0) {
      setState(() {
        minScale = 0.5;
        maxScale = 2.0;
      });
    } else {
      setState(() {
        minScale = 0.0;
        maxScale = 1.0;
      });
    }
  }

  bool isAppBarVisible = true;

  void changeAppBarVisibility() {
    setState(() {
      isAppBarVisible = !isAppBarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: !widget.showOptions ? null : () {},
      onDoubleTap: onDoubleClick,
      onScaleEnd: onScaleEnd,
      onVerticalDragEnd: onDragEnd,
      onTap: changeAppBarVisibility,
      child: Scaffold(
        backgroundColor: Colors.black,
        // primary: false,
        extendBodyBehindAppBar: true,
        appBar: isAppBarVisible
            ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: const BackButton(),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                ),
                actions: !widget.showOptions ? [] : [],
              )
            : null,
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height,
              ),
              child: InteractiveViewer(
                minScale: minScale + 0.1,
                maxScale: maxScale + 0.1,
                scaleFactor: 1.0,
                child: widget.tag != null && widget.tag!.isNotEmpty
                    ? Hero(
                        tag: widget.tag ?? "",
                        child: widget.child,
                      )
                    : widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
