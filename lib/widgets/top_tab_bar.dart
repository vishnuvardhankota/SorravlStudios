import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sorravlstudios/constants.dart';
import 'package:sorravlstudios/provider/theme_provider.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';
import 'package:sorravlstudios/widgets/menu_option.dart';

PreferredSize topTabBar(
    double screenWidth, BuildContext context, bool isOptionsEnabled,
    {String? path}) {
  var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  var tabBarOptions = [
    ["Home", "/"],
    ["Careers", "/careers"],
  ];
  return PreferredSize(
    preferredSize: Size(screenWidth, screenWidth < 800 ? 55 : 70),
    child: Container(
      decoration: BoxDecoration(color: context.inverseBackgroundColor),
      height: screenWidth < 800 ? 55 : 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.08),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => themeProvider.toggleThemeMode(),
                  child: Container(
                    width: screenWidth < 800 ? 45 : 60,
                    height: screenWidth < 800 ? 45 : 60,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(screenWidth < 800 ? 14 : 20),
                        image: DecorationImage(
                            image: AssetImage(companyLogo), fit: BoxFit.fill)),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  companyName,
                  style: TextStyle(
                    color: const Color(0xFF077bd7),
                    fontSize: screenWidth < 800 ? 20 : 26,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          if (isOptionsEnabled)
            screenWidth < 900
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: PopupMenuButton<String>(
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          for (var page in tabBarOptions)
                            PopupMenuItem<String>(
                              value: page[1],
                              onTap: () {
                                if (page[1] == path) {
                                  return;
                                } else {
                                  context.go(page[1]);
                                }
                              },
                              child: Text(page[0]),
                            ),
                        ];
                      },
                      child: Icon(
                        Icons.menu,
                        color: context.inverseColor,
                      ),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: tabBarOptions
                        .map((page) => TopBarOption(
                            optionName: page[0],
                            path: page[1],
                            currentPath: path!))
                        .toList(),
                  ),
        ],
      ),
    ),
  );
}
