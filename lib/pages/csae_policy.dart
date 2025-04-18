import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sorravlstudios/widgets/top_tab_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' show rootBundle;

class FindLoveCSAEPolicy extends StatefulWidget {
  final String appId;
  const FindLoveCSAEPolicy({super.key, required this.appId});

  @override
  State<FindLoveCSAEPolicy> createState() => _FindLoveCSAEPolicyState();
}

class _FindLoveCSAEPolicyState extends State<FindLoveCSAEPolicy> {
  String? htmlData;

  @override
  void initState() {
    super.initState();
    loadHtml();
  }

  Future<void> loadHtml() async {
    final data = await rootBundle.loadString('assets/html/csae_policy.html');
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
