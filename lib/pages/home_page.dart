import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorravlstudios/constants.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';
import 'package:sorravlstudios/widgets/bottom_container.dart';
import 'package:sorravlstudios/widgets/text.dart';
import 'package:sorravlstudios/widgets/top_tab_bar.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  final String? path;
  const HomePage({super.key, this.path});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _detailsAnimationController;
  late AnimationController _logoAnimationController;
  bool isDetailsVisible = false;
  bool isLogoVisible = false;

  @override
  void initState() {
    super.initState();
    _detailsAnimationController = AnimationController(
      vsync: this, // Add the ticker provider here
      duration: const Duration(milliseconds: 700),
    );
    _logoAnimationController = AnimationController(
      vsync: this, // Add the ticker provider here
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  void dispose() {
    _detailsAnimationController.dispose();
    _logoAnimationController.dispose();
    super.dispose();
  }

  Widget bannerWidget(double screenWidth) {
    return SizedBox(
        width: screenWidth,
        child: Image.asset("assets/primary_banner.png", fit: BoxFit.fitWidth));
  }

  Widget detailsText(double screenWidth) {
    return VisibilityDetector(
        key: const Key('detailsText'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.5) {
            if (!isDetailsVisible) {
              isDetailsVisible = true;
              _detailsAnimationController
                  .forward(); // Start the animation when widget becomes fully visible
            }
          }
        },
        child: AnimatedBuilder(
            animation: _detailsAnimationController,
            builder: (context, child) {
              return Opacity(
                  opacity: _detailsAnimationController.value,
                  child: SlideTransition(
                      position: Tween<Offset>(
                        begin:
                            const Offset(-1.0, 0.0), // Start from the left side
                        end: Offset.zero, // End at the center
                      ).animate(
                        CurvedAnimation(
                          parent: _detailsAnimationController,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headlineText(headline, screenWidth, context),
                          const SizedBox(
                            height: 7,
                          ),
                          bodytext(companyDescription, screenWidth, context)
                        ],
                      )));
            }));
  }

  Widget logoWidget() {
    return VisibilityDetector(
        key: const Key('logoWidget'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.5) {
            if (!isLogoVisible) {
              isLogoVisible = true;
              _logoAnimationController
                  .forward(); // Start the animation when widget becomes fully visible
            }
          }
        },
        child: AnimatedBuilder(
            animation: _logoAnimationController,
            builder: (context, child) {
              return Opacity(
                  opacity: _logoAnimationController.value,
                  child: SlideTransition(
                      position: Tween<Offset>(
                        begin:
                            const Offset(1.0, 0.0), // Start from the right side
                        end: Offset.zero, // End at the center
                      ).animate(
                        CurvedAnimation(
                          parent: _logoAnimationController,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                      color: context.inverseColor, width: 2),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/sorravlstudios.png"))),
                              height: 250,
                              width: 250,
                            ),
                            const Text(
                              "Sorravl Studos",
                              style: TextStyle(
                                color: Color(0xFF077bd7),
                                fontSize: 26,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w900,
                                letterSpacing: 3,
                              ),
                            ),
                          ],
                        ),
                      )));
            }));
  }

  Widget companyDetailsWidget(double screenWidth) {
    if (screenWidth < mobileWidth) {
      return Padding(
        padding: EdgeInsets.all(screenWidth < mobileWidth ? 30 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsText(screenWidth),
            const SizedBox(height: 30),
            logoWidget()
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                child: SizedBox(width: 700, child: detailsText(screenWidth))),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: logoWidget(),
            )
          ],
        ),
      );
    }
  }

  Widget projectsGrid(double screenWidth) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: screenWidth > mobileWidth
              ? screenWidth * 0.1
              : screenWidth * 0.05,
          mainAxisSpacing: screenWidth > mobileWidth
              ? screenWidth * 0.1
              : screenWidth * 0.05,
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.2),
      itemCount: apps.length,
      itemBuilder: (BuildContext context, int index) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(constraints.maxWidth / 10),
                          border:
                              Border.all(color: context.inverseColor, width: 2),
                          image: DecorationImage(
                              image: AssetImage(apps[index]['logo']))),
                      height: screenWidth < mobileWidth ? 100 : 250,
                      width: screenWidth < mobileWidth ? 100 : 250,
                    ),
                  ),
                  InkWell(
                    onTap: () => context.go("/project/${apps[index]['appId']}"),
                    child: Text(apps[index]['appName'],
                        style: screenWidth > mobileWidth
                            ? context.titleLarge
                                .copyWith(fontWeight: FontWeight.bold)
                                .copyWith(color: Colors.blue)
                                .copyWith(decoration: TextDecoration.underline)
                                .copyWith(decorationColor: Colors.blue)
                            : context.titleSmall
                                .copyWith(fontWeight: FontWeight.bold)
                                .copyWith(color: Colors.blue)
                                .copyWith(decoration: TextDecoration.underline)
                                .copyWith(decorationColor: Colors.blue)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget myProjects(double screenWidth) {
    return SizedBox(
      width: 800,
      child: projectsGrid(screenWidth),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: topTabBar(screenWidth, path: widget.path!, context, true),
      body: SizedBox(
        width: screenWidth,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                bannerWidget(screenWidth),
                companyDetailsWidget(screenWidth),
                const SizedBox(height: 50),
                Text(
                  "Projects",
                  style: screenWidth > mobileWidth
                      ? context.headlineLarge
                          .copyWith(fontWeight: FontWeight.bold)
                          .copyWith(color: Colors.green)
                      : context.titleLarge
                          .copyWith(fontWeight: FontWeight.bold)
                          .copyWith(color: Colors.green),
                ),
                myProjects(screenWidth),
                bottomWidget(screenWidth, context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
