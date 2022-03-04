// import 'package:final_app/Photo_Gallery/Engineers_day.dart';
// import 'package:final_app/Photo_Gallery/Independence_day.dart';
// import 'package:final_app/Photo_Gallery/Sports.dart';
// import 'package:final_app/Photo_Gallery/Teachers_day.dart';
// import 'package:final_app/Photo_Gallery/Techfest.dart';
// import 'package:final_app/Photo_Gallery/Visits.dart';
// import 'package:flutter/material.dart';
//
//
// class EventPage extends StatelessWidget {
//   const EventPage({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.blue,
//             title: Text(
//               'Photo_Gallery'
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 5),
//               child: Container(),
//             ),
//           ),
//           SliverGrid.count(
//             crossAxisCount: 2,
//             mainAxisSpacing: 5,
//             crossAxisSpacing: 5,
//             children: [
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context,
//                     MaterialPageRoute(
//                         builder:(context)=> Independance_Day()
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 250,
//                   width: 250,
//                   //color: Colors.greenAccent,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('images/Independence day.png'),
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context,
//                     MaterialPageRoute(
//                         builder:(context)=> Engineers_Day()
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 250,
//                   width: 250,
//                   //color: Colors.greenAccent,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('images/engineersday.png'),
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context,
//                     MaterialPageRoute(
//                         builder:(context)=> Sports()
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 250,
//                   width: 250,
//                   //color: Colors.greenAccent,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('images/sports.png'),
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context,
//                     MaterialPageRoute(
//                         builder:(context)=> TechFest()
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 250,
//                   width: 250,
//                   //color: Colors.greenAccent,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('images/techfest.png'),
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context,
//                     MaterialPageRoute(
//                         builder:(context)=> Visits()
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 250,
//                   width: 250,
//                   //color: Colors.greenAccent,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('images/Visit.png'),
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context,
//                     MaterialPageRoute(
//                         builder:(context)=> Teachers_Day()
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 250,
//                   width: 250,
//                   //color: Colors.greenAccent,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('images/Teacher day.png'),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
import 'package:flutter/material.dart';
// import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:transparent_image/transparent_image.dart';
import '../slider/SliderDrawer.dart';
import 'GallaryPage.dart';
import '../slider/MenuWidget.dart';
//import 'package:cached_network_image/cached_network_image.dart';





// class EventPage extends StatelessWidget {
//   const EventPage({Key? key,required this.crossAxisCount,required this.items})
//   // we only plan to use this with 1 or 2 columns
//       : assert(crossAxisCount == 1 || crossAxisCount == 2),
//   // assume we pass an list of 4 items for simplicity
//         assert(items.length == 4),
//         super(key: key);
//   final int crossAxisCount;
//   final List<ItemCardData> items;
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutGrid(
//       // set some flexible track sizes based on the crossAxisCount
//       columnSizes: crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr],
//       // set all the row sizes to auto (self-sizing height)
//       rowSizes: crossAxisCount == 2
//           ? const [auto, auto]
//           : const [auto, auto, auto, auto],
//       rowGap: 40, // equivalent to mainAxisSpacing
//       columnGap: 24, // equivalent to crossAxisSpacing
//       // note: there's no childAspectRatio
//       children: [
//         // render all the cards with *automatic child placement*
//         for (var i = 0; i < items.length; i++)
//           ItemCard(data: items[i]),
//       ],
//     );
//   }
// }
// class EventPage extends StatelessWidget {
//   const EventPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           floating: true,
//           title: Text('EventPage'),
//           leading: MenuWidget(),
//         ),
//         Container(
//           child: StaggeredGridView.countBuilder(
//             crossAxisCount: 3,
//             itemCount: imageList.length,
//             itemBuilder: (context, index) => ImageCard(
//               imageData: imageList[index],
//             ),
//             staggeredTileBuilder: (index) => StaggeredTile.count(
//                 (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
//             mainAxisSpacing: 8.0,
//             crossAxisSpacing: 8.0,
//           ),
//         ),
//       ],
//     ));
//   }
// }

// class ImageCard extends StatelessWidget {
//   const ImageCard({required this.imageData});

//   final ImageData imageData;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16.0),
//       child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
//     );
//   }
// }

// class EventPage extends StatefulWidget {
//   const EventPage({Key? key}) : super(key: key);
//
//   @override
//   _EventPageState createState() => _EventPageState();
// }
//
// class _EventPageState extends State<EventPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('EventPage')),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('imageURLs').snapshots(),
//         builder: (context, snapshot) {
//           return
//                 GridView.builder(
//                 itemCount: snapshot.data!
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.all(3),
//                     child: FadeInImage.memoryNetwork(
//                         fit: BoxFit.cover,
//                         placeholder: kTransparentImage,
//                         image: snapshot.data!.documnets[index].get('url')),
//                   );
//                 });
//         },
//       ),
//     );
//   }
// }

// class EventPage extends StatelessWidget {
//   const EventPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: NestedScrollView(
//       headerSliverBuilder: (context, value) {
//         return [ SliverAppBar(
//           backgroundColor: Colors.blue,
//           floating: true,
//           title: Text('EventPage'),
//           leading: MenuWidget(),
//         ),
//         ];
//       },
//       body: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//           ),
//           itemBuilder: (context, index) {
//             return RawMaterialButton(
//                 onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(
//                       builder: (context) => PhotoDetails(
//                       imagePath: networkNames[index]
//                     ),
//                    ),
//                   );
//                 },
//               // child: Container(
//               //   //alignment: Alignment.center,
//               //   padding: _edgeInsertsForIndex(index),
//               //   child: Image.network(
//               //     networkNames[index % networkNames.length],
//               //     fit: BoxFit.cover,
//               //   ),
//               // ),
//               child: Container(
//                 child: Image(
//                   image: NetworkImage(networkNames[index]),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             );
//           },
//       ),
//     ),
//   );
// }

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              floating: true,
              //pinned: true,
              title: Text('Photo_Gallery_Page'),
              leading: MenuWidget(),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //maxCrossAxisExtent: 100.0,
                mainAxisSpacing: 10,
                crossAxisSpacing: 0,
                //childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PhotoDetails(imagePath: networkNames[index]),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: _edgeInsertsForIndex(index),
                      child: SvgPicture.network(
                        networkNames[index % networkNames.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                childCount: networkNames.length,
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SliderDrawer(),),);
        return false;
      },
    );
  }
}

EdgeInsets _edgeInsertsForIndex(int index) {
  if (index % 2 == 0) {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  } else {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  }
}

//
// // class ImageDetails{
// //   final String imagePath;
// //
// //
// //   ImageDetails({
// //     required this.imagePath,
// //
// //   });
// // }
//
final List<String> networkNames = [
  'http://103.141.241.97/Images/Annual1.svg',
  'http://103.141.241.97/Images/Annual2.svg',
  'http://103.141.241.97/Images/Annual3.svg',
  'http://103.141.241.97/Images/Annual4.svg',
  'http://103.141.241.97/Images/Annual5.svg',
  'http://103.141.241.97/Images/Annual6.svg',
  'http://103.141.241.97/Images/Annual7.svg',
  'http://103.141.241.97/Images/Annual8.svg',
  'http://103.141.241.97/Images/Annual9.svg',
  'http://103.141.241.97/Images/Annual10.svg',
  'http://103.141.241.97/Images/Annual11.svg',
  'http://103.141.241.97/Images/Annual12.svg',
  'http://103.141.241.97/Images/Canteen1.svg',
  'http://103.141.241.97/Images/Canteen2.svg',
  'http://103.141.241.97/Images/Canteen3.svg',
  'http://103.141.241.97/Images/Canteen4.svg',
  'http://103.141.241.97/Images/Canteen5.svg',
  'http://103.141.241.97/Images/Canteen6.svg',
  'http://103.141.241.97/Images/Canteen7.svg',
  'http://103.141.241.97/Images/Canteen8.svg',
  'http://103.141.241.97/Images/Canteen9.svg',
  'http://103.141.241.97/Images/Cele1.svg',
  'http://103.141.241.97/Images/Cele2.svg',
  'http://103.141.241.97/Images/Cele3.svg',
  'http://103.141.241.97/Images/Cele4.svg',
  'http://103.141.241.97/Images/Civil1.svg',
  'http://103.141.241.97/Images/Civil2.svg',
  'http://103.141.241.97/Images/Civil3.svg',
  'http://103.141.241.97/Images/Civil4.svg',
  'http://103.141.241.97/Images/Civil5.svg',
  'http://103.141.241.97/Images/Civil6.svg',
  'http://103.141.241.97/Images/Civil7.svg',
  'http://103.141.241.97/Images/Civil8.svg',
  'http://103.141.241.97/Images/Civil9.svg',
  'http://103.141.241.97/Images/Civil10.svg',
  'http://103.141.241.97/Images/Civil11.svg',
  'http://103.141.241.97/Images/Civil12.svg',
  'http://103.141.241.97/Images/Comp1.svg',
  'http://103.141.241.97/Images/Comp2.svg',
  'http://103.141.241.97/Images/Comp3.svg',
  'http://103.141.241.97/Images/Comp4.svg',
  'http://103.141.241.97/Images/Comp5.svg',
  'http://103.141.241.97/Images/Comp6.svg',
  'http://103.141.241.97/Images/Comp7.svg',
  'http://103.141.241.97/Images/Comp8.svg',
  'http://103.141.241.97/Images/Day1.svg',
  'http://103.141.241.97/Images/Day2.svg',
  'http://103.141.241.97/Images/Day3.svg',
  'http://103.141.241.97/Images/Day4.svg',
  'http://103.141.241.97/Images/Day5.svg',
  'http://103.141.241.97/Images/Day6.svg',



];


// // List<ImageDetails> _images = [
// //   ImageDetails(
// //     imagePath:'https://lh3.googleusercontent.com/IYKah81ztGgLUXGCMJiVpy1uHR_4uNCOISGGjGXBOBb2HyStAnMDKZkmowaxT8V1DVVObq9lAeTDqtcd5-bZbSWwuKgkZOsCCX75V-HiPaODft2iwr76_RgPECHqKYJi89wa785X4jNFOCt5pGK0z8QgzFYBq0tYxMBLzXHMoZW_7zxH4wfNwwvrMoEC6UAvuH1jmWd7vHcRPc7C72XCe8hmn9Sf7dMiDcxuWHGABMhxSNJLlhdnf_pHoOewDbIumbvR-sllm7tq-di-HBZocQih_MpLJKtgUbcC08UQ848aEw4KGAeRpSVyxHGmM0g7Ao6vuCC3-O4bvwT5W_qsRSi-xlHqGxfmtuNzsjkO_WoRQ8YCwG7OkfrRSzR3j1CqgifOJraZmGdsZcKZUEkbTkXGpQI_4ExqTjYzLiS9YUY36aftWyqjbE2vOAN0SIYGzevdIe-Lt_w9n4ghZkLvkFdPa6UxImPXD6IRTe57gz_iKtcrMoJjQNhflLtMVCrFZwokhdZHKBy_h2RcNYh721D7Iy_JOYxMOL2v8-72CnyC2sfKtT5LVnIHXey1IDi3-a_XMNQKngOWg4NbsvyXZj8gwnQQWvrfmBiLEuzSR2sI7iAJPPsEq4e2scKZLVwwO5n8lVV165RF2icJlNkBvVVwcm75_jg5s1I8WEGER5JAViBy3c2TuWXrrwAuGpHFeDleuFdX7Y3A6mpBoPOYZb4=w1409-h933-no?authuser=0',
// //   ),
// //   ImageDetails(
// //       imagePath:'https://lh3.googleusercontent.com/fife/AAWUweWV2Qi1c0bAu8UQXceCk4gVV46DiLY8lt0qs38tWenLbLT26_WmpTRy3Zdpeu4h6CKu4s144CgbVGlMe0ObrU2j7zqEzICUPsPdVrclsXEUEQS2uGENRNK02sMwj_UbIK2_6ct3P67nMOAdVWJWLwY-P9pqJNxEEo7fmcQgf3ixWk3TG_CsZIZ5cd1GSdVKUnJ5lVIl8tXSsOPAW0tNpH-Kbkwl54uV0XWv2HalV8N-JHWw6yb2UZVjWKFieq7cKaCuUXoPgZ_tfyuyjPRiTn5x-FhsuGaD-dKtnhr2Fkf2tozxkBcRi0dY4idExgOBIQPr0ZmISmVvqRW1ZiZRctcH7FR3YWgQ2PyaPW46tPkWzmvqLqJoaMLoA4F77J__I1hLvcNIMpuY4rR0AHOIIWSkPM5sUTPN3aCf8gdQEysxCJuYnElQySsbUsiQ6Bgv-ubAXR62sgo3UAD7TVPSVH-Mya47p99Mf3u5orYxT64TnxGyJh2FwZrq3U51Rv-qYYYlhrFn9NqjS7aokqjBGz6uAh_9k2iEHXhEtSjpYpx3dg0gm0YZSltoW3y55wO7fJTJCKdJpbPigRD7UEO9A2jBEj9v41Y9dZE2yTlePtBsbn4Lffy5SG6WBgu-TshA8d8g_pjouhgEMML3t_WCMNWQKqJdbK4G9Q2X67mObQqOFpsqt5T0Ly4hb4EXJX5xrtpdfd6orUs2mTVWNHya7L29w1W2K1gY-FRRHe9j_si-WnTXhKiFcmayiMgKzk_cb1v2ZLm_QHL4Gku8Boidc_DhTVNlAhiaFAB0e0hcX4wJ_Lo1VFQmM_fQyKo-CSFatJGsTebODf9EHOXX1R8PGuxjN55oUSZk6GaUKh9czSupCAPUNexo-5OmOpnr6XAogIE7xEKV86C3oS4tHkm89sc_IU4c0Fvx6apzzRYcRuRAnwPJtZ72dXEnE_WJU_gEo37GXG_7n6a3sorrup20utIkP6tk-wemvBb23aiq1ZztscDFJuXlxUu0_o_oRk_eRzPCxf6uLcEy0vI_oGZXuMrdY2y5ca14no_XFIv77hceibIlrJ4UD7aeK_G1_lZHtHDko9nc_euAlFbi6f9Xtuj3wHqPdGBfWxKqkn9uqtebDNDn0ERHZZXmBpvq7gOKls4_ebWt8cF6a8BD5kkuSQX--XtMHxGXYN22weZ7ursxCqz7sEdN4Ba6uKVvA3X3iHQD3MNbpiSrC47BZVGuTgvWknXmwb8BvacfDyjGvszxpDfljkSk__JrtkHoQnVpeMwyp4PxMeWBb-nwPqjEXWrXv2PRLwjse03sHMjh5qjnkW_6ZsWAudJy-0fr_9HiPjjF8i-MeRiI6UQA7as-jcBI094gYNq52CiMSPJ8Gt-w2Bof8W7sSuT78kCoNVdLS5abwbTBLISrxBcb7gPAcu2mY63BRo9zepAXPW1io5SGBwZeB_ILSIQ58bckh2B9S69ZrDUOVjkpc75CitwJb4RX6T8BiR4Lcdx4jAeba5mq44pntpdXLqIdhI9nvORkFfoDOBRtyZjivs19_baZM-itdg1qUStyrxRtzkSJfspa8aNEY6ZfKVqjtndrAGAYdaLPlZy18CuWUlWo-gQU-xaND_eioAs0RolwK8ha6OiMkRJvs4vZbnCBWio_Ea8wIzXaxX6EOn4v2UrCFbHEJ88iEnl1ipAJDIJRiZR7DPMT2UfBtYg4mkrxzmQw_dEaXIiKNNKZA0jsBMR1vtCzaf9DzaLplgWL41tk17SH90QuXYYkJg0nZsnrg7l6w9CIKDYCioQMoh2zEH6-_TpYVIpdAcF60qEovfujCIlqAi5ZH3LHha0Rcb8tamOEHwKg1Kl7reqOx4PcNb-Kpe_ziFo1LERvu6SyP-D3e1Q9hw3pZyB5ObVAc3lV1JQg2YOeAYeWj8K5j5JuBIf6O09HfxdM7Dclg9T5TxqJlBjBp2tafCCcaKqbNP3Vlg-yz6JK1of4CKIA5TUcbhK39W4v-Q0Vgl7ULnHrlCbw-bWO1VdebJSOSD85N0_U4C5mpJy1_PWme7ul2gkehTOiNXMqtulhbCyUwVc8un5SorpViSXzbQHtzSUPYSCVJU3bSxMagb5oP4MzSW6Vh9jGsV37h_opYyM88BtvNXe5SHki2zB41HJ46PIqKFUJ2lfQ4iDtLcQLrPM72sCCXsZCTtKadiwmUX4MTHoUgmoB8EHFMFett3tTfo6O8VK0ruvaq6slzBSiwS2htrDwuvc0EpTj-XGvgxNLyP18feFlpuqIbbdJS6at5jik3B9wsUUhHshh4untZsIIEJcgvgEs4shBGOZpQKa_ngoeW2EKBygNekiMc73Ov26ibP7B8529CwJpWXnxNKOXVkBMtHv4mQrOHtaBJgNvxkqdCjFISr8W60R07kaP9bZbPA19wv1fVV6GKqzm9X1goNr1aamwTXcjrMaBsVoFk-UG8gzenrinZ1Vr0BouaoJpa44QtNGO4jyhH57UcsynxsKCeYLntHcOtT-UUjAZwwGKF04X2CI2bLwfIecybYo6G8-tT1VASeRznwPVkSkKeOMUxah-QZJ_jF2YFyDeDNzLuJWKKfaIe8eV0q6qbRWEKX7HoEp6qbi5HrpTQRPkRo-1DJynu5DVcSkX410fjXj5e_EEyQCoWcXhqIZy9iaHTAFOWwOU1fqfbXHLMW9DnAUDhLvhDOQbhVzQboVbp2w0z2zxQ1jqcIEUzDf38ZwGEE_FGH_DwVVlGaur4ZeXnkI_bPQiEcWiyL33Sx7i9lSEyTiG6Jo3L3pirc81oLbqkHQj26tn8kh-AYueSPmgh2avSrI7eleaQ6LWfJsbzEIxrDfJTTu5XOMfXHdTyHAQjUu3abN7QclqyDQ5dGq3q7RHjadmp2Oq5nJ4TlINzh0uGzPt67kjFisR7YkVqHz_olfGQ8FAlmfIEk6_YoxPFZjKtzELwTrfN88S8TwVX3jE8yboD-Ynt8FEgyOAaYRsti416YRXN4VSITbw0Fs3ZsYcwB4w5qQy6DqCc6MPkHavvjR9SZ_uts4bOboPaO8bCyOs1mNdVjlNY2DQe-nt9ZQYtGac5Shbi4KnAJXeHIMEKFwtfISqmABYjvnh8oSAkpW7KUVCE9qYHXcjbG8ejZPhQ-tcPWV7m6hEPanQS4gL9CR6a12ZWuyEjna6_ktOWZ_dgaCqttljtgV8MLAjJ9XMRUpqVP0aVgdTQD9qSGQPCdtpSPUf-XQiYtzi5ZuwNksRqQK6s5FUD_kmf2BHP_TyYWmrA-bp9xxJsLRdbXkN98R3-tsKesN6uMRlRceUVswVf5gk3sN2bvvG-j-nbYxhY-fsjVZuvbNkfk3VWwy55gTNGdfw48PLBTQl4c_SsDVjiPWV16NRu5HXuyzmVuE5TM97TLBf9qpihPqtH5e83_Q3izlcMcJfLS1UudOFNA16PRDdWyLuuQTQiHvFXkge78_6WLjCXkWi1WoYpMyO8mi3LbQrnzwJ0TSaeql9eS__zhVvlFudEFlqw9t0WzOPxZtAMFFWavsJcdCk76WX5DQNq863RYPESfeQ99gyr7PnICR31p5uNtCcqAqgSMQN-sb_TPQ6h46FPcxWlDqJBE0wHxZfkOhViyL3pKVPPx8wkbCKqXbr3dFnNS1Pt7iji_CuGJbK0iqvNWpQCbL9loEXBknG2PxsBaOwO5FItGz6mHM266PMq_IWl_-9JxGrvZ5UfeGJYnnIPkXYP7j6tg=s1409-w1409-h933-no?authuser=0'),
// //   ImageDetails(
// //     imagePath:'https://th.bing.com/th/id/OIP.l7S3JibgRoTvVXQCsfWBCgHaLJ?pid=ImgDet&rs=1',
// //   ),
// //   ImageDetails(
// //     imagePath:'https://th.bing.com/th/id/OIP.l7S3JibgRoTvVXQCsfWBCgHaLJ?pid=ImgDet&rs=1',
// //   ),
// //   ImageDetails(
// //     imagePath:'https://th.bing.com/th/id/OIP.l7S3JibgRoTvVXQCsfWBCgHaLJ?pid=ImgDet&rs=1',
// //   ),
// // ];


