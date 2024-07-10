import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sorravlstudios/constants.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';
import 'package:sorravlstudios/widgets/bottom_container.dart';
import 'package:sorravlstudios/widgets/top_tab_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class FindLovePrivacyPolicy extends StatelessWidget {
  final String appId;
  const FindLovePrivacyPolicy({super.key, required this.appId});

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
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 1100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                headLineText(
                    title: "Privacy Policy for FindLove",
                    screenWidth: screenWidth,
                    fontweight: FontWeight.bold,
                    color: Colors.blue),
                headLineText(
                    title: "Last Updated: 1st july,2024",
                    screenWidth: screenWidth,
                    fontweight: FontWeight.bold),
                const Divider(),
                const SizedBox(height: 20),
                //1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "1. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "Introduction",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                            text:
                                'Sorravl Studios ("Company", "we", "us", or "our") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use the FindLove mobile application ("App"). By using the App, you agree to the terms of this Privacy Policy. If you do not agree with the terms of this Privacy Policy, please do not access the App.',
                            screenWidth: screenWidth,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //2
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "2. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "Information We Collect",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                              text: "a. Personal Information",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          bodyText(
                            text:
                                'When you register for an account, we may collect the following personal information:',
                            screenWidth: screenWidth,
                          ),
                          BulletedList(
                            listOrder: ListOrder.ordered,
                            bullet: const Icon(
                              Icons.circle,
                              size: 10,
                            ),
                            style: context.bodyMedium,
                            listItems: const [
                              'Phone number, Email',
                              'Profile information, including name, age, gender, and photos',
                              'Payment information, such as billing address and payment methods'
                            ],
                          ),
                          bodyText(
                              text: "b. Usage Data",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          bodyText(
                            text:
                                'We may collect information about your interactions with the App, including:',
                            screenWidth: screenWidth,
                          ),
                          BulletedList(
                            bullet: const Icon(
                              Icons.circle,
                              size: 10,
                            ),
                            style: context.bodyMedium,
                            listItems: const [
                              'Messages and chat history',
                              'Audio and video call logs'
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //3
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "3. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "How We Use Your Information",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                            text: 'We use the information we collect to:',
                            screenWidth: screenWidth,
                          ),
                          BulletedList(
                            listOrder: ListOrder.ordered,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            bullet: const Icon(
                              Icons.circle,
                              size: 10,
                            ),
                            style: context.bodyMedium,
                            listItems: const [
                              'Provide, operate, and maintain the App',
                              'Process transactions and send you related information, including purchase confirmations and invoices',
                              'Send you technical notices, updates, security alerts, and support and administrative messages',
                              'Monitor and analyze trends, usage, and activities in connection with the App',
                              'Personalize and improve the App and provide content, features, and advertisements that match your interests'
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //4
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "4. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "Disclosure of Your Information",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                            text: 'We may share your information with:.',
                            screenWidth: screenWidth,
                          ),
                          BulletedList(
                            listOrder: ListOrder.ordered,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            bullet: const Icon(
                              Icons.circle,
                              size: 10,
                            ),
                            style: context.bodyMedium,
                            listItems: const [
                              'Service Providers: We may share your information with third-party service providers who perform services on our behalf, such as payment processing, data analysis, email delivery, and hosting services.',
                              'Business Transfers: If we are involved in a merger, acquisition, or asset sale, your information may be transferred as part of that transaction.',
                              'Legal Requirements: We may disclose your information if required to do so by law or in response to valid requests by public authorities (e.g., a court or a government agency).'
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //5
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "5. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "Data Security",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                            text:
                                'We use administrative, technical, and physical security measures to help protect your personal information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable, and no method of data transmission can be guaranteed against any interception or other type of misuse.',
                            screenWidth: screenWidth,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //6
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "6. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "Your Data Protection Rights",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                            text:
                                'Depending on your location, you may have the following data protection rights:',
                            screenWidth: screenWidth,
                          ),
                          BulletedList(
                            listOrder: ListOrder.ordered,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            bullet: const Icon(
                              Icons.circle,
                              size: 10,
                            ),
                            style: context.bodyMedium,
                            listItems: const [
                              'Access: You can request a copy of the personal information we hold about you.',
                              'Rectification: You can request that we correct any inaccurate or incomplete personal information.',
                              'Erasure: You can request that we delete your personal information.',
                              'Restriction: You can request that we restrict the processing of your personal information.',
                              'Objection: You can object to the processing of your personal information.',
                              'Data Portability: You can request a copy of your personal information in a structured, commonly used, and machine-readable format.'
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //7
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "7. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "Retention of Your Information",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                            text:
                                'We will retain your personal information only for as long as is necessary to fulfill the purposes for which it was collected or to comply with legal, regulatory, or internal policy requirements.',
                            screenWidth: screenWidth,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //8
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "8. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text:
                                  "Prohibited Conduct and User Responsibility",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                            text:
                                'Users are strictly prohibited from exposing their body or engaging in any inappropriate behavior during video calls. We have implemented restrictions to prevent screenshots and screen recordings within the app. However, if a user records the call using another camera or mobile device, we are not responsible for such actions. Users are encouraged to report any inappropriate behavior to us immediately.',
                            screenWidth: screenWidth,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //9
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "9. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "Children’s Privacy",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                            text:
                                'Our App is not intended for use by children under the age of 18. We do not knowingly collect personal information from children under 18. If we become aware that we have collected personal information from a child under 18, we will take steps to delete such information from our files as soon as possible.',
                            screenWidth: screenWidth,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //10
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "10. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "Changes to This Privacy Policy",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          bodyText(
                            text:
                                'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on the App. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
                            screenWidth: screenWidth,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //11
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText(
                        text: "11. ",
                        screenWidth: screenWidth,
                        fontweight: FontWeight.bold),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(
                              text: "Contact Us",
                              screenWidth: screenWidth,
                              fontweight: FontWeight.bold),
                          const SizedBox(height: 10),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text:
                                    "If you have any questions about these Terms, please contact us at ",
                                style: context.bodyMedium),
                            TextSpan(
                                text: contactMail,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    final Uri emailLaunchUri = Uri(
                                        scheme: 'mailto', path: contactMail);

                                    launchUrl(emailLaunchUri);
                                  },
                                style: context.bodyMedium
                                    .copyWith(color: Colors.blue))
                          ]))
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          bottomWidget(screenWidth, context)
        ])),
      ),
    );
  }
}
