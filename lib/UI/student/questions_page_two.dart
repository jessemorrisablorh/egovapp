import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/all/demo_page.dart';
import 'package:egov/UI/student/number_of_questions_limit_page.dart';
import 'package:egov/UI/student/questions_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentQuestionPageTwo extends StatefulWidget {
  final String? subject;
  const StudentQuestionPageTwo({super.key, @required this.subject});

  @override
  State<StudentQuestionPageTwo> createState() => _StudentQuestionPageTwoState();
}

class _StudentQuestionPageTwoState extends State<StudentQuestionPageTwo> {
  User? user = FirebaseAuth.instance.currentUser;
  String answerfour = "";
  String answerfive = "";
  String answersix = "";
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
                            "Farm Records and Budgeting",
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
                            "4. Which of the following is NOT a type of farm record?",
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
                          answerfour = "a";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"4": answerfour});
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
                              "A. Production record",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerfour == "a",
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
                          answerfour = "b";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"4": answerfour});
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
                              "B. Expense record",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerfour == "b",
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
                          answerfour = "c";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"4": answerfour});
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
                              "C. Marketing record",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerfour == "c",
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
                          answerfour = "d";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"4": answerfour});
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
                              "D. Weather record",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerfour == "d",
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
                            "Agricultural Marketing",
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
                            "5. What is a key benefit of cooperatives in agricultural marketing?",
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
                          answerfive = "a";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"5": answerfive});
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
                              "A. Elimination of transportation costs",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerfive == "a",
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
                          answerfive = "b";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"5": answerfive});
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
                              "B. Reduction of middlemen in the supply chain",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerfive == "b",
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
                          answerfive = "c";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"5": answerfive});
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
                              "C. Decreased government intervention",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerfive == "c",
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
                          answerfive = "d";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"5": answerfive});
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
                              "D. Increased taxation on agricultural products",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answerfive == "d",
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
                            "Agricultural Policies",
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
                            "6. What is the primary purpose of subsidies in agriculture?",
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
                          answersix = "a";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"6": answersix});
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
                              "A. To increase the cost of farming inputs",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answersix == "a",
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
                          answersix = "b";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"6": answersix});
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
                              "B. To support farmers by reducing production costs",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answersix == "b",
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
                          answersix = "c";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"6": answersix});
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
                              "C. To decrease agricultural exports",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answersix == "c",
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
                          answersix = "d";
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("objectives")
                              .doc(widget.subject)
                              .update({"6": answersix});
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
                              "D. To impose taxes on large farms",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Visibility(
                            visible: answersix == "d",
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
                              Get.to(() => StudentQestionPage(
                                    subject: widget.subject,
                                  ));
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
                                child: Text("Previous",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const NumberOfQuestionsLimitPage());
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
  }
}
