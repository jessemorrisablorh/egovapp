import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentsDetailsPage extends StatefulWidget {
  const StudentsDetailsPage({super.key});

  @override
  State<StudentsDetailsPage> createState() => _StudentsDetailsPageState();
}

class _StudentsDetailsPageState extends State<StudentsDetailsPage> {
  final List<String> grades = ["1", "2", "3"];
  final List<String> electives = [
    'Elective Mathematics',
    'Geography',
    'Economics',
    'Government',
    'History',
    'Christian Religious Studies',
    'Literature In English',
    'Cost Accounting',
    'Financial Accounting',
    'Business Management',
    'French',
    'Biology',
    'Elective Physics',
    'Chemisty',
    'Technical Drawing',
    'Applied Electricity',
    'Agricultural Science',
    'General Knwoledge in Art',
    'Graphic Designing',
    'Sculpture',
    'Leather Works',
    'Trade Science',
    'Physics',
  ];
  String? selectedelectiveone;
  String? selectedelectivetwo;
  String? selectedelectivethree;
  String? selectedelectivefour;
  String? selectedgrade;
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  User? user = FirebaseAuth.instance.currentUser;
  String gradehint = "Class / Form";
  String electiveonehint = "Elective One";
  String electivetwohint = "Elective Two";
  String electivethreehint = "Elective Three";
  String electivefourhint = "Elective Four";
  bool gradeerror = false;
  bool electiveoneerror = false;
  bool electivetwoerror = false;
  bool electivethreeerror = false;
  bool electivefourerror = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInUp(
                  child: Image.asset(
                    "images/student.png",
                    height: 0.15 * height,
                  ),
                ),
                const SizedBox(height: 10.0),
                FadeInRight(
                  child: Text("Okay, now tell us about yourself",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                FadeInRight(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.grey[100]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorStyle: TextStyle(fontSize: 0.010)),
                            onTap: () {
                              setState(() {
                                gradeerror = false;
                                gradehint = "Class / Form";
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  gradehint = "Required";
                                  gradeerror = true;
                                });
                                return "Required";
                              }
                              return null;
                            },
                            iconSize: 0,
                            hint: Text(
                              gradehint,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: gradeerror == true
                                    ? Colors.red
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: selectedgrade,
                            items: grades.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedgrade = newValue;
                              });
                            },
                          ),
                        ),
                      )),
                ),
                FadeInRight(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.grey[100]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorStyle: TextStyle(fontSize: 0.010)),
                            onTap: () {
                              setState(() {
                                electiveoneerror = false;
                                electiveonehint = "Elective One";
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  electiveonehint = "Required";
                                  electiveoneerror = true;
                                });
                                return "Required";
                              }
                              return null;
                            },
                            iconSize: 0,
                            hint: Text(
                              electiveonehint,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: electiveoneerror == true
                                    ? Colors.red
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: selectedelectiveone,
                            items: electives.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedelectiveone = newValue;
                              });
                            },
                          ),
                        ),
                      )),
                ),
                FadeInRight(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.grey[100]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorStyle: TextStyle(fontSize: 0.010)),
                            onTap: () {
                              setState(() {
                                electivetwoerror = false;
                                electivetwohint = "Elective Two";
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  electivetwohint = "Required";
                                  electivetwoerror = true;
                                });
                                return "Required";
                              }
                              return null;
                            },
                            iconSize: 0,
                            hint: Text(
                              electivetwohint,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: electivetwoerror == true
                                    ? Colors.red
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: selectedelectivetwo,
                            items: electives.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedelectivetwo = newValue;
                              });
                            },
                          ),
                        ),
                      )),
                ),
                FadeInRight(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.grey[100]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorStyle: TextStyle(fontSize: 0.010)),
                            onTap: () {
                              setState(() {
                                electivethreeerror = false;
                                electivethreehint = "Elective One";
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  electivethreehint = "Required";
                                  electivethreeerror = true;
                                });
                                return "Required";
                              }
                              return null;
                            },
                            iconSize: 0,
                            hint: Text(
                              electivethreehint,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: electivethreeerror == true
                                    ? Colors.red
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: selectedelectivethree,
                            items: electives.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedelectivethree = newValue;
                              });
                            },
                          ),
                        ),
                      )),
                ),
                FadeInRight(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.grey[100]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorStyle: TextStyle(fontSize: 0.010)),
                            onTap: () {
                              setState(() {
                                electivefourerror = false;
                                electivefourhint = "Elective One";
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  electivefourhint = "Required";
                                  electivefourerror = true;
                                });
                                return "Required";
                              }
                              return null;
                            },
                            iconSize: 0,
                            hint: Text(
                              electivefourhint,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: electivefourerror == true
                                    ? Colors.red
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: selectedelectivefour,
                            items: electives.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedelectivefour = newValue;
                              });
                            },
                          ),
                        ),
                      )),
                ),
                FadeInRight(
                  child: InkWell(
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
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "studentdetails": true,
                            "class": selectedgrade,
                            "electiveone": selectedelectiveone,
                            "electivetwo": selectedelectivetwo,
                            "electivethree": selectedelectivethree,
                            "electivefour": selectedelectivefour,
                          }).then((value) {
                            setState(() {
                              loading = false;
                            });
                          });
                        } catch (e) {
                          setState(() {
                            loading = false;
                          });
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 20.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.deepPurple),
                        alignment: Alignment.center,
                        child: loading == true
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 3),
                              )
                            : Text(
                                "Continue",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                    ),
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
