import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/all/demo_page.dart';
import 'package:egov/UI/student/questions_page_two.dart';
//import 'package:egov/UI/student/questions_page_two.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentQestionPage extends StatefulWidget {
  final String? subject;
  const StudentQestionPage({super.key, @required this.subject});

  @override
  State<StudentQestionPage> createState() => _StudentQestionPageState();
}

class _StudentQestionPageState extends State<StudentQestionPage> {
  String answerone = "";
  String answertwo = "";
  String answerthree = "";
  List data = [
    {
      "id": 1,
      "topic": "Definition and Scope",
      "question": "What is Agricultural Economics primarily concerned with?",
      "answers": [
        {
          "id": "1a",
          "alphabet": "a",
          "words": "Weather patterns and crop yield",
        },
        {
          "id": "1b",
          "alphabet": "b",
          "words": "Applying economic principles to agriculture",
        },
        {
          "id": "1c",
          "alphabet": "c",
          "words": "Global trade policies",
        },
        {"id": "1d", "alphabet": "d", "words": "Urban planning"}
      ],
      "answeralphabet": "b",
      "answerinwords": "Applying economic principles to agriculture"
    },
    {
      "id": 2,
      "topic": "Demand and Supply in Agriculture",
      "question":
          "Which of the following is a factor affecting the demand for agricultural products?",
      "answers": [
        {
          "id": "2a",
          "alphabet": "a",
          "words": "Climate",
        },
        {
          "id": "2b",
          "alphabet": "b",
          "words": "Taste and preferences",
        },
        {
          "id": "2c",
          "alphabet": "c",
          "words": "Technology",
        },
        {"id": "2d", "alphabet": "d", "words": "Availability of fertilizers"}
      ],
      "answeralphabet": "b",
      "answerinwords": "Taste and preferences"
    },
    {
      "id": 3,
      "topic": "Market Structures in Agriculture",
      "question":
          "Which market structure is characterised by many buyers and sellers trading identical products?",
      "answers": [
        {
          "id": "3a",
          "alphabet": "a",
          "words": "Monopoly",
        },
        {
          "id": "3b",
          "alphabet": "b",
          "words": "Perfect Competition",
        },
        {
          "id": "3c",
          "alphabet": "c",
          "words": "Oligopoly",
        },
        {"id": "3d", "alphabet": "d", "words": "Monopsony"},
      ],
      "answeralphabet": "b",
      "answerinwords": "Perfect Competition"
    },
    {
      "id": 4,
      "topic": "Farm Records and Budgeting",
      "question": "Which of the following is NOT a type of farm record?",
      "answers": [
        {
          "id": "4a",
          "alphabet": "a",
          "words": "Production record",
        },
        {
          "id": "4b",
          "alphabet": "b",
          "words": "Expense record",
        },
        {
          "id": "4c",
          "alphabet": "c",
          "words": "Marketing record",
        },
        {"id": "4d", "alphabet": "d", "words": "Weather record"},
      ],
      "answeralphabet": "d",
      "answerinwords": "Weather record"
    },
    {
      "id": 5,
      "topic": "Agricultural Marketing",
      "question":
          "What is a key benefit of cooperatives in agricultural marketing?",
      "answers": [
        {
          "id": "5a",
          "alphabet": "a",
          "words": "Elimination of transportation costs",
        },
        {
          "id": "5b",
          "alphabet": "b",
          "words": "Reduction of middlemen in the supply chain",
        },
        {
          "id": "5c",
          "alphabet": "c",
          "words": "Decreased government intervention",
        },
        {
          "id": "5d",
          "alphabet": "d",
          "words": "Increased taxation on agricultural products"
        },
      ],
      "answeralphabet": "b",
      "answerinwords": "Reduction of middlemen in the supply chain"
    },
    {
      "id": 6,
      "topic": "Agricultural Policies",
      "question": "What is the primary purpose of subsidies in agriculture?",
      "answers": [
        {
          "id": "6a",
          "alphabet": "a",
          "words": "To increase the cost of farming inputs",
        },
        {
          "id": "6b",
          "alphabet": "b",
          "words": "To support farmers by reducing production costs",
        },
        {
          "id": "6c",
          "alphabet": "c",
          "words": "To decrease agricultural exports",
        },
        {
          "id": "6d",
          "alphabet": "d",
          "words": "To impose taxes on large farms"
        },
      ],
      "answeralphabet": "b",
      "answerinwords": "To support farmers by reducing production costs"
    },
  ];

  User? user = FirebaseAuth.instance.currentUser;
  bool showresults = false;
  String ans = "";
  String subjectid = "";
  String objdocid = "";

  createAnswers() async {
    FirebaseFirestore.instance
        .collection("objectives")
        .where("uid", isEqualTo: user?.uid)
        .where("subject", isEqualTo: widget.subject)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        print("data is empty");
        FirebaseFirestore.instance
            .collection("objectives")
            .doc(widget.subject)
            .set({
          "id": widget.subject,
          "uid": user?.uid,
          "subject": widget.subject,
          "datestarted": DateTime.now(),
          "daystarted": DateTime.now().day,
          "monthstarted": DateTime.now().month,
          "yearstarted": DateTime.now().year,
          "datcompleted": DateTime.now(),
          "daycompleted": DateTime.now().day,
          "monthcompleted": DateTime.now().month,
          "yearcompleted": DateTime.now().year,
          "complete": false,
          "1": "",
          "2": "",
          "3": "",
          "4": "",
          "5": "",
          "6": "",
        }).then((value) {
          setState(() {
            objdocid = widget.subject.toString();
          });
        });
        // DocumentReference ref =
        //     FirebaseFirestore.instance.collection("objectives").doc();
        // ref.set({

        // }).then((val) {
        //   setState(() {
        //     objdocid = ref.id;
        //   });
        // });
      } else {
        print("data exist");
        FirebaseFirestore.instance
            .collection("objectives")
            .doc(widget.subject)
            .update({
          "id": widget.subject,
          "uid": user?.uid,
          "subject": widget.subject,
          "datestarted": DateTime.now(),
          "daystarted": DateTime.now().day,
          "monthstarted": DateTime.now().month,
          "yearstarted": DateTime.now().year,
          "datcompleted": DateTime.now(),
          "daycompleted": DateTime.now().day,
          "monthcompleted": DateTime.now().month,
          "yearcompleted": DateTime.now().year,
          "complete": false,
          "1": "",
          "2": "",
          "3": "",
          "4": "",
          "5": "",
          "6": "",
        }).then((value) {
          setState(() {
            objdocid = widget.subject.toString();
          });
        });
      }
    });
  }

  /** DocumentReference ref =
        FirebaseFirestore.instance.collection("objectives").doc();
    await ref.set({
      "id": ref.id,
      "uid": user?.uid,
      "subject": widget.subject,
      "datestarted": DateTime.now(),
      "daystarted": DateTime.now().day,
      "monthstarted": DateTime.now().month,
      "yearstarted": DateTime.now().year,
      "datcompleted": DateTime.now(),
      "daycompleted": DateTime.now().day,
      "monthcompleted": DateTime.now().month,
      "yearcompleted": DateTime.now().year,
      "complete": false,
      "1": "",
      "2": "",
      "3": "",
      "4": "",
      "5": "",
      "6": ""
    }).then((val) {
      setState(() {
        objdocid = ref.id;
      });
    }); */

  conditioncheck() {
    if (widget.subject != "Agricultural Science") {
    } else {
      createAnswers();
    }
  }

  @override
  void initState() {
    super.initState();
    conditioncheck();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return widget.subject != "Agricultural Science"
        ? const DemoPage()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                widget.subject.toString(),
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: FadeInUp(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: ListView(
                  children: [
                    const SizedBox(height: 50.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Definition and Scope",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "1. What is Agricultural Economics primarily concerned with",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Tap on the correct answer",
                        style: GoogleFonts.poppins(
                            color: Colors.deepPurple,
                            fontSize: 11,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answerone = "a";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"1": answerone});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "4",
                            "currentanswer": "a",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "A. Weather patterns and crop yield",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerone == "a",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answerone = "b";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"1": answerone});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "4",
                            "currentanswer": "b",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "B. Applying economic principles to agricultur",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerone == "b",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answerone = "c";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"1": answerone});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "4",
                            "currentanswer": "c",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "C. Global trade policies",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerone == "c",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answerone = "d";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"1": answerone});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "4",
                            "currentanswer": "d",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "D. Urban planning",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerone == "d",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Demand and Supply in Agriculture",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "2. Which of the following is a factor affecting the demand for agricultural products?",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Tap on the correct answer",
                        style: GoogleFonts.poppins(
                            color: Colors.deepPurple,
                            fontSize: 11,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answertwo = "a";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"2": answertwo});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "5",
                            "currentanswer": "a",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "A. Climate",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answertwo == "a",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answertwo = "b";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"2": answertwo});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "5",
                            "currentanswer": "b",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "B. Taste and preferences",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answertwo == "b",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answertwo = "c";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"2": answertwo});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "5",
                            "currentanswer": "c",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "C. Technology",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answertwo == "c",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answertwo = "d";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"2": answertwo});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "5",
                            "currentanswer": "d",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "D. Availability of fertilizers",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answertwo == "d",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Market Structures in Agriculture",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "3. Which market structure is characterised by many buyers and sellers trading identical products?",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Tap on the correct answer",
                        style: GoogleFonts.poppins(
                            color: Colors.deepPurple,
                            fontSize: 11,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answerthree = "a";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"3": answerthree});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "6",
                            "currentanswer": "a",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "A. Monopoly",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerthree == "a",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answerthree = "b";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"3": answerthree});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "6",
                            "currentanswer": "b",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "B. Perfect Competition",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerthree == "b",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answerthree = "c";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"3": answerthree});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "6",
                            "currentanswer": "c",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "C. Oligopoly",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerthree == "c",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          answerthree = "d";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"3": answerthree});
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "currentsubject": widget.subject,
                            "currentquestionumber": "6",
                            "currentanswer": "d",
                            "dateanswered": DateTime.now(),
                            "dayanswered": DateTime.now().day,
                            "monthanswered": DateTime.now().month,
                            "yearanswered": DateTime.now().year,
                          });
                        } catch (e) {
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "D. Monopsony",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerthree == "d",
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check,
                                  size: 21,
                                  color: Colors.deepPurple,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => StudentQuestionPageTwo(
                                  subject: widget.subject));
                            },
                            child: Container(
                                width: width,
                                height: 0.055 * height,
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
                                child: Text("Next",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
    // : Scaffold(
    //     backgroundColor: Colors.white,
    //     appBar: AppBar(
    //       backgroundColor: Colors.deepPurple,
    //       iconTheme: const IconThemeData(color: Colors.white),
    //       // leading: InkWell(
    //       //     onTap: () {
    //       //       Get.offAll(() => const TakeQuizPage());
    //       //     },
    //       //     child: const Icon(
    //       //       Icons.arrow_back,
    //       //       color: Colors.white,
    //       //       size: 21,
    //       //     )),
    //       title: Text(
    //         widget.subject.toString(),
    //         overflow: TextOverflow.ellipsis,
    //         style: GoogleFonts.poppins(
    //             color: Colors.white,
    //             fontSize: 14,
    //             fontWeight: FontWeight.w500),
    //       ),

    //       actions: [
    //         Padding(
    //           padding: const EdgeInsets.only(right: 15.0),
    //           child: InkWell(
    //             onTap: () {
    //               if (showresults == false) {
    //                 setState(() {
    //                   showresults = true;
    //                 });
    //               } else {
    //                 if (showresults == true) {
    //                   setState(() {
    //                     showresults = false;
    //                   });
    //                 }
    //               }
    //             },
    //             child: ImageIcon(
    //               AssetImage(
    //                 showresults == false
    //                     ? "images/openeye.png"
    //                     : "images/closeeye.png",
    //               ),
    //               size: 21,
    //               color: Colors.white,
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     body: StreamBuilder(
    //         stream: FirebaseFirestore.instance
    //             .collection("users")
    //             .doc(user?.uid)
    //             .snapshots(),
    //         builder: (context, snapshot) {
    //           if (!snapshot.hasData) {
    //             return LoadingPage();
    //           }
    //           List gg = snapshot.data?["objectives"];
    //           return FadeInUp(
    //             child: ListView.builder(
    //                 itemCount: gg.length,
    //                 itemBuilder: (context, index) {
    //                   return FadeInUp(
    //                     child: InkWell(
    //                       onTap: () async {
    //                         // var res = await Navigator.push(
    //                         //     context,
    //                         //     MaterialPageRoute(
    //                         //         builder: (context) =>
    //                         //             StudentPossibleAnswersPage(
    //                         //               initialData: ans,
    //                         //               answers: gg[index]["answers"],
    //                         //               subjectid: subjectid,
    //                         //               questionid: data[index]["id"],
    //                         //               objid: objdocid,
    //                         //             )));
    //                         // if (res == "ok") {
    //                         //   setState(() {
    //                         //     //data[index]["alphabet"] = "a;"
    //                         //   });
    //                         // }
    //                         print("${[index]}");
    //                         Get.to(() => StudentPossibleAnswersPage(
    //                               initialData: ans,
    //                               answers: gg[index]["answers"],
    //                               subjectid: subjectid,
    //                               questionid: index,
    //                               objid: objdocid,
    //                             ));
    //                       },
    //                       child: Padding(
    //                         padding: const EdgeInsets.fromLTRB(
    //                             10.0, 0.0, 10.0, 5.0),
    //                         child: Container(
    //                           decoration: BoxDecoration(
    //                               color: Colors.white,
    //                               borderRadius: BorderRadius.circular(8),
    //                               boxShadow: const [
    //                                 BoxShadow(
    //                                     color: Colors.black12,
    //                                     blurRadius: 7,
    //                                     offset: Offset(1, 2))
    //                               ]),
    //                           child: Padding(
    //                             padding: const EdgeInsets.only(
    //                                 left: 10.0,
    //                                 right: 10.0,
    //                                 bottom: 15.0,
    //                                 top: 15.0),
    //                             child: Column(
    //                               children: [
    //                                 Row(
    //                                   children: [
    //                                     Expanded(
    //                                       child: Text(
    //                                         gg[index]["question"],
    //                                         //  data[index]["topic"],
    //                                         style: GoogleFonts.poppins(
    //                                             color: Colors.black,
    //                                             fontSize: 13,
    //                                             fontWeight:
    //                                                 FontWeight.bold),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 const SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 Row(
    //                                   children: [
    //                                     Expanded(
    //                                       child: Text(
    //                                         gg[index]["tempans:"] ?? "mk",
    //                                         // data[index]["question"],
    //                                         style: GoogleFonts.poppins(
    //                                             color: Colors.black,
    //                                             fontSize: 13,
    //                                             fontWeight:
    //                                                 FontWeight.w500),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 const SizedBox(
    //                                   height: 8,
    //                                 ),
    //                                 Row(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceBetween,
    //                                   children: [
    //                                     Text(
    //                                       "Answered :",
    //                                       style: GoogleFonts.poppins(
    //                                           color: Colors.black,
    //                                           fontSize: 13,
    //                                           fontWeight: FontWeight.w500),
    //                                     ),
    //                                     const SizedBox(width: 8),
    //                                     Visibility(
    //                                       visible: showresults,
    //                                       child: Row(
    //                                         children: [
    //                                           Text(
    //                                             data[index]
    //                                                 ["answeralphabet"],
    //                                             style: GoogleFonts.poppins(
    //                                                 color: Colors.black,
    //                                                 fontSize: 13,
    //                                                 fontWeight:
    //                                                     FontWeight.w500),
    //                                           ),
    //                                           const SizedBox(
    //                                             width: 10,
    //                                           ),
    //                                           const Icon(
    //                                             Icons.close,
    //                                             color: Colors.red,
    //                                             size: 20,
    //                                           ),
    //                                           const SizedBox(
    //                                             width: 10,
    //                                           ),
    //                                           Text(
    //                                             data[index]
    //                                                 ["answeralphabet"],
    //                                             style: GoogleFonts.poppins(
    //                                                 color: Colors.black,
    //                                                 fontSize: 13,
    //                                                 fontWeight:
    //                                                     FontWeight.w500),
    //                                           ),
    //                                           const SizedBox(
    //                                             width: 10,
    //                                           ),
    //                                           const Icon(
    //                                             Icons.check,
    //                                             color: Colors.green,
    //                                             size: 20,
    //                                           )
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 }),
    //           );
    //         }),
    //     floatingActionButton: Visibility(
    //       visible: showresults,
    //       child: FloatingActionButton.extended(
    //           onPressed: () {},
    //           backgroundColor: Colors.deepPurple,
    //           label: Text(
    //             " 5 /  ${data.length}",
    //             style: GoogleFonts.poppins(
    //                 color: Colors.white,
    //                 fontSize: 13,
    //                 fontWeight: FontWeight.w500),
    //           )),
    //     ),
    //   );
  }
}
