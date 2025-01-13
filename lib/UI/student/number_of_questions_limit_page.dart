import 'package:animate_do/animate_do.dart';
import 'package:egov/UI/student/student_view_answers_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberOfQuestionsLimitPage extends StatefulWidget {
  const NumberOfQuestionsLimitPage({super.key});

  @override
  State<NumberOfQuestionsLimitPage> createState() =>
      _NumberOfQuestionsLimitPageState();
}

class _NumberOfQuestionsLimitPageState
    extends State<NumberOfQuestionsLimitPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.close,
              color: Colors.black,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInRight(
            child:
                Image.asset("images/notification.png", height: 0.15 * height),
          ),
          const SizedBox(height: 20),
          FadeInRight(
              child: Text(
                  "You have reached the number of questions\nyou can answer",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold))),
          const SizedBox(height: 15),
          FadeInRight(
            child: Text(
                "This is a demo version of the\nE-Governance Mobile Application,\ncontact Evnoia Group for\npremium version",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 20),
          FadeInRight(
            child: InkWell(
              onTap: () async {
                Get.to(() => const StudentViewAnswersPage());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                    height: 0.055 * height,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 7,
                              offset: Offset(1, 2))
                        ]),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("View answers",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ],
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeInRight(
            child: InkWell(
              onTap: () async {
                final link = Uri.parse(
                    "https://api.whatsapp.com/send/?phone=+447539938957");
                await launchUrl(link);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                    height: 0.055 * height,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 7,
                              offset: Offset(1, 2))
                        ]),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ImageIcon(AssetImage("images/whatsapp.png"),
                            color: Colors.white, size: 22),
                        const SizedBox(width: 10),
                        Text("Chat on whatsapp",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
