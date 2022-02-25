import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:photo_view/photo_view_gallery.dart';
//import 'package:photo_view/photo_view.dart';




// class GallaryPage extends StatefulWidget {
//    GallaryPage({Key? key, required this.urlImages, this.index=0,
//       }): pageController =  PageController(initialPage: index);
//
//
//   final PageController pageController;
//   final List<String> urlImages;
//   final int index;
//   @override
//   _GallaryPageState createState() => _GallaryPageState();
// }
//
// class _GallaryPageState extends State<GallaryPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PhotoViewGallery.builder(
//         pageController: widget.pageController,
//           itemCount: widget.urlImages.length,
//           builder: (context, index) {
//             final urlImage = widget.urlImages[index];
//
//             return PhotoViewGalleryPageOptions(
//               imageProvider: NetworkImage(urlImage),
//               minScale: PhotoViewComputedScale.contained,
//               maxScale: PhotoViewComputedScale.contained * 4,
//             );
//           },
//       ),
//     );
//   }
// }

class PhotoDetails extends StatefulWidget {
  const PhotoDetails({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  _PhotoDetailsState createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails>
     with SingleTickerProviderStateMixin {
  final double minScale = 1;
  final double maxScale = 4;

  late TransformationController __controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    super.initState();

    __controller = TransformationController();
    animationController = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() => __controller.value = animation!.value);
  }

  @override
  void dispose() {
      __controller.dispose();
      animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
      child: InteractiveViewer(
        transformationController: __controller,
        clipBehavior: Clip.none,
        panEnabled: false,
        minScale: minScale,
        maxScale: maxScale,
        onInteractionEnd: (details){
          resetAnimation();
        },
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SvgPicture.network(widget.imagePath,
               fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );

  void resetAnimation(){
    animation = Matrix4Tween(
      begin: __controller.value,
      end: Matrix4.identity(),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease)
    );
    animationController.forward(from: 0);
  }
}
