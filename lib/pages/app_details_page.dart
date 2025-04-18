import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorravlstudios/constants.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';
import 'package:sorravlstudios/widgets/bottom_container.dart';
import 'package:sorravlstudios/widgets/text.dart';
import 'package:sorravlstudios/widgets/top_tab_bar.dart';

class AppDetailsPage extends StatefulWidget {
  final String appId;
  const AppDetailsPage({super.key, required this.appId});

  @override
  State<AppDetailsPage> createState() => _AppDetailsPageState();
}

class _AppDetailsPageState extends State<AppDetailsPage> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    Map<String, dynamic> app =
        apps.singleWhere((element) => element['appId'] == widget.appId);

    Widget termandprivacy() {
      var coloredStyle = context.bodyMedium.copyWith(color: Colors.blue);
      return Wrap(children: [
        Text("You can read the FindLove's ", style: context.bodyMedium),
        InkWell(
            onTap: () {
              context.go("/project/${widget.appId}/terms&conditions");
            },
            child: Text("Terms and conditions", style: coloredStyle)),
        Text(", ", style: context.bodyMedium),
        InkWell(
            onTap: () {
              context.go("/project/${widget.appId}/privacy&policy");
            },
            child: Text("Privacy Policy", style: coloredStyle)),
        Text(", ", style: context.bodyMedium),
        InkWell(
            onTap: () {
              context.go("/project/${widget.appId}/csae-policy");
            },
            child: Text("CSAE Policy", style: coloredStyle))
      ]);
    }

    Widget wrongProjectId() {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("There is No Project belongs to'${widget.appId}'"),
          TextButton(
              onPressed: () {
                context.go("/");
              },
              child: const Text("Go to Home"))
        ],
      ));
    }

    Widget appTitle() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        margin: const EdgeInsets.only(top: 20),
        height: screenWidth > 600 ? 200 : 100,
        width: 1100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(screenWidth > 600 ? 30 : 15),
                    border: Border.all(color: context.inverseColor, width: 2),
                    image: DecorationImage(image: AssetImage(app['logo']))),
                height: screenWidth < mobileWidth ? 100 : 250,
                width: screenWidth < mobileWidth ? 100 : 250,
              ),
            ),
            SizedBox(width: screenWidth > 600 ? 50 : 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenWidth > 600 ? 20 : 10),
                  Text(
                    "${app['appName']} (${app['category']})",
                    style: screenWidth > 600
                        ? context.titleLarge
                            .copyWith(fontWeight: FontWeight.bold)
                            .copyWith(color: Colors.blue)
                        : context.bodyLarge
                            .copyWith(fontWeight: FontWeight.bold)
                            .copyWith(color: Colors.blue),
                    overflow: TextOverflow.clip,
                  ),
                  Text(app['status'],
                      style: screenWidth > 600
                          ? context.titleLarge
                          : context.bodyLarge,
                      overflow: TextOverflow.clip)
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget description() {
      return Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenWidth > 600 ? 30 : 15),
          width: 1100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bodytext(appDetail, screenWidth, context),
              headlineText("How it works", screenWidth, context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: howItWorks
                    .map((text) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            bodytext(">  ", screenWidth, context),
                            Flexible(
                                child: bodyTextWithHeading(
                                    text, screenWidth, context)),
                          ],
                        ))
                    .toList(),
              ),
              headlineText("Features", screenWidth, context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: features
                    .map((text) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            bodytext(">  ", screenWidth, context),
                            Flexible(
                                child: bodyTextWithHeading(
                                    text, screenWidth, context)),
                          ],
                        ))
                    .toList(),
              ),
              headlineText("Why Choose FindLove?", screenWidth, context),
              bodytext(whyChoose, screenWidth, context),
              const SizedBox(height: 20),
              termandprivacy()
            ],
          ));
    }

    Widget body() {
      return Center(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                appTitle(),
                description(),
                bottomWidget(screenWidth, context)
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: topTabBar(screenWidth, context, false),
        body: apps.any((element) => element['appId'] == widget.appId)
            ? body()
            : wrongProjectId());
  }
}
