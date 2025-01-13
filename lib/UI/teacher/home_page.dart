import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/all/login_page.dart';
import 'package:egov/UI/all/notes_page.dart';
import 'package:egov/UI/all/profile_page.dart';
import 'package:egov/UI/score_page.dart';
import 'package:egov/UI/all/share_page.dart';
import 'package:egov/UI/teacher/quiz_page.dart';
import 'package:egov/UI/teacher/students_page.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TeachersHomePage extends StatefulWidget {
  const TeachersHomePage({super.key});

  @override
  State<TeachersHomePage> createState() => _TeachersHomePageState();
}

class _TeachersHomePageState extends State<TeachersHomePage> {
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
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              iconTheme: const IconThemeData(color: Colors.white),
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
                                    image:
                                        AssetImage("images/teacherheader.jpg"),
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
                          Get.to(() => const SharePage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 40.0),
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
                    ],
                  ),
                )),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0),
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const TeacherQuizPage());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                      child: Container(
                        height: 0.20 * height,
                        width: 0.20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/choose.png",
                                height: 0.10 * height,
                              ),
                              const SizedBox(height: 10),
                              Text("Quiz",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const ScorePage());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                      child: Container(
                        height: 0.20 * height,
                        width: 0.20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/star.png",
                                height: 0.10 * height,
                              ),
                              const SizedBox(height: 10),
                              Text("Score",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const TeacherStudentsPage());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 5.0, bottom: 5.0, top: 5.0),
                      child: Container(
                        height: 0.20 * height,
                        width: 0.20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/student.png",
                                height: 0.10 * height,
                              ),
                              const SizedBox(height: 10),
                              Text("Students",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const NotesPage());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, bottom: 5.0, top: 5.0),
                      child: Container(
                        height: 0.20 * height,
                        width: 0.20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/note.png",
                                height: 0.10 * height,
                              ),
                              const SizedBox(height: 10),
                              Text("Notes",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const ProfilePage());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0, top: 15.0),
                      child: Container(
                        height: 0.20 * height,
                        width: 0.20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/profile.png",
                                height: 0.10 * height,
                              ),
                              const SizedBox(height: 10),
                              Text("Profile",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
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
                                        borderRadius: BorderRadius.circular(10),
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
                                            child: CircularProgressIndicator(
                                              color: Colors.deepPurple,
                                              strokeWidth: 3,
                                            ))
                                        : Text("Yes, proceed",
                                            style: GoogleFonts.poppins(
                                                color: Colors.deepPurple,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500))),
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
                                        borderRadius: BorderRadius.circular(10),
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
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Container(
                        height: 0.20 * height,
                        width: 0.20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/exit.png",
                                height: 0.10 * height,
                              ),
                              const SizedBox(height: 10),
                              Text("Sign out",
                                  style: GoogleFonts.poppins(
                                      color: Colors.red,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
