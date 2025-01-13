import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminStudentDetails extends StatefulWidget {
  final int? daycreated;
  final int? monthcreated;
  final int? yearcreated;
  final String? uid;
  final String? name;
  final String schoolname;
  final String? schoolzone;
  final String? role;
  final String? localgoevrnment;
  final String? grade;
  final String? electiveone;
  final String? electivetwo;
  final String? electivethree;
  final String? electivefour;
  final int? score;
  final String? email;
  const AdminStudentDetails(
      {super.key,
      @required this.daycreated,
      @required this.monthcreated,
      @required this.yearcreated,
      @required this.uid,
      @required this.name,
      @required required this.schoolname,
      @required this.schoolzone,
      @required this.role,
      @required this.localgoevrnment,
      @required this.grade,
      @required this.electiveone,
      @required this.electivetwo,
      @required this.electivethree,
      @required this.electivefour,
      @required this.score,
      @required this.email});

  @override
  State<AdminStudentDetails> createState() => _AdminStudentDetailsState();
}

class _AdminStudentDetailsState extends State<AdminStudentDetails> {
  bool loading = false;
  String selectedrole = "student";
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
          "Details",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.bottomSheet(StatefulBuilder(builder: (context, setState) {
                return BottomSheet(
                    onClosing: () {},
                    builder: (context) {
                      return Container(
                        height: 0.50 * height,
                        width: width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                        child: Column(
                          children: [
                            Container(
                              height: 0.055 * height,
                              width: width,
                              decoration: const BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8))),
                              alignment: Alignment.center,
                              child: Text("Role",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedrole = "student";
                                    });
                                  },
                                  child: SizedBox(
                                    height: 0.055 * height,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text("Student",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Visibility(
                                            visible: selectedrole == "student",
                                            child: const Icon(Icons.check,
                                                color: Colors.deepPurple),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedrole = "teacher";
                                    });
                                  },
                                  child: SizedBox(
                                    height: 0.055 * height,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text("Teacher",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Visibility(
                                            visible: selectedrole == "teacher",
                                            child: const Icon(Icons.check,
                                                color: Colors.deepPurple),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedrole = "principal";
                                    });
                                  },
                                  child: SizedBox(
                                    height: 0.055 * height,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text("Principal",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Visibility(
                                            visible:
                                                selectedrole == "principal",
                                            child: const Icon(Icons.check,
                                                color: Colors.deepPurple),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedrole = "zonaldirector";
                                    });
                                  },
                                  child: SizedBox(
                                    height: 0.055 * height,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text("Zonal Director",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Visibility(
                                            visible:
                                                selectedrole == "zonaldirector",
                                            child: const Icon(Icons.check,
                                                color: Colors.deepPurple),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedrole = "governor";
                                    });
                                  },
                                  child: SizedBox(
                                    height: 0.055 * height,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text("Governor",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Visibility(
                                            visible: selectedrole == "governor",
                                            child: const Icon(Icons.check,
                                                color: Colors.deepPurple),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 10.0, 15.0, 10.0),
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
                                            .collection("users")
                                            .doc(widget.uid)
                                            .update({
                                          "role": selectedrole
                                        }).then((value) {
                                          setState(() {
                                            loading = false;
                                          });
                                          Get.back();
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
                                        width: width,
                                        height: 0.055 * height,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.deepPurple,
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
                                                child:
                                                    const CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 3,
                                                ),
                                              )
                                            : Text("Save",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                      );
                    });
              }));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: ImageIcon(AssetImage("images/student.png"),
                  size: 21, color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
            child: Text("Name",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(widget.name.toString(),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text("Email",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(widget.email.toString(),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text("School",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(widget.schoolname.toString(),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text("Class / Form",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(widget.grade.toString(),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text("Zone",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(widget.schoolzone.toString(),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text("Local government",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(widget.localgoevrnment.toString(),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text("Sign up date",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8),
            child: Text(
                "${widget.daycreated} - ${widget.monthcreated} - ${widget.yearcreated}",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
