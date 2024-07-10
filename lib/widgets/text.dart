import 'package:flutter/material.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';

Widget headlineText(String text, double screenWidth, BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: text,
            style: screenWidth > 600
                ? context.titleMedium
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.blue)
                : context.bodyLarge
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
      ],
    ),
  );
}

Widget bodytext(String text, double screenWidth, BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(text: text, style: context.bodyMedium),
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
            style: context.bodyMedium.copyWith(fontWeight: FontWeight.bold)),
        TextSpan(text: text.split("/").last, style: context.bodyMedium),
      ],
    ),
  );
}
