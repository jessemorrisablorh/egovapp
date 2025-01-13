import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentPossibleAnswersPage extends StatefulWidget {
  final List? answers;
  final String? initialData;
  final String? subjectid;
  final String? questionid;
  const StudentPossibleAnswersPage(
      {super.key,
      @required this.answers,
      @required this.initialData,
      @required this.subjectid,
      @required this.questionid});

  @override
  State<StudentPossibleAnswersPage> createState() =>
      _StudentPossibleAnswersPageState();
}

class _StudentPossibleAnswersPageState
    extends State<StudentPossibleAnswersPage> {
  bool answered = false;
  bool loading = false;
  String selectedanswer = "";
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
          "Possible answers",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                itemCount: widget.answers!.length,
                itemBuilder: (context, index) {
                  return FadeInUp(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          answered = true;
                          selectedanswer = widget.answers?[index]["alphabet"];
                        });
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
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
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                bottom: 15.0,
                                top: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      "${widget.answers?[index]["alphabet"]}. ${widget.answers?[index]["words"]}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(width: 5),
                                Visibility(
                                    visible: selectedanswer ==
                                        widget.answers?[index]["alphabet"],
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.deepPurple,
                                      size: 20,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 20.0),
        child: FadeInUp(
          child: InkWell(
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
                await FirebaseFirestore.instance
                    .collection("objectives")
                    .doc(widget.subjectid)
                    .set({"questionnumber": selectedanswer}).then((value) {
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
            },
            child: Container(
                height: 0.055 * height,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 7,
                          offset: Offset(1, 2))
                    ]),
                alignment: Alignment.center,
                child: loading == true
                    ? Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        answered == true
                            ? "Proceed with answer as $selectedanswer"
                            : "Proceed",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500))),
          ),
        ),
      ),
    );
  }
}
