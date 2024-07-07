import 'package:flutter/material.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';

Widget headlineText(String text, double screenWidth, BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: text,
            style: screenWidth > 600
                ? context.titleLarge
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.blue)
                : context.bodyMedium
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
      ],
    ),
  );
}

Widget bodytext(String text, double screenWidth, BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: text,
            style: screenWidth > 600 ? context.titleSmall : context.bodySmall),
      ],
    ),
  );
}

Widget bodyTextWithHeading(
    String text, double screenWidth, BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: text.split("/").first,
            style: screenWidth > 600
                ? context.titleSmall.copyWith(fontWeight: FontWeight.bold)
                : context.bodySmall.copyWith(fontWeight: FontWeight.bold)),
        TextSpan(
            text: text.split("/").last,
            style: screenWidth > 600 ? context.titleSmall : context.bodySmall),
      ],
    ),
  );
}
