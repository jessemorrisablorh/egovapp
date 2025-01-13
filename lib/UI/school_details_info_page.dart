import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/student/edit_school_details_page.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SchoolDetailsInfoPage extends StatefulWidget {
  const SchoolDetailsInfoPage({super.key});

  @override
  State<SchoolDetailsInfoPage> createState() => _SchoolDetailsInfoPageState();
}

class _SchoolDetailsInfoPageState extends State<SchoolDetailsInfoPage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: Text(
          "Your school's details",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamBuilder(
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
              body: FadeInUp(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 15.0),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Row(
                          children: [
                            Text(
                              snapshot.data?["schoolname"],
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Text(
                            "Zone",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Row(
                          children: [
                            Text(
                              snapshot.data?["schoolzone"],
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Text(
                            "Local Government",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Row(
                          children: [
                            Text(
                              snapshot.data?["localgovernment"],
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: Colors.deepPurple,
                  onPressed: () {
                    Get.to(() => EditSchoolDetailsPage(
                          name: snapshot.data?["schoolname"],
                          zone: snapshot.data?["schoolzone"],
                          localgovernment: snapshot.data?["localgovernment"],
                        ));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 21,
                  ),
                  label: Text("Edit details",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500))),
            );
          }),
    );
  }
}
