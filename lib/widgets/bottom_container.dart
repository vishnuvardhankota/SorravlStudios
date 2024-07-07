import 'package:flutter/material.dart';
import 'package:sorravlstudios/constants.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri googlePlayURL =
    Uri.parse('https://play.google.com/store/apps/dev?id=6451684297478191048');

Widget googlePlayWidget(double screenWidth, BuildContext context) {
  return InkWell(
    onTap: () async {
      await launchUrl(googlePlayURL);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.inverseColor)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/google_play.png",
            height: screenWidth > 600 ? 40 : 30,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Get it on",
                style: screenWidth > 600
                    ? context.bodySmall.copyWith(color: context.inverseColor)
                    : TextStyle(fontSize: 11, color: context.inverseColor),
              ),
              Text("Google Play",
                  style: screenWidth > 600
                      ? context.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.inverseColor)
                      : context.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.inverseColor)),
            ],
          )
        ],
      ),
    ),
  );
}

Widget copyRightText(double screenWidth, BuildContext context) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
        text: copyRight.split("/")[0],
        style: screenWidth > 600
            ? context.bodyLarge.copyWith(
                fontWeight: FontWeight.bold, color: context.inverseColor)
            : context.bodySmall.copyWith(
                fontWeight: FontWeight.bold, color: context.inverseColor)),
    TextSpan(
        text: copyRight.split("/")[1],
        style: screenWidth > 600
            ? context.bodyLarge
                .copyWith(fontWeight: FontWeight.bold, color: Colors.blue)
            : context.bodySmall
                .copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
    TextSpan(
        text: copyRight.split("/")[2],
        style: screenWidth > 600
            ? context.bodyLarge.copyWith(
                fontWeight: FontWeight.bold, color: context.inverseColor)
            : context.bodySmall.copyWith(
                fontWeight: FontWeight.bold, color: context.inverseColor))
  ]));
}

Widget enquiry(double screenWidth, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Contact for any Inquiries:",
          style: screenWidth > 600
              ? context.titleLarge.copyWith(
                  fontWeight: FontWeight.bold, color: context.inverseColor)
              : context.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold, color: context.inverseColor)),
      Row(children: [
        Text("Contact via Email: ",
            style: screenWidth > 600
                ? context.bodyLarge.copyWith(color: context.inverseColor)
                : context.bodySmall.copyWith(color: context.inverseColor)),
        InkWell(
          onTap: () async {
            final Uri emailLaunchUri = Uri(scheme: 'mailto', path: contactMail);

            launchUrl(emailLaunchUri);
          },
          child: Text(contactMail,
              style: screenWidth > 600
                  ? context.bodyLarge.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      color: Colors.blue)
                  : context.bodySmall.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      color: Colors.blue)),
        )
      ])
    ],
  );
}

Widget bottomWidget(double screenWidth, BuildContext context) {
  if (screenWidth > 600) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      color: context.inverseBackgroundColor,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: enquiry(screenWidth, context)),
              const SizedBox(
                width: 15,
              ),
              googlePlayWidget(screenWidth, context),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Center(child: copyRightText(screenWidth, context))
        ],
      ),
    );
  } else {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: context.inverseBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: googlePlayWidget(screenWidth, context)),
          enquiry(screenWidth, context),
          const SizedBox(
            height: 35,
          ),
          Center(child: copyRightText(screenWidth, context))
        ],
      ),
    );
  }
}

