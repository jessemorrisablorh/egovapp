import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/edit_user_details_page.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
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
          "Your details",
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
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Class / Form",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Text(
                                snapshot.data?["class"],
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Your elective subjects",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 15.0),
                          Row(
                            children: [
                              Text(
                                snapshot.data?["electiveone"],
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            children: [
                              Text(
                                snapshot.data?["electivetwo"],
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            children: [
                              Text(
                                snapshot.data?["electivethree"],
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            children: [
                              Text(
                                snapshot.data?["electivefour"],
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                      child: Divider(),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: Colors.deepPurple,
                  onPressed: () {
                    Get.to(() => EditUserDetailsPage(
                          grade: snapshot.data?["class"],
                          electiveone: snapshot.data?["electiveone"],
                          electivetwo: snapshot.data?["electivetwo"],
                          electivethree: snapshot.data?["electivethree"],
                          electivefour: snapshot.data?["electivefour"],
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
