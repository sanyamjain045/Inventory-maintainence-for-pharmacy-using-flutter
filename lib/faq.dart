import 'package:flutter/material.dart';
import 'package:flutter_anybarcodescan/styles/text_style/style_faq_page.dart';

import 'list_faq.dart';

class FAQPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatateFAQPage();
  }
}

class _StatateFAQPage extends State<FAQPage> {
  String titleSettings = "FAQ";

  Map<String, String> list = {};
  @override
  void initState() {
    list["How to get started in the app?"] =
        " The pain itself is the love of the pain, the main ecological problems, but I give this kind of time to fall down, so that some great pain and pain. In order for the minimum to come, what can our school exercise";
    list["Application menu?"] =
        " The pain itself is the love of the pain, the main ecological problems, but I give this kind of time to fall down, so that some great pain and pain. In order for the minimum to come, what can our school exercise";
    list["Account/profile?"] =
        " The pain itself is the love of the pain, the main ecological problems, but I give this kind of time to fall down, so that some great pain and pain. In order for the minimum to come, what can our school exercise";
    list["Application Services"] =
        " The pain itself is the love of the pain, the main ecological problems, but I give this kind of time to fall down, so that some great pain and pain. In order for the minimum to come, what can our school exercise";
    list["Settings?"] =
        " The pain itself is the love of the pain, the main ecological problems, but I give this kind of time to fall down, so that some great pain and pain. In order for the minimum to come, what can our school exercise";
    list["Notifications?"] =
        " The pain itself is the love of the pain, the main ecological problems, but I give this kind of time to fall down, so that some great pain and pain. In order for the minimum to come, what can our school exercise";
    list["Didn't find an answer?"] =
        " The pain itself is the love of the pain, the main ecological problems, but I give this kind of time to fall down, so that some great pain and pain. In order for the minimum to come, what can our school exercise";
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width - 2;
    return Scaffold(
        appBar: AppBar(
          title: Text("FAQ"),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.0,
                ),
                SizedBox(
                  height: screenHeight * 0.0,
                ),
                ...list.entries.map((e) {
                  return ListFAQ(e.key, e.value);
                }).toList()
              ],
            ),
          )
        ]));
  }
}
