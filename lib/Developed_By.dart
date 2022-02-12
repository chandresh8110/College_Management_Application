import 'package:flutter/material.dart';
//import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'EventPage.dart';
import 'GallaryPage.dart';
import 'slider/MenuWidget.dart';



// class DeveloperPage extends StatefulWidget {
//   const DeveloperPage({Key? key}) : super(key: key);
//
//   @override
//   _DeveloperPageState createState() => _DeveloperPageState();
// }
//
// class _DeveloperPageState extends State<DeveloperPage> {
//   final urlImages = [
//     'https://picsum.photos/seed/image008/2144/1424'
//     'https://picsum.photos/seed/image009/2144/1424'
//     'https://picsum.photos/seed/image010/2144/1424'
//     'https://picsum.photos/seed/image011/2144/1424'
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Theme(
//       data: ThemeData.light(),
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: Colors.blue,
//               floating: true,
//               //pinned: true,
//               title: Text('DeveloperPage'),
//               leading: MenuWidget(),
//             ),
//             SliverGrid(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 //maxCrossAxisExtent: 100.0,
//                 mainAxisSpacing: 0,
//                 crossAxisSpacing: 5,
//                 //childAspectRatio: 0.75,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                       (BuildContext context,int index) {
//                     return InkWell(
//                       child: Ink.image(
//                           image: NetworkImage(urlImages.first)
//                       ),
//                       onTap:openGallery,
//                     );
//                   }
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void openGallery() {
//     Navigator.push(context, MaterialPageRoute(
//       builder: (context) => GallaryPage(
//         urlImages: urlImages,
//       ),
//     ),
//     );
//   }
// }




class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: true,
            //pinned: true,
            title: Text('DeveloperPage'),
            leading: MenuWidget(),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              //maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 0,
              crossAxisSpacing: 5,
              //childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index){
                return RawMaterialButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PhotoDetails(
                          imagePath: networkNames[index]
                      ),
                    ),
                    );
                  },
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(15),
                  //     image: DecorationImage(
                  //       image: NetworkImage(_images[index].imagePath),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: _edgeInsertsForIndex(index),
                    child: Image.asset(
                      networkNames[index % networkNames.length],
                    ),
                  ),
                );
              },childCount: networkNames.length,
            ),
          ),
        ],
      ),
    );
  }
}

EdgeInsets _edgeInsertsForIndex(int index) {
  if (index % 2 == 0) {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  } else
  {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  }
}

// class ImageDetails{
//   final String imagePath;
//
//
//   ImageDetails({
//     required this.imagePath,
//
//   });
// }

final List <String> networkNames = [
  'images/Developer_Team/Brijesh.png',
  'images/Developer_Team/Chandresh.png',
  'images/Developer_Team/Hardik.png',
  'images/Developer_Team/Ashmin.png',

];
