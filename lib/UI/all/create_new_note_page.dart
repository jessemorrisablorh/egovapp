import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewNotePage extends StatefulWidget {
  const CreateNewNotePage({super.key});

  @override
  State<CreateNewNotePage> createState() => _CreateNewNotePageState();
}

class _CreateNewNotePageState extends State<CreateNewNotePage> {
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool loading = false;
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
        elevation: 0,
        title: Text(
          "New note",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 20.0),
                  child: Container(
                    width: width,
                    height: 0.055 * height,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 7,
                              offset: Offset(1, 2))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: TextFormField(
                        controller: title,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Title",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 25.0),
                  child: Container(
                    width: width,
                    height: 0.4 * height,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 7,
                              offset: Offset(1, 2))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        maxLines: 100,
                        controller: details,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Note",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
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
                        DocumentReference reference = FirebaseFirestore.instance
                            .collection("notes")
                            .doc();
                        reference.set({
                          "id": reference.id,
                          "uid": user?.uid,
                          "title": title.text.trim(),
                          "details": details.text.trim(),
                          "datecreated": DateTime.now(),
                          "daycreated": DateTime.now().day,
                          "monthcreated": DateTime.now().month,
                          "yearcreated": DateTime.now().year,
                        }).then((value) {
                          setState(() {
                            loading = false;
                          });
                          Get.back();
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
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(5),
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
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : Text("Save new note",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
