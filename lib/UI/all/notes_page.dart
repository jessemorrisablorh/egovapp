import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/all/create_new_note_page.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: Text(
          "Notes",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        actions: [
          FadeInRight(
            child: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: ImageIcon(
                AssetImage("images/search.png"),
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: ImageIcon(
              AssetImage("images/filter.png"),
              color: Colors.white,
              size: 20,
            ),
          ),
          FadeInRight(
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: ImageIcon(
                AssetImage("images/calendar.png"),
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("notes")
              .where("uid", isEqualTo: user?.uid)
              .orderBy("datecreated", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const LoadingPage();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingPage();
            }
            return snapshot.data!.docs.isEmpty
                ? Center(
                    child: FadeInRight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("images/empty.png",
                              height: 0.20 * height),
                          const SizedBox(height: 20),
                          Text("Oh oh !!",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Text(
                              "Your note list is empty,\ntap on the button below to add new",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return FadeInUp(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                      "${snapshot.data!.docs[index]["daycreated"]} - ${snapshot.data!.docs[index]["monthcreated"]} - ${snapshot.data!.docs[index]["yearcreated"]}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                children: [
                                  Text(snapshot.data!.docs[index]["title"],
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        snapshot.data!.docs[index]["details"],
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return FadeInUp(
                          child: const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Divider(),
                      ));
                    },
                  );
          }),
      floatingActionButton: FadeInLeft(
        child: FloatingActionButton.extended(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              Get.to(() => const CreateNewNotePage());
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: Text("New",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500))),
      ),
    );
  }
}
