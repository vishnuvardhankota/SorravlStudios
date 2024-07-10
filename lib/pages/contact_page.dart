import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sorravlstudios/constants.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';
import 'package:sorravlstudios/widgets/top_tab_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    headLineText(
        {required String title,
        required double screenWidth,
        FontWeight? fontweight,
        Color? color}) {
      return Text(title,
          style: screenWidth > 600
              ? context.titleMedium
                  .copyWith(fontWeight: fontweight, color: color)
              : context.bodyMedium
                  .copyWith(fontWeight: fontweight, color: color));
    }

    bodyText(
        {required String text,
        required double screenWidth,
        FontWeight? fontweight,
        Color? color}) {
      return Text(text,
          style: context.bodyMedium
              .copyWith(fontWeight: fontweight, color: color));
    }

    return Scaffold(
      appBar: topTabBar(screenWidth, context, false),
      body: SizedBox(
        width: screenWidth,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 1100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      headLineText(
                          title: "Contact Us",
                          screenWidth: screenWidth,
                          fontweight: FontWeight.bold,
                          color: Colors.blue),
                      const Divider(),
                      const SizedBox(height: 20),
                      bodyText(
                          text:
                              "If you have any issues regarding payments or encounter any problems while using the FindLove app, please don't hesitate to get in touch with us. Our support team is here to help and ensure you have a smooth and enjoyable experience.",
                          screenWidth: screenWidth),
                      const SizedBox(height: 10),
                      bodyText(
                          text: "How to Reach Us",
                          screenWidth: screenWidth,
                          fontweight: FontWeight.bold),
                      const SizedBox(height: 10),
                      bodyText(
                          text: "Email:",
                          screenWidth: screenWidth,
                          fontweight: FontWeight.bold),
                      const SizedBox(height: 5),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text:
                                "For any queries, complaints, or support requests, please email us at ",
                            style: context.bodyMedium),
                        TextSpan(
                            text: contactMail,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                final Uri emailLaunchUri =
                                    Uri(scheme: 'mailto', path: contactMail);

                                launchUrl(emailLaunchUri);
                              },
                            style: context.bodyMedium
                                .copyWith(color: Colors.blue)),
                        TextSpan(
                            text:
                                ". Our team will get back to you as soon as possible.",
                            style: context.bodyMedium),
                      ])),
                      const SizedBox(height: 10),
                      bodyText(
                          text: "Support Hours:",
                          screenWidth: screenWidth,
                          fontweight: FontWeight.bold),
                      const SizedBox(height: 5),
                      bodyText(
                          text:
                              "Our support team is available Monday to Friday, from 9:00 AM to 6:00 PM (IST).",
                          screenWidth: screenWidth),
                      const SizedBox(height: 10),
                      bodyText(
                          text: "Response Time:",
                          screenWidth: screenWidth,
                          fontweight: FontWeight.bold),
                      const SizedBox(height: 5),
                      bodyText(
                          text:
                              "We aim to respond to all queries within 24-48 hours. For urgent issues, please indicate the nature of the urgency in the subject line of your email.",
                          screenWidth: screenWidth),
                      const SizedBox(height: 10),
                      bodyText(
                          text: "Feedback:",
                          screenWidth: screenWidth,
                          fontweight: FontWeight.bold),
                      const SizedBox(height: 5),
                      bodyText(
                          text:
                              "We value your feedback. If you have any suggestions or feedback on how we can improve the FindLove app, please let us know. Your input is crucial in helping us enhance our services.",
                          screenWidth: screenWidth),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
