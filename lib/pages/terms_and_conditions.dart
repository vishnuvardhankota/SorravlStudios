import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sorravlstudios/widgets/top_tab_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' show rootBundle;

class FindLoveTermsAndConditions extends StatefulWidget {
  final String appId;
  const FindLoveTermsAndConditions({super.key, required this.appId});

  @override
  State<FindLoveTermsAndConditions> createState() => _FindLoveTermsAndConditionsState();
}

class _FindLoveTermsAndConditionsState extends State<FindLoveTermsAndConditions> {
  String? htmlData;

  @override
  void initState() {
    super.initState();
    loadHtml();
  }

  Future<void> loadHtml() async {
    final data = await rootBundle.loadString('assets/html/terms&conditions.html');
    setState(() {
      htmlData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: topTabBar(screenWidth, context, false),
      body: htmlData == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: 950,
                  child: Html(
                    data: htmlData,
                    onLinkTap: (url, attributes, element) {
                      if (url != null) {
                        launchUrl(Uri.parse(url),
                            mode: LaunchMode.externalApplication);
                      }
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
