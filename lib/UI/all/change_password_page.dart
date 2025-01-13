import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  TextEditingController olpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  String emailtext = "";
  String passwordtext = "";
  getUSerDetails() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      setState(() {
        emailtext = value["email"];
        passwordtext = value["password"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUSerDetails();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "Change password",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInUp(
                  child: Image.asset(
                    "images/password.png",
                    height: 0.10 * height,
                  ),
                ),
                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 40.0),
                    child: Container(
                      height: 0.055 * height,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                offset: Offset(1, 2))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Row(
                          children: [
                            const ImageIcon(AssetImage("images/password.png")),
                            const SizedBox(width: 15),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Required";
                                  }
                                  return null;
                                },
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                                controller: olpassword,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Old password",
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0),
                    child: Container(
                      height: 0.055 * height,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                offset: Offset(1, 2))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Row(
                          children: [
                            const ImageIcon(AssetImage("images/password.png")),
                            const SizedBox(width: 15),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Required";
                                  } else {
                                    if (newpassword.text.length <= 8) {
                                      return "Weak password";
                                    }
                                  }
                                  return null;
                                },
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                                controller: newpassword,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "New password",
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  child: InkWell(
                    onTap: () {
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
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailtext, password: passwordtext)
                              .then((value) {
                            FirebaseAuth.instance.currentUser!
                                .updatePassword(newpassword.text.trim())
                                .then((newvalue) {
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(user?.uid)
                                  .update({
                                "password": newpassword.text.trim()
                              }).then((val) {
                                setState(() {
                                  loading = false;
                                  olpassword.clear();
                                  newpassword.clear();
                                });
                                Get.snackbar("", "",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    messageText: Text(
                                      "Password chamged successfully",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ));
                              });
                            });
                          });
                        } catch (e) {
                          setState(() {
                            loading = false;
                            olpassword.clear();
                            newpassword.clear();
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
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 30.0),
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
                                  height: 25,
                                  width: 25,
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                              : Text("Continue",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))),
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
