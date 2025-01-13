import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckAssignmentPage extends StatefulWidget {
  const CheckAssignmentPage({super.key});

  @override
  State<CheckAssignmentPage> createState() => _CheckAssignmentPageState();
}

class _CheckAssignmentPageState extends State<CheckAssignmentPage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: ImageIcon(AssetImage("images/filter.png"),
                  size: 20, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: ImageIcon(AssetImage("images/calendar.png"),
                  size: 20, color: Colors.white),
            ),
          ],
          elevation: 0,
          title: Text(
            "Assignments",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("assignments")
                .where("uid", isEqualTo: user?.uid)
                .where("completed", isEqualTo: false)
                .orderBy("datecreated", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: FadeInUp(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadeInRight(
                          child: Image.asset("images/assignment.png",
                              height: 0.20 * height),
                        ),
                        const SizedBox(height: 20),
                        FadeInRight(
                          child: Text("Oh oh !!",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 10),
                        FadeInRight(
                          child: Text("No assignment available\nat the moment",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingPage();
              }
              return snapshot.data!.docs.isEmpty
                  ? Center(
                      child: FadeInUp(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("images/assignment.png",
                                height: 0.20 * height),
                            const SizedBox(height: 20),
                            Text("Oh oh !!",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text("No assignment available\nat the moment",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    )
                  : Container();
            }));
  }
}
