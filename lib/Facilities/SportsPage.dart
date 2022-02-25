import 'package:flutter/material.dart';
import '../General Side/GallaryPage.dart';






class SportPage extends StatelessWidget {
  const SportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            // SliverAppBar(
            //   backgroundColor: Colors.blue,
            //   floating: true,
            //   //pinned: true,
            //   title: Text('SportPage'),
            // ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.amber,
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child:  Container(
                //color:Colors.greenAccent,
                // height: 520,
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text('       The institute provides abundant facilities for the students to get accustomed with the varied sports activities.'
                    '\n\n       Our students are talented & are laurelled by many renowned institutes.To support our view, at AIET we have lush green sports ground where various sports activities & events take place. '
                    '\n\n       AIET has modern infrastructure to facilitate almost all outdoor sports activities with well – maintained cricket ground, volleyball court, badminton court, etc. Our institute has ample space to host indoor sports activities such as carom, chess & table tennis as well as several indoor games.'
                    '\n\n       Students also participate in various competitions.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.99,
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
                    child: Container(
                      alignment: Alignment.center,
                      padding: _edgeInsertsForIndex(index),
                      child: Image.network(
                        networkNames[index % networkNames.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },childCount: networkNames.length,
              ),
            ),
          ]
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

final List<String> networkNames =[
'https://drive.google.com/uc?export=view&id=1eQXeDtltgRVdeQ90JeWcbtCNg6FVtT7N',
'https://drive.google.com/uc?export=view&id=1SPJjyz9XNfoqkL6JYyJjQIPYJCITlw3X',
'https://drive.google.com/uc?export=view&id=1YOkSUT0sTgjS4iBN3LDLuW9nfk3LUZoV',
'https://drive.google.com/uc?export=view&id=16hh197CmAiRRcxsQJEFNofINV2fxbgx3',
'https://drive.google.com/uc?export=view&id=1YNiRtj9MJT5soqUbFw3iTOK6T3--ph-z',
'https://drive.google.com/uc?export=view&id=1UB1s1r9bzkIy9MtxrvVgWi8UybX8j6TX',
'https://drive.google.com/uc?export=view&id=1es7V3ZZehsLm6EceC56RuF9Qnnu2_SHl',
'https://drive.google.com/uc?export=view&id=1amNDgwNTCfnjsOMpjqAOUxL6SlpXLV8P',
'https://drive.google.com/uc?export=view&id=1QWjRFgxFK_GRIS6ix0eCADvg_YSYrqhf',
'https://drive.google.com/uc?export=view&id=1IkHRignx9riUsLvq4JNDHwamCgd-a442',
'https://drive.google.com/uc?export=view&id=1iJx_q4abAQC4XiiL3aGAFZB5-lktPyhe',
'https://drive.google.com/uc?export=view&id=1lIHHNlj79ozxGO_3b7zw_9mwI9dL29HJ',
'https://drive.google.com/uc?export=view&id=1Xk_EigqG9B41EepSjLrFg865ilWQxIWb',
'https://drive.google.com/uc?export=view&id=1-XHpZc4LgCV3BmvFE8gsdfc0sA8R1VgQ',
'https://drive.google.com/uc?export=view&id=1wg5ifVPyRjiASaDBXQyk97BmZdZ_lEvk',
'https://drive.google.com/uc?export=view&id=1XSUHVB7jp2ehQ-l28SbdNKuQflhCVxTB',
'https://drive.google.com/uc?export=view&id=1C-Pa5_50J4EmIe9ZIWnPBh6tjFHR7DZH',
'https://drive.google.com/uc?export=view&id=1HSxGkMQSG98G4i8vebotYYOb4W-VS0gi',
'https://drive.google.com/uc?export=view&id=1qvdqsA1fGci_Ia6OehEWZhZ-DarRusvW',
];