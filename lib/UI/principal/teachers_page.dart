import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/principal/teacher_details_page.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminTeachersPage extends StatefulWidget {
  const AdminTeachersPage({super.key});

  @override
  State<AdminTeachersPage> createState() => _AdminTeachersPageState();
}

class _AdminTeachersPageState extends State<AdminTeachersPage> {
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
          "Teachers",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Get.to(() => const ScorePage());
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: ImageIcon(AssetImage("images/search.png"),
                  size: 21, color: Colors.white),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where("role", isEqualTo: "teacher")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const LoadingPage();
            }
            return snapshot.data!.docs.isEmpty
                ? FadeInUp(
                    child: Container(
                      height: height,
                      width: width,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/teacher.png",
                            height: 0.15 * height,
                          ),
                          const SizedBox(height: 10),
                          Text("Teachers list is empty",
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 5.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => AdminTeacherDetailsPage(
                                  daycreated: snapshot.data!.docs[index]
                                      ["daycreated"],
                                  monthcreated: snapshot.data!.docs[index]
                                      ["monthcreated"],
                                  yearcreated: snapshot.data!.docs[index]
                                      ["yearcreated"],
                                  uid: snapshot.data!.docs[index]["uid"],
                                  name: snapshot.data!.docs[index]["name"],
                                  grade: snapshot.data!.docs[index]["class"],
                                  schoolname: snapshot.data!.docs[index]
                                      ["schoolname"],
                                  electiveone: snapshot.data!.docs[index]
                                      ["electiveone"],
                                  electivetwo: snapshot.data!.docs[index]
                                      ["electivetwo"],
                                  electivethree: snapshot.data!.docs[index]
                                      ["electivethree"],
                                  electivefour: snapshot.data!.docs[index]
                                      ["electivefour"],
                                  role: snapshot.data!.docs[index]["role"],
                                  score: snapshot.data!.docs[index]["score"],
                                  schoolzone: snapshot.data!.docs[index]
                                      ["schoolzone"],
                                  localgoevrnment: snapshot.data!.docs[index]
                                      ["localgovernment"],
                                  email: snapshot.data!.docs[index]["email"],
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 7,
                                      offset: Offset(1, 2))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          snapshot.data!.docs[index]["name"],
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          snapshot.data!.docs[index]
                                              ["schoolname"],
                                          style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.docs.length);
          }),
    );
  }
}
