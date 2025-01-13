import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/all/demo_page.dart';
import 'package:egov/UI/student/check_assignment_page.dart';
import 'package:egov/UI/all/login_page.dart';
import 'package:egov/UI/all/notes_page.dart';
import 'package:egov/UI/all/profile_page.dart';
import 'package:egov/UI/score_page.dart';
import 'package:egov/UI/all/share_page.dart';
import 'package:egov/UI/student/questions_page.dart';
import 'package:egov/UI/student/questions_page_two.dart';
import 'package:egov/UI/student/quiz_page.dart';
import 'package:egov/UI/student/study_page.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  bool loading = false;
  String url = "";

  getPrivacyPolicy() async {
    FirebaseFirestore.instance
        .collection("settings")
        .doc("privacypolicy")
        .get()
        .then((value) {
      setState(() {
        url = "url";
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPrivacyPolicy();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(user?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoadingPage();
          }
          return Scaffold(
            backgroundColor: Colors.white,
            drawer: SizedBox(
                width: 0.75 * width,
                child: Drawer(
                  backgroundColor: Colors.white,
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 0.35 * height,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/header.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: 0.35 * height,
                            color: Colors.black45,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 0.055 * height,
                              width: width,
                              color: Colors.deepPurple,
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data!["email"],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.close(1);
                          Get.to(() => const ProfilePage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 40.0),
                          child: Row(
                            children: [
                              const ImageIcon(
                                AssetImage("images/profile.png"),
                                size: 22,
                              ),
                              const SizedBox(width: 15),
                              Text("Profile",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.close(1);
                          Get.to(() => const DemoPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                          child: Row(
                            children: [
                              const ImageIcon(
                                AssetImage("images/star.png"),
                                size: 22,
                              ),
                              const SizedBox(width: 15),
                              Text("Score",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.close(1);
                          Get.to(() => const NotesPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                          child: Row(
                            children: [
                              const ImageIcon(
                                AssetImage("images/note.png"),
                                size: 22,
                              ),
                              const SizedBox(width: 15),
                              Text("Notes",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          Get.close(1);
                          Get.to(() => const SharePage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                          child: Row(
                            children: [
                              const ImageIcon(
                                AssetImage("images/share.png"),
                                size: 22,
                              ),
                              const SizedBox(width: 15),
                              Text("Share App",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          Get.close(1);
                          await launchUrl(Uri.parse(url));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                          child: Row(
                            children: [
                              const ImageIcon(
                                AssetImage("images/privacy.png"),
                                size: 22,
                              ),
                              const SizedBox(width: 15),
                              Text("Privacy policy",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.close(1);
                          Get.dialog(barrierDismissible: false,
                              StatefulBuilder(builder: (context, setState) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Column(
                                children: [
                                  const SizedBox(height: 30.0),
                                  Image.asset("images/exit.png",
                                      height: 0.1 * height),
                                  const SizedBox(height: 15.0),
                                  Text(
                                      "You are about signing out, do you want to proceed?",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                  const SizedBox(height: 15.0),
                                  InkWell(
                                    onTap: () async {
                                      if (loading == false) {
                                        setState(() {
                                          loading = true;
                                        });
                                      } else {
                                        if (loading == true) {
                                          setState(() {
                                            loading = false;
                                          });
                                        }
                                      }
                                      try {
                                        await FirebaseAuth.instance
                                            .signOut()
                                            .then((value) {
                                          setState(() {
                                            loading = false;
                                          });
                                          Get.offAll(() => const LoginPage());
                                        });
                                      } catch (e) {
                                        setState(() {
                                          loading = false;
                                        });
                                        Get.snackbar("", "",
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.red,
                                            messageText: Text(
                                              "Try again",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ));
                                      }
                                    },
                                    child: Container(
                                        height: 0.055 * height,
                                        width: width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.deepPurple,
                                                width: 2,
                                                style: BorderStyle.solid),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 7,
                                                  offset: Offset(1, 2))
                                            ]),
                                        alignment: Alignment.center,
                                        child: loading == true
                                            ? const SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.deepPurple,
                                                  strokeWidth: 3,
                                                ))
                                            : Text("Yes, proceed",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.deepPurple,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Get.close(1);
                                    },
                                    child: Container(
                                        height: 0.055 * height,
                                        width: width,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 7,
                                                  offset: Offset(1, 2))
                                            ]),
                                        alignment: Alignment.center,
                                        child: Text("Cancel",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500))),
                                  ),
                                  const SizedBox(height: 30.0)
                                ],
                              ),
                            );
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 25.0),
                          child: Row(
                            children: [
                              const ImageIcon(AssetImage("images/exit.png"),
                                  color: Colors.red),
                              const SizedBox(width: 15),
                              Text("Sign Out",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                InkWell(
                  onTap: () {
                    Get.to(() => const ScorePage());
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: ImageIcon(AssetImage("images/star.png"),
                        color: Colors.white),
                  ),
                ),
              ],
              elevation: 0,
              title: Text(
                "Hey ${snapshot.data!["name"]}",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: ListView(
              children: [
                FadeInLeft(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 10),
                    child: Container(
                      height: 0.25 * height,
                      width: width,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                offset: Offset(1, 2))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 30.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Continue learning...",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    snapshot.data?["currentsubject"] != ""
                                        ? "${snapshot.data?["currentsubject"]}"
                                        : "Previous subject the student was studying will be here",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                      width: width,
                                      height: 7,
                                      child: LinearProgressIndicator(
                                        color: Colors.blue,
                                        backgroundColor: Colors.black12,
                                        value: snapshot.data?[
                                                    "currentquestionumber"] ==
                                                ""
                                            ? 0
                                            : double.parse(snapshot.data?[
                                                    "currentquestionumber"]) /
                                                60,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (snapshot.data?["currentquestionumber"] == "1" ||
                                        snapshot.data?[
                                                "currentquestionumber"] ==
                                            "2" ||
                                        snapshot.data?["currentquestionumber"] == "3" &&
                                            snapshot.data?["currentsubject"] ==
                                                "Agricultural Science") {
                                      Get.to(() => StudentQestionPage(
                                            subject: snapshot
                                                .data?["currentsubject"],
                                          ));
                                    } else if (snapshot.data?[
                                                "currentquestionumber"] ==
                                            "4" ||
                                        snapshot.data?[
                                                "currentquestionumber"] ==
                                            "5" ||
                                        snapshot.data?[
                                                    "currentquestionumber"] ==
                                                "6" &&
                                            snapshot.data?["currentsubject"] ==
                                                "Agricultural Science") {
                                      Get.to(() => StudentQuestionPageTwo(
                                            subject: snapshot
                                                .data?["currentsubject"],
                                          ));
                                    } else {
                                      Get.to(() => const DemoPage());
                                    }
                                  },
                                  child: Container(
                                    height: 0.057 * height,
                                    width: 0.45 * width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 7,
                                            offset: Offset(1, 2))
                                      ],
                                      color: Colors.green,
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        right: 20.0,
                                      ),
                                      child: Text(
                                        "Continue",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeInRight(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: SizedBox(
                      width: width,
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(() => const CheckAssignmentPage());
                              },
                              child: Container(
                                height: 0.25 * height,
                                width: 0.5 * width,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 7,
                                          offset: Offset(1, 2))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "images/assignment.png",
                                      height: 0.12 * height,
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Assignments",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(() => const StudentQuizPage());
                              },
                              child: Container(
                                height: 0.25 * height,
                                width: 0.5 * width,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 7,
                                          offset: Offset(1, 2))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "images/choose.png",
                                      height: 0.12 * height,
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Quiz",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                // FadeInRight(
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 15.0, right: 15.0, top: 30.0),
                //     child: Text(
                //       "Hey ${snapshot.data!["name"]}",
                //       style: GoogleFonts.poppins(
                //           fontSize: 13, fontWeight: FontWeight.w500),
                //     ),
                //   ),
                // )

                ,
                FadeInLeft(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
                    child: Container(
                      height: 0.25 * height,
                      width: width,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                offset: Offset(1, 2))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Study score",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${snapshot.data!["score"]}",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Not Good",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Score tips",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const DemoPage());
                                  },
                                  child: Container(
                                    height: 0.057 * height,
                                    width: 0.45 * width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 7,
                                            offset: Offset(1, 2))
                                      ],
                                      color: Colors.orange,
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        right: 20.0,
                                      ),
                                      child: Text(
                                        "Improve score",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FadeInLeft(
              child: FloatingActionButton.extended(
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  Get.to(() => const StudyPage());
                },
                label: Text(
                  "Study",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                icon: const ImageIcon(
                  AssetImage("images/book.png"),
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
