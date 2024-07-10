import 'package:flutter/material.dart';
import 'package:sorravlstudios/constants.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';
import 'package:sorravlstudios/widgets/text.dart';
import 'package:sorravlstudios/widgets/top_tab_bar.dart';

import '../widgets/bottom_container.dart';

class CareersPage extends StatelessWidget {
  final String? path;
  const CareersPage({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    Widget bannerWidget(double screenWidth) {
      return SizedBox(
          width: screenWidth,
          child: Image.asset("assets/hiring.png", fit: BoxFit.fitWidth));
    }

    Widget workTogetherImage() {
      return Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: const DecorationImage(
                      image: AssetImage("assets/work_together.png"))),
              height: 300,
              width: 300,
            ),
            const Text(
              "Join our team",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 26,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
            ),
          ],
        ),
      );
    }

    Widget careersEncouragementText(double screenWidth) {
      return Container(
        width: mobileWidth,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headlineText(careersHeadline, screenWidth, context),
            const Divider(),
            bodytext(careersDescription, screenWidth, context),
          ],
        ),
      );
    }

    Widget motivationWidget(double screenWidth) {
      if (screenWidth < mobileWidth) {
        return Padding(
          padding: EdgeInsets.all(screenWidth < mobileWidth ? 10 : 0),
          child: careersEncouragementText(screenWidth),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: SizedBox(
                      width: 700,
                      child: careersEncouragementText(screenWidth))),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: workTogetherImage(),
              )
            ],
          ),
        );
      }
    }

    Widget jobsWidget(double screenWidth) {
      return Container(
        width: mobileWidth,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jobs",
              style: context.titleLarge
                  .copyWith(fontWeight: FontWeight.bold)
                  .copyWith(color: Colors.blue),
            ),
            const Divider(),
            SizedBox(
              height: 200,
              width: screenWidth,
              child: const Center(child: Text("Sorry. No Vacancies.")),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: topTabBar(screenWidth, path: path!, context, true),
      body: SizedBox(
        width: screenWidth,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                bannerWidget(screenWidth),
                motivationWidget(screenWidth),
                jobsWidget(screenWidth),
                bottomWidget(screenWidth, context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
