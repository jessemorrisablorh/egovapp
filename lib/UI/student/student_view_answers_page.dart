import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/all/screen_controller_page.dart';
import 'package:egov/UI/student/view_attached_questions_page.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentViewAnswersPage extends StatefulWidget {
  const StudentViewAnswersPage({super.key});

  @override
  State<StudentViewAnswersPage> createState() => _StudentViewAnswersPageState();
}

class _StudentViewAnswersPageState extends State<StudentViewAnswersPage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Answers",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("objectives")
              .where("uid", isEqualTo: user?.uid)
              .where("subject", isEqualTo: "Agricultural Science")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const LoadingPage();
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40.0),
                        const Divider(),
                        Row(
                          children: [
                            Text("Your answers",
                                style: GoogleFonts.poppins(
                                    fontSize: 13, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1. ${snapshot.data!.docs[index]["1"]}"),
                            Text("2. ${snapshot.data!.docs[index]["2"]}"),
                            Text("3. ${snapshot.data!.docs[index]["3"]}"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1. ${snapshot.data!.docs[index]["4"]}"),
                            Text("2. ${snapshot.data!.docs[index]["5"]}"),
                            Text("3. ${snapshot.data!.docs[index]["6"]}"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Original answers",
                                style: GoogleFonts.poppins(
                                    fontSize: 13, fontWeight: FontWeight.w500)),
                            InkWell(
                              onTap: () {
                                Get.to(() => const ViewAttachedQuestionsPage());
                              },
                              child: Text("View with questions",
                                  style: GoogleFonts.poppins(
                                      color: Colors.deepPurple,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1. b"),
                            Text("2. b"),
                            Text("3. b"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1. d"),
                            Text("2. b"),
                            Text("3. b"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        Row(
                          children: [
                            Text("Score",
                                style: GoogleFonts.poppins(
                                    fontSize: 13, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 50),
                        Text(
                          "${85} %",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(height: 10),
                        Text("Great",
                            style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                  );
                });
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 15.0, right: 20.0),
        child: InkWell(
          onTap: () {
            Get.offAll(() => const ScreenControllerPage());
          },
          child: Container(
            height: 0.055 * height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text("Go home",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
