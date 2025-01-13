import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/all/change_password_page.dart';
import 'package:egov/UI/all/demo_page.dart';
import 'package:egov/UI/school_details_info_page.dart';
import 'package:egov/UI/user_details_page.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
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
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 0.30 * height,
                      width: width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(snapshot.data?["role"] == "student"
                                      ? "images/header.jpg"
                                      : snapshot.data?["role"] == "admin"
                                          ? "images/adminheader.jpg"
                                          : "images/teacherheader.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                        height: 0.30 * height,
                        width: width,
                        color: Colors.black45),
                    FadeInLeft(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0, left: 15.0),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 0.055 * height,
                            width: 0.26 * width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white70),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Back",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  color: Colors.deepPurple,
                  width: width,
                  height: 5,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: FadeInRight(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 15.0),
                          child: Text(
                            snapshot.data?["email"],
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          width: 300,
                          height: 10,
                          child: Divider(
                            color: Colors.deepPurple,
                            height: 10,
                          ),
                        ),
                        Visibility(
                          visible: snapshot.data?["role"] == "student",
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const UserDetailsPage());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 35.0,
                                  bottom: 15.0),
                              child: Row(
                                children: [
                                  const ImageIcon(
                                    AssetImage("images/student.png"),
                                    size: 22,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      "Your Details",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: snapshot.data?["role"] == "student",
                            child: const Divider()),
                        Visibility(
                          visible: snapshot.data?["role"] == "student",
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const SchoolDetailsInfoPage());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 15.0,
                                  bottom: 15.0),
                              child: Row(
                                children: [
                                  const ImageIcon(
                                    AssetImage("images/school.png"),
                                    size: 22,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      "Your school's Details",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: snapshot.data?["role"] == "student",
                            child: const Divider()),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ChangePasswordPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 15.0,
                                bottom: 15.0),
                            child: Row(
                              children: [
                                const ImageIcon(
                                  AssetImage("images/password.png"),
                                  size: 22,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    "Change password",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {
                            Get.to(() => const DemoPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 15.0,
                                bottom: 15.0),
                            child: Row(
                              children: [
                                const ImageIcon(
                                  AssetImage("images/team.png"),
                                  size: 22,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    "Help",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
            floatingActionButton: FadeInLeft(
              child: FloatingActionButton.extended(
                  backgroundColor: Colors.deepPurple,
                  onPressed: () {
                    Get.to(() => const DemoPage());
                  },
                  icon: const ImageIcon(
                    AssetImage("images/write.png"),
                    color: Colors.white,
                  ),
                  label: Text("Support",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500))),
            ),
          );
        });
  }
}
