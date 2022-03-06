import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../General Side/GallaryPage.dart';




class AI_DS extends StatelessWidget {
  const AI_DS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              title: Text(
                  'AI_DSBranch'
              ),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text('         Building human-level thought processes through the creation of artificial intelligence (AI) is the state-of-the-art in Computer Science. Intelligent machines are influenced by emerging technologies, smart devices & sensors, computing power, faster data processing, huge storage and human-machine interaction capabilities. Data Science is an interdisciplinary field with the ability to extract knowledge/insights from data – be it structured, unstructured, or semi-structured data. Twinned with Artificial Intelligence, more efficient solutions to find meaningful information from huge pools of data are possible today, with data from multiple sources – sensors, images, streaming video, satellite, medical imagery and the cloud.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      // color: Colors.red,
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                      //decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Center(
                    child: Text('PROGRAM OUTCOME',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                  child: Text('         Ability to apply and develop AI algorithms to transform large amount of data into intelligent decisions and/or behavior.'
                    '\n         Enable graduates to design and harness the power of AI in broad application fields from vision to advanced autonomous systems.'
                    '\n         Examine large amounts of data to uncover hidden patterns, correlations, insights, and help organizations harness their data to identify new opportunities.'
                    '\n         Obtain expertise to turn actionable insights and cutting-edge technology into innovative products towards solving real-world problems.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



