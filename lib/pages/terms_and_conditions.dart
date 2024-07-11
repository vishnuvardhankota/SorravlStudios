import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorravlstudios/constants.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:sorravlstudios/widgets/bottom_container.dart';
import 'package:sorravlstudios/widgets/top_tab_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class FindLoveTermsAndConditions extends StatelessWidget {
  final String appId;
  const FindLoveTermsAndConditions({super.key, required this.appId});

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
                        title: "Terms and Conditions for FindLove",
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
                                    'These Terms and Conditions ("Terms") constitute a legally binding agreement between you ("User") and Sorravl Studios ("Company"), a company registered in Andhra Pradesh, India, with its registered address at house number 33-1A, main road Madhavaram village, Tallur Mandal, Prakasham district, Andhra Pradesh, India (collectively, "we", "us", or "our"). These Terms govern your access to and use of the FindLove mobile application ("App").',
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
                                  text: "Acceptance of Terms",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'By downloading, installing, or using the App, you agree to be bound by these Terms. If you do not agree to all the terms and conditions set forth in these Terms, you may not access or use the App.',
                                screenWidth: screenWidth,
                              )
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
                                  text: "User Eligibility",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'The App is intended for users who are 18 years of age or older and are seeking romantic relationships. You represent and warrant that you meet all the foregoing eligibility requirements.',
                                screenWidth: screenWidth,
                              )
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
                                  text: "Registration Process",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    "To access the App's full features, you must register for an account by providing your phone number and verifying it with a one-time password (OTP).",
                                screenWidth: screenWidth,
                              )
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
                                  text: "Account Suspension/Termination",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'We reserve the right to suspend or terminate your account, without notice, if you:',
                                screenWidth: screenWidth,
                              ),
                              BulletedList(
                                bullet: const Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                style: context.bodyMedium,
                                listItems: const [
                                  'Violate any provision of these Terms.',
                                  'Engage in any activity that is harmful or abusive to other users.',
                                  'Provide false or misleading information about yourself.',
                                  'Are reported by 5 or more users for bad conduct.'
                                ],
                              ),
                              bodyText(
                                text:
                                    'If your account is terminated for violating our community guidelines, you will not be entitled to a refund of any unused digital wallet balance or tokens.',
                                screenWidth: screenWidth,
                              ),
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
                                  text: "Privacy",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        "We respect your privacy and are committed to protecting your personal information. Please refer to our separate ",
                                    style: context.bodyMedium),
                                TextSpan(
                                    text: "Privacy Policy",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.go("/project/$appId/privacy&policy");
                                      },
                                    style: context.bodyMedium
                                        .copyWith(color: Colors.blue)),
                                TextSpan(
                                    text:
                                        " for details on how we collect, use, and disclose your information. The Privacy Policy is incorporated herein by reference. User chat messages are encrypted to ensure privacy.",
                                    style: context.bodyMedium)
                              ])),
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
                                  text: "Content and Intellectual Property",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'All content on the App, including text, graphics, logos, images, audio, video, and software, is the property of the Company or its licensors and is protected by copyright and other intellectual property laws. You may not use any content from the App for any commercial purpose without our express written consent.',
                                screenWidth: screenWidth,
                              ),
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
                                  text: "User Content",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'The App may allow users to generate content, including profiles, messages, and photos ("User Content"). You retain all ownership rights to your User Content. However, by submitting User Content to the App, you grant us a non-exclusive, royalty-free, worldwide license to use, display, reproduce, modify, translate, and distribute your User Content on the App and for promotional purposes.',
                                screenWidth: screenWidth,
                              ),
                              bodyText(
                                  text: 'Gap',
                                  screenWidth: screenWidth,
                                  color: Colors.transparent),
                              bodyText(
                                text:
                                    'You are solely responsible for your User Content and represent and warrant that your User Content does not infringe on the intellectual property rights or other rights of any third party.',
                                screenWidth: screenWidth,
                              ),
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
                                  text: "Payment Terms",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "Pricing and Fees: ",
                                    style: context.bodyMedium
                                        .copyWith(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "There are three payment methods:",
                                    style: context.bodyMedium)
                              ])),
                              BulletedList(
                                bullet: const Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                style: context.bodyMedium,
                                listItems: const [
                                  'Monthly premium with a fixed base price of 70 rupees.',
                                  'Digital wallet used for audio, video calls, and to send letters to users who are not connected with you.',
                                  'Tokens used to send messages in chat.',
                                ],
                              ),
                              bodyText(
                                text:
                                    'Our pricing model aims to be cost-effective compared to other dating apps that charge 400-800 rupees per month. The pay-as-you-go method helps users save money if they do not use the app continuously.',
                                screenWidth: screenWidth,
                              ),
                              bodyText(
                                  text: 'Gap',
                                  screenWidth: screenWidth,
                                  color: Colors.transparent),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "Payment Methods: ",
                                    style: context.bodyMedium
                                        .copyWith(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        "All types of UPI, wallets, cards, and more are accepted.",
                                    style: context.bodyMedium)
                              ])),
                              const SizedBox(height: 8),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "Refunds and Cancellations: ",
                                    style: context.bodyMedium
                                        .copyWith(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        "Since we do not sell physical products, there are no refunds or cancellations for the digital services provided.",
                                    style: context.bodyMedium)
                              ])),
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
                                  text: "User Conduct and Safety",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'Users are strictly prohibited from exposing their body or engaging in any inappropriate behavior during video calls. We have implemented restrictions to prevent screenshots and screen recordings within the app. However, if a user records the call using another camera or mobile device, we are not responsible for such actions.',
                                screenWidth: screenWidth,
                              ),
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
                                  text: "Disclaimers and Limitations",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'THE APP IS PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. WE DO NOT WARRANT THAT THE APP WILL BE UNINTERRUPTED, SECURE, OR ERROR-FREE. WE DO NOT WARRANT THAT THE RESULTS OBTAINED THROUGH THE USE OF THE APP WILL BE ACCURATE OR RELIABLE.',
                                screenWidth: screenWidth,
                              ),
                              bodyText(
                                  text: 'Gap',
                                  screenWidth: screenWidth,
                                  color: Colors.transparent),
                              bodyText(
                                text:
                                    'YOU AGREE THAT WE WILL NOT BE LIABLE FOR ANY DAMAGES, INCLUDING WITHOUT LIMITATION, DIRECT, INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES ARISING OUT OF OR IN CONNECTION WITH YOUR USE OF THE APP, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.',
                                screenWidth: screenWidth,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    //12
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bodyText(
                            text: "12. ",
                            screenWidth: screenWidth,
                            fontweight: FontWeight.bold),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              bodyText(
                                  text: "Governing Law and Dispute Resolution",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'These Terms shall be governed by and construed in accordance with the laws of India. Any dispute arising out of or relating to these Terms shall be subject to the exclusive jurisdiction of the courts located in Prakasham district, Andhra Pradesh, India.',
                                screenWidth: screenWidth,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    //13
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bodyText(
                            text: "13. ",
                            screenWidth: screenWidth,
                            fontweight: FontWeight.bold),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              bodyText(
                                  text: "Updates and Modifications",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'We reserve the right to update or modify these Terms at any time. We will notify you of any changes by posting the new Terms on the App. Your continued use of the App after the posting of the revised Terms constitutes your acceptance of the revised Terms.',
                                screenWidth: screenWidth,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    //14
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bodyText(
                            text: "14. ",
                            screenWidth: screenWidth,
                            fontweight: FontWeight.bold),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              bodyText(
                                  text: "Entire Agreement",
                                  screenWidth: screenWidth,
                                  fontweight: FontWeight.bold),
                              const SizedBox(height: 10),
                              bodyText(
                                text:
                                    'These Terms constitute the entire agreement between you and us regarding your use of the App.',
                                screenWidth: screenWidth,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    //15
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bodyText(
                            text: "15. ",
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
                                            scheme: 'mailto',
                                            path: contactMail);

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
            ],
          ),
        ),
      ),
    );
  }
}
